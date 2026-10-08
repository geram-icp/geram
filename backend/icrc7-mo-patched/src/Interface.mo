import ICRC7 "service";
import List "mo:base/List";
import Principal "mo:base/Principal";
import Option "mo:base/Option";

module {

  /// Query context provides information about the query execution
  public type QueryContext<T> = {
    args: T;
  };

  /// QueryBeforeHook: Executed before a query. If it returns ?R, the query is short-circuited.
  public type QueryBeforeHook<T, R> = (QueryContext<T>) -> ?R;
  /// QueryAfterHook: Executed after a query. Can transform the result.
  public type QueryAfterHook<T, R> = (QueryContext<T>, R) -> R;

  /// Update context base type 
  public type UpdateContext<T> = {
    caller: Principal;
    args: T;
  };

  public type TransferContext = UpdateContext<[ICRC7.TransferArg]>;
  public type BeforeTransferHook = (TransferContext) -> async* ?[?ICRC7.TransferResult];
  public type AfterTransferHook = (TransferContext, [?ICRC7.TransferResult]) -> async* [?ICRC7.TransferResult];

  public type ICRC7Interface = {
    var beforeName : List.List<(Text, QueryBeforeHook<(), Text>)>;
    var afterName  : List.List<(Text, QueryAfterHook<(), Text>)>;
    var beforeSymbol : List.List<(Text, QueryBeforeHook<(), Text>)>;
    var afterSymbol  : List.List<(Text, QueryAfterHook<(), Text>)>;
    var beforeDescription : List.List<(Text, QueryBeforeHook<(), ?Text>)>;
    var afterDescription  : List.List<(Text, QueryAfterHook<(), ?Text>)>;
    var beforeLogo : List.List<(Text, QueryBeforeHook<(), ?Text>)>;
    var afterLogo  : List.List<(Text, QueryAfterHook<(), ?Text>)>;
    var beforeTotalSupply : List.List<(Text, QueryBeforeHook<(), Nat>)>;
    var afterTotalSupply  : List.List<(Text, QueryAfterHook<(), Nat>)>;
    var beforeSupplyCap : List.List<(Text, QueryBeforeHook<(), ?Nat>)>;
    var afterSupplyCap  : List.List<(Text, QueryAfterHook<(), ?Nat>)>;
    var beforeMaxQueryBatchSize : List.List<(Text, QueryBeforeHook<(), ?Nat>)>;
    var afterMaxQueryBatchSize  : List.List<(Text, QueryAfterHook<(), ?Nat>)>;
    var beforeMaxUpdateBatchSize : List.List<(Text, QueryBeforeHook<(), ?Nat>)>;
    var afterMaxUpdateBatchSize  : List.List<(Text, QueryAfterHook<(), ?Nat>)>;
    var beforeDefaultTakeValue : List.List<(Text, QueryBeforeHook<(), ?Nat>)>;
    var afterDefaultTakeValue  : List.List<(Text, QueryAfterHook<(), ?Nat>)>;
    var beforeMaxTakeValue : List.List<(Text, QueryBeforeHook<(), ?Nat>)>;
    var afterMaxTakeValue  : List.List<(Text, QueryAfterHook<(), ?Nat>)>;
    var beforeAtomicBatchTransfers : List.List<(Text, QueryBeforeHook<(), ?Bool>)>;
    var afterAtomicBatchTransfers  : List.List<(Text, QueryAfterHook<(), ?Bool>)>;
    var beforeMaxMemoSize : List.List<(Text, QueryBeforeHook<(), ?Nat>)>;
    var afterMaxMemoSize  : List.List<(Text, QueryAfterHook<(), ?Nat>)>;
    var beforeTxWindow : List.List<(Text, QueryBeforeHook<(), ?Nat>)>;
    var afterTxWindow  : List.List<(Text, QueryAfterHook<(), ?Nat>)>;
    var beforePermittedDrift : List.List<(Text, QueryBeforeHook<(), ?Nat>)>;
    var afterPermittedDrift  : List.List<(Text, QueryAfterHook<(), ?Nat>)>;
    var beforeCollectionMetadata : List.List<(Text, QueryBeforeHook<(), ICRC7.CollectionMetadataResponse>)>;
    var afterCollectionMetadata  : List.List<(Text, QueryAfterHook<(), ICRC7.CollectionMetadataResponse>)>;
    var beforeTokenMetadata : List.List<(Text, QueryBeforeHook<ICRC7.TokenMetadataRequest, ICRC7.TokenMetadataResponse>)>;
    var afterTokenMetadata  : List.List<(Text, QueryAfterHook<ICRC7.TokenMetadataRequest, ICRC7.TokenMetadataResponse>)>;
    var beforeOwnerOf : List.List<(Text, QueryBeforeHook<ICRC7.OwnerOfRequest, ICRC7.OwnerOfResponse>)>;
    var afterOwnerOf  : List.List<(Text, QueryAfterHook<ICRC7.OwnerOfRequest, ICRC7.OwnerOfResponse>)>;
    var beforeBalanceOf : List.List<(Text, QueryBeforeHook<ICRC7.BalanceOfRequest, ICRC7.BalanceOfResponse>)>;
    var afterBalanceOf  : List.List<(Text, QueryAfterHook<ICRC7.BalanceOfRequest, ICRC7.BalanceOfResponse>)>;
    var beforeTokens : List.List<(Text, QueryBeforeHook<(?Nat, ?Nat), [Nat]>)>;
    var afterTokens  : List.List<(Text, QueryAfterHook<(?Nat, ?Nat), [Nat]>)>;
    var beforeTokensOf : List.List<(Text, QueryBeforeHook<(ICRC7.Account, ?Nat, ?Nat), [Nat]>)>;
    var afterTokensOf  : List.List<(Text, QueryAfterHook<(ICRC7.Account, ?Nat, ?Nat), [Nat]>)>;
    var beforeSupportedStandards : List.List<(Text, QueryBeforeHook<(), ICRC7.SupportedStandardsResponse>)>;
    var afterSupportedStandards  : List.List<(Text, QueryAfterHook<(), ICRC7.SupportedStandardsResponse>)>;
    var beforeTransfer : List.List<(Text, BeforeTransferHook)>;
    var afterTransfer  : List.List<(Text, AfterTransferHook)>;
  };

  public func defaultInterface() : ICRC7Interface {
    {
      var beforeName = null;
      var afterName  = null;
      var beforeSymbol = null;
      var afterSymbol  = null;
      var beforeDescription = null;
      var afterDescription  = null;
      var beforeLogo = null;
      var afterLogo  = null;
      var beforeTotalSupply = null;
      var afterTotalSupply  = null;
      var beforeSupplyCap = null;
      var afterSupplyCap  = null;
      var beforeMaxQueryBatchSize = null;
      var afterMaxQueryBatchSize  = null;
      var beforeMaxUpdateBatchSize = null;
      var afterMaxUpdateBatchSize  = null;
      var beforeDefaultTakeValue = null;
      var afterDefaultTakeValue  = null;
      var beforeMaxTakeValue = null;
      var afterMaxTakeValue  = null;
      var beforeAtomicBatchTransfers = null;
      var afterAtomicBatchTransfers  = null;
      var beforeMaxMemoSize = null;
      var afterMaxMemoSize  = null;
      var beforeTxWindow = null;
      var afterTxWindow  = null;
      var beforePermittedDrift = null;
      var afterPermittedDrift  = null;
      var beforeCollectionMetadata = null;
      var afterCollectionMetadata  = null;
      var beforeTokenMetadata = null;
      var afterTokenMetadata  = null;
      var beforeOwnerOf = null;
      var afterOwnerOf  = null;
      var beforeBalanceOf = null;
      var afterBalanceOf  = null;
      var beforeTokens = null;
      var afterTokens  = null;
      var beforeTokensOf = null;
      var afterTokensOf  = null;
      var beforeSupportedStandards = null;
      var afterSupportedStandards  = null;
      var beforeTransfer = null;
      var afterTransfer  = null;
    }
  };

  /// Execute a query with before/after hooks
  public func executeQuery<T, R>(
    ctx: QueryContext<T>,
    beforeHooks: List.List<(Text, QueryBeforeHook<T, R>)>,
    impl: (QueryContext<T>) -> R,
    afterHooks: List.List<(Text, QueryAfterHook<T, R>)>
  ) : R {
    // Run before hooks
    var currentBefore = beforeHooks;
    var shortCircuitResult : ?R = null;
    label BeforeLoop while (Option.isNull(shortCircuitResult)) {
      switch(currentBefore) {
        case(null) { break BeforeLoop; };
        case(?((_, hook), next)) {
          let hookResult = hook(ctx);
          switch(hookResult) {
            case(?result) { shortCircuitResult := ?result; };
            case(null) { currentBefore := next; };
          };
        };
      };
    };

    var finalResult = switch(shortCircuitResult) {
      case(?result) result;
      case(null) impl(ctx);
    };

    // Run after hooks
    var currentAfter = afterHooks;
    label AfterLoop loop {
      switch(currentAfter) {
        case(null) { break AfterLoop; };
        case(?((_, hook), next)) {
          finalResult := hook(ctx, finalResult);
          currentAfter := next;
        };
      };
    };

    finalResult
  };

  /// Execute Transfer update with before/after hooks
  public func executeTransfer(
    ctx: TransferContext,
    beforeHooks: List.List<(Text, BeforeTransferHook)>,
    impl: (TransferContext) -> async* [?ICRC7.TransferResult],
    afterHooks: List.List<(Text, AfterTransferHook)>
  ) : async* [?ICRC7.TransferResult] {
    // Run before hooks
    var currentBefore = beforeHooks;
    var shortCircuitResult : ?[?ICRC7.TransferResult] = null;
    label BeforeLoop while (Option.isNull(shortCircuitResult)) {
      switch(currentBefore) {
        case(null) { break BeforeLoop; };
        case(?((_, hook), next)) {
          let hookResult = await* hook(ctx);
          switch(hookResult) {
            case(?result) { shortCircuitResult := ?result; };
            case(null) { currentBefore := next; };
          };
        };
      };
    };

    var finalResult = switch(shortCircuitResult) {
      case(?result) result;
      case(null) await* impl(ctx);
    };

    // Run after hooks
    var currentAfter = afterHooks;
    label AfterLoop loop {
      switch(currentAfter) {
        case(null) { break AfterLoop; };
        case(?((_, hook), next)) {
          finalResult := await* hook(ctx, finalResult);
          currentAfter := next;
        };
      };
    };

    finalResult
  };

  public func addBeforeTransfer(
    iface: ICRC7Interface,
    id: Text,
    hook: BeforeTransferHook
  ) {
    iface.beforeTransfer := List.push((id, hook), iface.beforeTransfer);
  };

  public func removeBeforeTransfer(iface: ICRC7Interface, id: Text) {
    let filtered = List.filter<(Text, BeforeTransferHook)>(
      iface.beforeTransfer,
      func(item) = item.0 != id
    );
    iface.beforeTransfer := filtered;
  };

  public func addAfterTransfer(
    iface: ICRC7Interface,
    id: Text,
    hook: AfterTransferHook
  ) {
    iface.afterTransfer := List.push((id, hook), iface.afterTransfer);
  };

  public func removeAfterTransfer(iface: ICRC7Interface, id: Text) {
    let filtered = List.filter<(Text, AfterTransferHook)>(
      iface.afterTransfer,
      func(item) = item.0 != id
    );
    iface.afterTransfer := filtered;
  };
}
