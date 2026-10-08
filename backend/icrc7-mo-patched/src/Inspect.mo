/// ICRC7/Inspect.mo - Message inspection helpers
import Blob "mo:core/Blob";
import Nat "mo:core/Nat";
import Nat64 "mo:core/Nat64";
import Principal "mo:core/Principal";
import Runtime "mo:core/Runtime";
import ICRC7Type "service";

module {
  public type Config = {
    maxMemoSize : Nat;
    maxNatDigits : Nat;
    maxSubaccountSize : Nat;
    maxBatchSize : Nat;
    maxRawArgSize : Nat;
  };

  public let defaultConfig : Config = {
    maxMemoSize = 256;
    maxNatDigits = 40;
    maxSubaccountSize = 32;
    maxBatchSize = 1000;
    maxRawArgSize = 100000;
  };

  public func isValidMemo(memo : ?Blob, config : Config) : Bool {
    switch (memo) {
      case (null) true;
      case (?m) m.size() <= config.maxMemoSize;
    };
  };

  public func isValidSubaccount(sub : ?Blob, config : Config) : Bool {
    switch (sub) {
      case (null) true;
      case (?s) s.size() == config.maxSubaccountSize;
    };
  };

  public func isValidAccount(account : ICRC7Type.Account, config : Config) : Bool {
    isValidSubaccount(account.subaccount, config);
  };

  public func isValidRawArg(arg : Blob, config : Config) : Bool {
    arg.size() <= config.maxRawArgSize;
  };

  public func inspectTransfer(args : ICRC7Type.TransferArg, config : ?Config) : Bool {
    let cfg = switch (config) { case (?c) c; case (null) defaultConfig };
    if (not isValidSubaccount(args.from_subaccount, cfg)) return false;
    if (not isValidAccount(args.to, cfg)) return false;
    if (not isValidMemo(args.memo, cfg)) return false;
    true
  };

  public func inspectBatchTransfer(args : [ICRC7Type.TransferArg], config : ?Config) : Bool {
    let cfg = switch (config) { case (?c) c; case (null) defaultConfig };
    if (args.size() > cfg.maxBatchSize) return false;
    for (arg in args.vals()) {
      if (not inspectTransfer(arg, config)) return false;
    };
    true
  };

  public func inspectBalanceOf(args : ICRC7Type.BalanceOfRequest, config: ?Config) : Bool {
    let cfg = switch (config) { case (?c) c; case (null) defaultConfig };
    if (args.size() > cfg.maxBatchSize) return false;
    true
  };

  public func inspectOwnerOf(args : ICRC7Type.OwnerOfRequest, config: ?Config) : Bool {
    let cfg = switch (config) { case (?c) c; case (null) defaultConfig };
    if (args.size() > cfg.maxBatchSize) return false;
    true
  };

  public func inspectTokenMetadata(args : ICRC7Type.TokenMetadataRequest, config: ?Config) : Bool {
    let cfg = switch (config) { case (?c) c; case (null) defaultConfig };
    if (args.size() > cfg.maxBatchSize) return false;
    true
  };

  public func guardTransfer(args: [ICRC7Type.TransferArg], config: ?Config) {
    if (not inspectBatchTransfer(args, config)) {
      Runtime.trap("Transfer arguments exceed dimensional limits. Potential cycle drain blocked.");
    };
  };

  public func guardBalanceOf(args: ICRC7Type.BalanceOfRequest, config: ?Config) {
    if (not inspectBalanceOf(args, config)) {
      Runtime.trap("BalanceOf arguments exceed dimensional limits.");
    };
  };

  public func guardOwnerOf(args: ICRC7Type.OwnerOfRequest, config: ?Config) {
    if (not inspectOwnerOf(args, config)) {
      Runtime.trap("OwnerOf arguments exceed dimensional limits.");
    };
  };

  public func guardTokenMetadata(args: ICRC7Type.TokenMetadataRequest, config: ?Config) {
    if (not inspectTokenMetadata(args, config)) {
      Runtime.trap("TokenMetadata arguments exceed dimensional limits.");
    };
  };
}
