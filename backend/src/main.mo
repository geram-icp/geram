import Array "mo:base/Array";
import ClassPlus "mo:class-plus";
import ICRC7 "mo:icrc7-mo";
import Principal "mo:base/Principal";
import Time "mo:base/Time";

import ICRC7Mixin "mo:icrc7-mo/mixin";
import Protocol "./Protocol";
import Result "./Result";
import ErrorFactory "./ErrorFactory";
import IDValidator "./ID/Validator";
import Identity "./Identity";
import PrincipalBinding "./PrincipalBinding";
import VerificationRef "./VerificationRef";
import Wallet "./Wallet";
import Account "./Account";

shared ({ caller = _owner }) persistent actor class GERAM() = this {

  transient let canisterId = Principal.fromActor(this);

  transient let org_icdevs_class_plus_manager =
    ClassPlus.ClassPlusInitializationManager<system>(
      _owner,
      canisterId,
      true
    );

  transient let geramEnvironment : ICRC7.Environment = {
    add_ledger_transaction = null;
    can_transfer = null;
    can_mint = null;
    can_update = null;
    can_burn = null;
  };

  func getGeramEnvironment() : ICRC7.Environment {
    geramEnvironment
  };

  transient let geramArgs : ICRC7.InitArgList = {
    deployer = _owner;
    symbol = ?"GERAM";
    name = ?"GERAM";
    description = ?"Global Economic Real Asset Mechanism";
    logo = null;
    supply_cap = null;
    max_query_batch_size = null;
    max_update_batch_size = null;
    default_take_value = null;
    max_take_value = null;
    max_memo_size = null;
    allow_transfers = ?true;
    permitted_drift = null;
    tx_window = null;
    burn_account = null;
    supported_standards = null;
  };

  // GERAM-P02-S02-F14 ? ICRC-7 persistent State
  stable var icrc7State : ?ICRC7.State = null;

  include ICRC7Mixin({
    ICRC7.defaultMixinArgs(org_icdevs_class_plus_manager) with
      initialState = icrc7State;
      args = ?geramArgs;
      pullEnvironment = ?getGeramEnvironment;
      onInitialize = null;
      onStorageChange = ?(func(s : ICRC7.State) {
        icrc7State := ?s;
      });
  });

  // ============================================================
  // GERAM Protocol v1.0 — public type aliases
  // ============================================================

  public type IdentityKind = Identity.IdentityKind;
  public type IdentityStatus = Identity.IdentityStatus;
  public type Identity = Identity.Identity;
  public type PrincipalBinding = PrincipalBinding.PrincipalBinding;
  public type VerificationRef = VerificationRef.VerificationRef;
public type Wallet = Wallet.Wallet;
public type WalletKind = Wallet.WalletKind;
public type WalletStatus = Wallet.WalletStatus;
public type Account = Account.Account;
  public type AccountKind = Account.AccountKind;
  public type AccountStatus = Account.AccountStatus;

  public type AssetStatus = Protocol.AssetStatus;
  public type Asset = Protocol.Asset;
  public type EnergyVerificationStatus = Protocol.EnergyVerificationStatus;
  public type EnergyVerification = Protocol.EnergyVerification;

  public type ProjectType = Protocol.ProjectType;
  public type ProjectStatus = Protocol.ProjectStatus;
  public type RiskLevel = Protocol.RiskLevel;
  public type AssetReference = Protocol.AssetReference;
  public type Valuation = Protocol.Valuation;
  public type FinancialTerms = Protocol.FinancialTerms;
  public type Project = Protocol.Project;
  public type GeramCertificate = Protocol.GeramCertificate;
  public type ContractStatus = Protocol.ContractStatus;
  public type EvidenceStatus = Protocol.EvidenceStatus;
public type Evidence = Protocol.Evidence;
public type VerificationStatus = Protocol.VerificationStatus;

public type EconomicRightStatus = Protocol.EconomicRightStatus;
public type EconomicRight = Protocol.EconomicRight;
public type EconomicRightResult = Protocol.EconomicRightResult;

public type AssignmentStatus = Protocol.AssignmentStatus;
public type Assignment = Protocol.Assignment;
public type AcceptanceStatus = Protocol.AcceptanceStatus;
public type Acceptance = Protocol.Acceptance;
public type AssignmentResult = Protocol.AssignmentResult;
public type AcceptanceResult = Protocol.AcceptanceResult;
public type Verification = Protocol.Verification;

public type EvidenceResult = {
  #ok : Evidence;
  #err : Text;
};

public type VerificationResult = {
  #ok : Verification;
  #err : Text;
};

  public type Contract = Protocol.Contract;
  public type OrganizationRole = Protocol.OrganizationRole;
  public type OrganizationNode = Protocol.OrganizationNode;
  public type MarketSnapshot = Protocol.MarketSnapshot;

  // ============================================================
  // GERAM-HAMIFUND — public type aliases
  // ============================================================

  public type FundType = Protocol.FundType;
  public type FundStatus = Protocol.FundStatus;
  public type FundStrategy = Protocol.FundStrategy;
  public type AIModelReference = Protocol.AIModelReference;
  public type AIStrategyStatus = Protocol.AIStrategyStatus;
  public type FundRiskParameters = Protocol.FundRiskParameters;
  public type HamiFund = Protocol.HamiFund;
  public type FundAsset = Protocol.FundAsset;
  public type FundPosition = Protocol.FundPosition;
  public type FundTransactionType = Protocol.FundTransactionType;
  public type FundTransaction = Protocol.FundTransaction;

  // ============================================================
  // GERAM-P04 — API Result Types
  // ============================================================

  public type AssetResult = {
    #ok : Asset;
    #err : Text;
  };

  // ==========================================================
  // GERAM-F15 ? COLLATERAL & ENCUMBRANCE FOUNDATION
  // ==========================================================

  public type CollateralStatus = {
    #PENDING;
    #ACTIVE;
    #SUSPENDED;
    #RELEASED;
  };

  public type Collateral = {
    collateral_id : Text;
    asset_id : Text;
    project_id : Text;
    contract_id : ?Text;
    collateral_type : Text;
    official_reference : Text;
    authentication_code : Text;
    valuation_reference : Text;
    collateral_value : Nat;
    valuation_timestamp : Int;
    coverage_bps : Nat;
    priority : Nat;
    status : CollateralStatus;
    created_at : Int;
    effective_timestamp : Int;
    release_timestamp : ?Int;
  };

  public type CollateralResult = {
    #ok : Collateral;
    #err : Text;
  };

  public type ValuationStatus = {
    #PENDING;
    #ACTIVE;
    #SUPERSEDED;
    #REVOKED;
  };

  public type ValuationRecord = {
    valuation_id : Text;
    subject_type : Text;
    subject_id : Text;
    project_id : Text;
    base_value : Nat;
    valuation_unit : Text;
    valuation_date : Int;
    expert_reference : ?Text;
    methodology : ?Text;
    document_hash : ?Text;
    status : ValuationStatus;
    version : Nat;
    created_at : Int;
  };

  public type ValuationResult = {
    #ok : ValuationRecord;
    #err : Text;
  };

  // ============================================================
  // GERAM-P07.8 — Certificate Issuance Types
  // ============================================================

  public type IssueCertificateRequest = {
    certificate_id : Text;
    project_id : Text;
    issuer_id : Text;
    initial_holder : Principal;

    maturity_timestamp : Int;
    face_value : Nat;
    base_value : Nat;
    currency : Text;

    icp_value : Nat;
    icp_valuation_timestamp : Int;

    annual_return_bps : ?Nat;
    risk_level : RiskLevel;

    physical_certificate_available : Bool;
    physical_certificate_hash : ?Text;
    qr_reference : ?Text;

    asset_id : ?Text;
    asset_type : ?Text;
    title : ?Text;
    description : ?Text;
    metadata_uri : ?Text;
    external_reference : ?Text;
  };

  public type IssueCertificateResult = {
    #ok : {
      certificate : GeramCertificate;
      token_id : Nat;
      transaction_id : Nat;
    };
    #err : Text;
  };

  public type EnergyVerificationResult = {
    #ok : EnergyVerification;
    #err : Text;
  };

  public type ProjectResult = {
    #ok : Project;
    #err : Text;
  };

  public type CertificateResult = {
    #ok : GeramCertificate;
    #err : Text;
  };

  public type ContractResult = {
    #ok : Contract;
    #err : Text;
  };

  public type MarketSnapshotResult = {
    #ok : MarketSnapshot;
    #err : Text;
  };

  // ============================================================
  // GERAM-HAMIFUND — API Result Types
  // ============================================================

  public type HamiFundResult = {
    #ok : HamiFund;
    #err : Text;
  };

  public type FundAssetResult = {
    #ok : FundAsset;
    #err : Text;
  };

  public type FundPositionResult = {
    #ok : FundPosition;
    #err : Text;
  };

  public type FundTransactionResult = {
    #ok : FundTransaction;
    #err : Text;
  };

  // ============================================================
  // GERAM-P04 — Stable Protocol Registry
  //
  // این Registry هنوز دفتر صدور NFT نیست.
  // فقط لایه داده‌ای Protocol را نگهداری می‌کند.
  // ============================================================

  stable var identities : [Identity] = [];
  stable var principalBindings : [PrincipalBinding] = [];
  stable var verificationRefs : [VerificationRef] = [];

stable var wallets : [Wallet] = [];
stable var accounts : [Account] = [];

  // ==========================================================
  // GERAM-P05 ? Identity Foundation API
  // ==========================================================

  public query func get_wallet(wallet_id : Text) : async ?Wallet {
    switch (IDValidator.validateExpected(wallet_id, #Wallet)) {
      case (#err(_)) { return null; };
      case (#ok(_)) {};
    };
    for (wallet in wallets.vals()) {
      if (wallet.wallet_id == wallet_id) { return ?wallet; };
    };
    null
  };

  public query func get_wallets_by_account(account_id : Text) : async [Wallet] {
    switch (IDValidator.validateExpected(account_id, #Account)) {
      case (#err(_)) { return []; };
      case (#ok(_)) {};
    };
    var result : [Wallet] = [];
    for (wallet in wallets.vals()) {
      if (wallet.account_id == account_id) {
        result := Array.append<Wallet>(result, [wallet]);
      };
    };
    result
  };

  public query func get_account(account_id : Text) : async ?Account {
    switch (IDValidator.validateExpected(account_id, #Account)) {
      case (#err(_)) {
        return null;
      };
      case (#ok(_)) {};
    };

    for (account in accounts.vals()) {
      if (account.account_id == account_id) {
        return ?account;
      };
    };
    null
  };

  public query func get_accounts_by_identity(identity_id : Text) : async [Account] {
    switch (IDValidator.validateExpected(identity_id, #Identity)) {
      case (#err(_)) {
        return [];
      };
      case (#ok(_)) {};
    };

    var result : [Account] = [];
    for (account in accounts.vals()) {
      if (account.identity_id == identity_id) {
        result := Array.append<Account>(result, [account]);
      };
    };
    result
  };

  public query func get_identity(identity_id : Text) : async ?Identity {
    for (identity in identities.vals()) {
      if (identity.identity_id == identity_id) {
        return ?identity;
      };
    };

    null
  };

  public query func get_identity_by_principal(principal_ref : Text) : async ?Identity {
    for (binding in principalBindings.vals()) {
      if (binding.principal_ref == principal_ref and binding.active) {
        for (identity in identities.vals()) {
          if (identity.identity_id == binding.identity_id) {
            return ?identity;
          };
        };
      };
    };

    null
  };

  public query func list_identity_bindings(identity_id : Text) : async [PrincipalBinding] {
    var result : [PrincipalBinding] = [];

    for (binding in principalBindings.vals()) {
      if (binding.identity_id == identity_id) {
        result := Array.append<PrincipalBinding>(result, [binding]);
      };
    };

    result
  };

  public query func get_identity_verifications(identity_id : Text) : async [VerificationRef] {
    var result : [VerificationRef] = [];

    for (verification in verificationRefs.vals()) {
      if (verification.identity_id == identity_id) {
        result := Array.append<VerificationRef>(result, [verification]);
      };
    };

    result
  };


  // ==========================================================
  // GERAM-P05.9.1 ? Identity Mutation API
  // ==========================================================

  public shared ({ caller }) func create_identity(
    identity_id : Text,
    kind : IdentityKind,
    metadata_ref : ?Text,
    now : Int
  ) : async Result.Result<Identity> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Identity creation is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(identity_id, #Identity)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Identity ID; expected IDN namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    for (existing in identities.vals()) {
      if (existing.identity_id == identity_id) {
        return #err(
          ErrorFactory.fromCode(
            #Duplicate,
            "Identity already exists",
            null
          )
        );
      };
    };

    let identity : Identity = {
      identity_id = identity_id;
      kind = kind;
      status = #Pending;
      created_at = now;
      updated_at = now;
      metadata_ref = metadata_ref;
    };

    identities := Array.append<Identity>(identities, [identity]);

    #ok(identity)
  };

  public shared ({ caller }) func create_wallet(
    wallet_id : Text,
    account_id : Text,
    kind : WalletKind,
    metadata_ref : ?Text,
    now : Int
  ) : async Result.Result<Wallet> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Wallet creation is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(wallet_id, #Wallet)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Wallet ID; expected WLT namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    switch (IDValidator.validateExpected(account_id, #Account)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Account ID; expected ACC namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    for (wallet in wallets.vals()) {
      if (wallet.wallet_id == wallet_id) {
        return #err(
          ErrorFactory.fromCode(
            #Duplicate,
            "Wallet already exists",
            null
          )
        );
      };
    };

    var account_found : ?Account = null;

    for (account in accounts.vals()) {
      if (account.account_id == account_id) {
        account_found := ?account;
      };
    };

    switch (account_found) {
      case null {
        return #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Account not found",
            null
          )
        );
      };

      case (?account) {
        switch (account.status) {
          case (#Archived) {
            return #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Archived Account cannot create a Wallet",
                null
              )
            );
          };
          case (_) {};
        };
      };
    };

    let wallet : Wallet = {
      wallet_id = wallet_id;
      account_id = account_id;
      kind = kind;
      status = #Pending;
      created_at = now;
      updated_at = now;
      metadata_ref = metadata_ref;
    };

    wallets := Array.append<Wallet>(wallets, [wallet]);
    #ok(wallet)
  };

  public shared ({ caller }) func update_wallet(
    wallet_id : Text,
    kind : WalletKind,
    metadata_ref : ?Text,
    now : Int
  ) : async Result.Result<Wallet> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Wallet update is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(wallet_id, #Wallet)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Wallet ID; expected WLT namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var wallet_found : ?Wallet = null;

    for (wallet in wallets.vals()) {
      if (wallet.wallet_id == wallet_id) {
        wallet_found := ?wallet;
      };
    };

    switch (wallet_found) {
      case null {
        return #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Wallet not found",
            null
          )
        );
      };

      case (?wallet) {
        switch (wallet.status) {
          case (#Closed) {
            return #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Closed Wallet cannot be updated",
                null
              )
            );
          };

          case (#Archived) {
            return #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Archived Wallet cannot be updated",
                null
              )
            );
          };

          case (_) {
            let updated : Wallet = {
              wallet_id = wallet.wallet_id;
              account_id = wallet.account_id;
              kind = kind;
              status = wallet.status;
              created_at = wallet.created_at;
              updated_at = now;
              metadata_ref = metadata_ref;
            };

            var next : [Wallet] = [];

            for (item in wallets.vals()) {
              if (item.wallet_id == wallet_id) {
                next := Array.append<Wallet>(next, [updated]);
              } else {
                next := Array.append<Wallet>(next, [item]);
              };
            };

            wallets := next;
            #ok(updated)
          };
        };
      };
    };
  };

  public shared ({ caller }) func activate_wallet(
    wallet_id : Text,
    now : Int
  ) : async Result.Result<Wallet> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Wallet activation is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(wallet_id, #Wallet)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Wallet ID; expected WLT namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var wallet_found : ?Wallet = null;

    for (wallet in wallets.vals()) {
      if (wallet.wallet_id == wallet_id) {
        wallet_found := ?wallet;
      };
    };

    switch (wallet_found) {
      case null {
        return #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Wallet not found",
            null
          )
        );
      };

      case (?wallet) {
        switch (wallet.status) {
          case (#Pending) {
            let updated : Wallet = {
              wallet_id = wallet.wallet_id;
              account_id = wallet.account_id;
              kind = wallet.kind;
              status = #Active;
              created_at = wallet.created_at;
              updated_at = now;
              metadata_ref = wallet.metadata_ref;
            };

            var next : [Wallet] = [];
            for (item in wallets.vals()) {
              if (item.wallet_id == wallet_id) {
                next := Array.append<Wallet>(next, [updated]);
              } else {
                next := Array.append<Wallet>(next, [item]);
              };
            };

            wallets := next;
            #ok(updated)
          };

          case (#Active) {
            #ok(wallet)
          };

          case (_) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Wallet cannot be activated from its current status",
                null
              )
            )
          };
        };
      };
    };
  };

  public shared ({ caller }) func suspend_wallet(
    wallet_id : Text,
    now : Int
  ) : async Result.Result<Wallet> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Wallet suspension is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(wallet_id, #Wallet)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Wallet ID; expected WLT namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var wallet_found : ?Wallet = null;

    for (wallet in wallets.vals()) {
      if (wallet.wallet_id == wallet_id) {
        wallet_found := ?wallet;
      };
    };

    switch (wallet_found) {
      case null {
        return #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Wallet not found",
            null
          )
        );
      };

      case (?wallet) {
        switch (wallet.status) {
          case (#Active) {
            let updated : Wallet = {
              wallet_id = wallet.wallet_id;
              account_id = wallet.account_id;
              kind = wallet.kind;
              status = #Suspended;
              created_at = wallet.created_at;
              updated_at = now;
              metadata_ref = wallet.metadata_ref;
            };

            var next : [Wallet] = [];
            for (item in wallets.vals()) {
              if (item.wallet_id == wallet_id) {
                next := Array.append<Wallet>(next, [updated]);
              } else {
                next := Array.append<Wallet>(next, [item]);
              };
            };

            wallets := next;
            #ok(updated)
          };

          case (#Suspended) {
            #ok(wallet)
          };

          case (_) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Wallet cannot be suspended from its current status",
                null
              )
            )
          };
        };
      };
    };
  };

  public shared ({ caller }) func close_wallet(
    wallet_id : Text,
    now : Int
  ) : async Result.Result<Wallet> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Wallet closure is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(wallet_id, #Wallet)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Wallet ID; expected WLT namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var wallet_found : ?Wallet = null;

    for (wallet in wallets.vals()) {
      if (wallet.wallet_id == wallet_id) {
        wallet_found := ?wallet;
      };
    };

    switch (wallet_found) {
      case null {
        return #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Wallet not found",
            null
          )
        );
      };

      case (?wallet) {
            switch (wallet.status) {
      case (#Active) {
        let updated : Wallet = {
          wallet_id = wallet.wallet_id;
          account_id = wallet.account_id;
          kind = wallet.kind;
          status = #Closed;
          created_at = wallet.created_at;
          updated_at = now;
          metadata_ref = wallet.metadata_ref;
        };

        var next : [Wallet] = [];
        for (item in wallets.vals()) {
          if (item.wallet_id == wallet_id) {
            next := Array.append<Wallet>(next, [updated]);
          } else {
            next := Array.append<Wallet>(next, [item]);
          };
        };

        wallets := next;
        #ok(updated)
      };

      case (#Suspended) {
        let updated : Wallet = {
          wallet_id = wallet.wallet_id;
          account_id = wallet.account_id;
          kind = wallet.kind;
          status = #Closed;
          created_at = wallet.created_at;
          updated_at = now;
          metadata_ref = wallet.metadata_ref;
        };

        var next : [Wallet] = [];
        for (item in wallets.vals()) {
          if (item.wallet_id == wallet_id) {
            next := Array.append<Wallet>(next, [updated]);
          } else {
            next := Array.append<Wallet>(next, [item]);
          };
        };

        wallets := next;
        #ok(updated)
      };

      case (#Closed) {
        #ok(wallet)
      };

      case (#Pending) {
        #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Pending Wallet cannot be closed",
            null
          )
        )
      };

      case (#Archived) {
        #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Archived Wallet cannot be closed",
            null
          )
        )
      };
    };
  };
};

};

public shared ({ caller }) func archive_wallet(
    wallet_id : Text,
    now : Int
  ) : async Result.Result<Wallet> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Wallet archival is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(wallet_id, #Wallet)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Wallet ID; expected WLT namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var wallet_found : ?Wallet = null;

    for (wallet in wallets.vals()) {
      if (wallet.wallet_id == wallet_id) {
        wallet_found := ?wallet;
      };
    };

    switch (wallet_found) {
      case null {
        return #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Wallet not found",
            null
          )
        );
      };

      case (?wallet) {
        switch (wallet.status) {
          case (#Archived) {
            return #ok(wallet)
          };
          case (_) {};
        };

        let updated : Wallet = {
          wallet_id = wallet.wallet_id;
          account_id = wallet.account_id;
          kind = wallet.kind;
          status = #Archived;
          created_at = wallet.created_at;
          updated_at = now;
          metadata_ref = wallet.metadata_ref;
        };

        var next : [Wallet] = [];
        for (item in wallets.vals()) {
          if (item.wallet_id == wallet_id) {
            next := Array.append<Wallet>(next, [updated]);
          } else {
            next := Array.append<Wallet>(next, [item]);
          };
        };

        wallets := next;
        #ok(updated)
      };
    };
  };

  public shared ({ caller }) func create_account(
    account_id : Text,
    identity_id : Text,
    kind : AccountKind,
    metadata_ref : ?Text,
    now : Int
  ) : async Result.Result<Account> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Account creation is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(account_id, #Account)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Account ID; expected ACC namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    switch (IDValidator.validateExpected(identity_id, #Identity)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Identity ID; expected IDN namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    for (existing in accounts.vals()) {
      if (existing.account_id == account_id) {
        return #err(
          ErrorFactory.fromCode(
            #Duplicate,
            "Account already exists",
            null
          )
        );
      };
    };

    var identity_found : ?Identity = null;

    for (identity in identities.vals()) {
      if (identity.identity_id == identity_id) {
        identity_found := ?identity;
      };
    };

    switch (identity_found) {
      case null {
        return #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Identity not found",
            null
          )
        );
      };
      case (?identity) {
        switch (identity.status) {
          case (#Archived) {
            return #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Archived Identity cannot create an Account",
                null
              )
            );
          };
          case (_) {};
        };
      };
    };

    let account : Account = {
      account_id = account_id;
      identity_id = identity_id;
      kind = kind;
      status = #Pending;
      created_at = now;
      updated_at = now;
      metadata_ref = metadata_ref;
    };

    accounts := Array.append<Account>(accounts, [account]);

    #ok(account)
  };

  public shared ({ caller }) func update_account(
    account_id : Text,
    kind : AccountKind,
    metadata_ref : ?Text,
    now : Int
  ) : async Result.Result<Account> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Account update is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(account_id, #Account)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Account ID; expected ACC namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var found : ?Account = null;

    for (account in accounts.vals()) {
      if (account.account_id == account_id) {
        found := ?account;
      };
    };

    switch (found) {
      case null {
        #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Account not found",
            null
          )
        )
      };

      case (?account) {
        switch (account.status) {
          case (#Closed) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Closed Account cannot be updated",
                null
              )
            )
          };

          case (#Archived) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Archived Account cannot be updated",
                null
              )
            )
          };

          case (_) {
            let updated : Account = {
              account_id = account.account_id;
              identity_id = account.identity_id;
              kind = kind;
              status = account.status;
              created_at = account.created_at;
              updated_at = now;
              metadata_ref = metadata_ref;
            };

            var next : [Account] = [];

            for (item in accounts.vals()) {
              if (item.account_id == account_id) {
                next := Array.append<Account>(next, [updated]);
              } else {
                next := Array.append<Account>(next, [item]);
              };
            };

            accounts := next;
            #ok(updated)
          };
        };
      };
    };
  };

  public shared ({ caller }) func activate_account(
    account_id : Text,
    now : Int
  ) : async Result.Result<Account> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Account activation is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(account_id, #Account)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Account ID; expected ACC namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var found : ?Account = null;

    for (account in accounts.vals()) {
      if (account.account_id == account_id) {
        found := ?account;
      };
    };

    switch (found) {
      case null {
        #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Account not found",
            null
          )
        )
      };

      case (?account) {
        switch (account.status) {
          case (#Pending) {
            let updated : Account = {
              account_id = account.account_id;
              identity_id = account.identity_id;
              kind = account.kind;
              status = #Active;
              created_at = account.created_at;
              updated_at = now;
              metadata_ref = account.metadata_ref;
            };

            var next : [Account] = [];

            for (item in accounts.vals()) {
              if (item.account_id == account_id) {
                next := Array.append<Account>(next, [updated]);
              } else {
                next := Array.append<Account>(next, [item]);
              };
            };

            accounts := next;
            #ok(updated)
          };

          case (#Active) {
            #ok(account)
          };

          case (#Suspended) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Suspended Account must not be activated directly",
                null
              )
            )
          };

          case (#Closed) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Closed Account cannot be activated",
                null
              )
            )
          };

          case (#Archived) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Archived Account cannot be activated",
                null
              )
            )
          };
        };
      };
    };
  };

  public shared ({ caller }) func suspend_account(
    account_id : Text,
    now : Int
  ) : async Result.Result<Account> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Account suspension is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(account_id, #Account)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Account ID; expected ACC namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var found : ?Account = null;

    for (account in accounts.vals()) {
      if (account.account_id == account_id) {
        found := ?account;
      };
    };

    switch (found) {
      case null {
        #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Account not found",
            null
          )
        )
      };

      case (?account) {
        switch (account.status) {
          case (#Active) {
            let updated : Account = {
              account_id = account.account_id;
              identity_id = account.identity_id;
              kind = account.kind;
              status = #Suspended;
              created_at = account.created_at;
              updated_at = now;
              metadata_ref = account.metadata_ref;
            };

            var next : [Account] = [];

            for (item in accounts.vals()) {
              if (item.account_id == account_id) {
                next := Array.append<Account>(next, [updated]);
              } else {
                next := Array.append<Account>(next, [item]);
              };
            };

            accounts := next;
            #ok(updated)
          };

          case (#Suspended) {
            #ok(account)
          };

          case (#Pending) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Pending Account cannot be suspended",
                null
              )
            )
          };

          case (#Closed) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Closed Account cannot be suspended",
                null
              )
            )
          };

          case (#Archived) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Archived Account cannot be suspended",
                null
              )
            )
          };
        };
      };
    };
  };

  public shared ({ caller }) func close_account(
    account_id : Text,
    now : Int
  ) : async Result.Result<Account> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Account closure is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(account_id, #Account)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Account ID; expected ACC namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var found : ?Account = null;

    for (account in accounts.vals()) {
      if (account.account_id == account_id) {
        found := ?account;
      };
    };

    switch (found) {
      case null {
        #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Account not found",
            null
          )
        )
      };

      case (?account) {
        switch (account.status) {
          case (#Active) {
            let updated : Account = {
              account_id = account.account_id;
              identity_id = account.identity_id;
              kind = account.kind;
              status = #Closed;
              created_at = account.created_at;
              updated_at = now;
              metadata_ref = account.metadata_ref;
            };

            var next : [Account] = [];

            for (item in accounts.vals()) {
              if (item.account_id == account_id) {
                next := Array.append<Account>(next, [updated]);
              } else {
                next := Array.append<Account>(next, [item]);
              };
            };

            accounts := next;
            #ok(updated)
          };

          case (#Suspended) {
            let updated : Account = {
              account_id = account.account_id;
              identity_id = account.identity_id;
              kind = account.kind;
              status = #Closed;
              created_at = account.created_at;
              updated_at = now;
              metadata_ref = account.metadata_ref;
            };

            var next : [Account] = [];

            for (item in accounts.vals()) {
              if (item.account_id == account_id) {
                next := Array.append<Account>(next, [updated]);
              } else {
                next := Array.append<Account>(next, [item]);
              };
            };

            accounts := next;
            #ok(updated)
          };

          case (#Closed) {
            #ok(account)
          };

          case (#Pending) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Pending Account cannot be closed",
                null
              )
            )
          };

          case (#Archived) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Archived Account cannot be closed",
                null
              )
            )
          };
        };
      };
    };
  };

  public shared ({ caller }) func archive_account(
    account_id : Text,
    now : Int
  ) : async Result.Result<Account> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Account archival is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(account_id, #Account)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Account ID; expected ACC namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var found : ?Account = null;

    for (account in accounts.vals()) {
      if (account.account_id == account_id) {
        found := ?account;
      };
    };

    switch (found) {
      case null {
        #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Account not found",
            null
          )
        )
      };

      case (?account) {
        switch (account.status) {
          case (#Archived) {
            #ok(account)
          };

          case (_) {
            let updated : Account = {
              account_id = account.account_id;
              identity_id = account.identity_id;
              kind = account.kind;
              status = #Archived;
              created_at = account.created_at;
              updated_at = now;
              metadata_ref = account.metadata_ref;
            };

            var next : [Account] = [];

            for (item in accounts.vals()) {
              if (item.account_id == account_id) {
                next := Array.append<Account>(next, [updated]);
              } else {
                next := Array.append<Account>(next, [item]);
              };
            };

            accounts := next;
            #ok(updated)
          };
        };
      };
    };
  };

  public shared ({ caller }) func update_identity(
    identity_id : Text,
    kind : IdentityKind,
    metadata_ref : ?Text,
    now : Int
  ) : async Result.Result<Identity> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Identity update is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(identity_id, #Identity)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Identity ID; expected IDN namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var found : ?Identity = null;

    for (identity in identities.vals()) {
      if (identity.identity_id == identity_id) {
        found := ?identity;
      };
    };

    switch (found) {
      case null {
        #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Identity not found",
            null
          )
        )
      };

      case (?identity) {
        switch (identity.status) {
          case (#Archived) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Archived Identity cannot be updated",
                null
              )
            )
          };

          case (_) {
            let updated : Identity = {
              identity_id = identity.identity_id;
              kind = kind;
              status = identity.status;
              created_at = identity.created_at;
              updated_at = now;
              metadata_ref = metadata_ref;
            };

            var next : [Identity] = [];

            for (item in identities.vals()) {
              if (item.identity_id == identity_id) {
                next := Array.append<Identity>(next, [updated]);
              } else {
                next := Array.append<Identity>(next, [item]);
              };
            };

            identities := next;
            #ok(updated)
          };
        };
      };
    };
  };

  public shared ({ caller }) func activate_identity(
    identity_id : Text,
    now : Int
  ) : async Result.Result<Identity> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Identity activation is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(identity_id, #Identity)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Identity ID; expected IDN namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var found : ?Identity = null;

    for (identity in identities.vals()) {
      if (identity.identity_id == identity_id) {
        found := ?identity;
      };
    };

    switch (found) {
      case null {
        #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Identity not found",
            null
          )
        )
      };

      case (?identity) {
        switch (identity.status) {
          case (#Pending) {
            let updated : Identity = {
              identity_id = identity.identity_id;
              kind = identity.kind;
              status = #Active;
              created_at = identity.created_at;
              updated_at = now;
              metadata_ref = identity.metadata_ref;
            };

            var next : [Identity] = [];

            for (item in identities.vals()) {
              if (item.identity_id == identity_id) {
                next := Array.append<Identity>(next, [updated]);
              } else {
                next := Array.append<Identity>(next, [item]);
              };
            };

            identities := next;
            #ok(updated)
          };

          case (#Active) {
            #ok(identity)
          };

          case (#Suspended) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Suspended Identity must not be activated directly",
                null
              )
            )
          };

          case (#Archived) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Archived Identity cannot be activated",
                null
              )
            )
          };
        };
      };
    };
  };

  public shared ({ caller }) func suspend_identity(
    identity_id : Text,
    now : Int
  ) : async Result.Result<Identity> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Identity suspension is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(identity_id, #Identity)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Identity ID; expected IDN namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var found : ?Identity = null;

    for (identity in identities.vals()) {
      if (identity.identity_id == identity_id) {
        found := ?identity;
      };
    };

    switch (found) {
      case null {
        #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Identity not found",
            null
          )
        )
      };

      case (?identity) {
        switch (identity.status) {
          case (#Active) {
            let updated : Identity = {
              identity_id = identity.identity_id;
              kind = identity.kind;
              status = #Suspended;
              created_at = identity.created_at;
              updated_at = now;
              metadata_ref = identity.metadata_ref;
            };

            var next : [Identity] = [];

            for (item in identities.vals()) {
              if (item.identity_id == identity_id) {
                next := Array.append<Identity>(next, [updated]);
              } else {
                next := Array.append<Identity>(next, [item]);
              };
            };

            identities := next;
            #ok(updated)
          };

          case (#Suspended) {
            #ok(identity)
          };

          case (#Pending) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Pending Identity cannot be suspended",
                null
              )
            )
          };

          case (#Archived) {
            #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Archived Identity cannot be suspended",
                null
              )
            )
          };
        };
      };
    };
  };


  public shared ({ caller }) func archive_identity(
    identity_id : Text,
    now : Int
  ) : async Result.Result<Identity> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Identity archiving is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(identity_id, #Identity)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Identity ID; expected IDN namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var found : ?Identity = null;

    for (identity in identities.vals()) {
      if (identity.identity_id == identity_id) {
        found := ?identity;
      };
    };

    switch (found) {
      case null {
        #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Identity not found",
            null
          )
        )
      };

      case (?identity) {
        switch (identity.status) {

          case (#Archived) {
            #ok(identity)
          };

          case (_) {
            let updated : Identity = {
              identity_id = identity.identity_id;
              kind = identity.kind;
              status = #Archived;
              created_at = identity.created_at;
              updated_at = now;
              metadata_ref = identity.metadata_ref;
            };

            var next : [Identity] = [];

            for (item in identities.vals()) {
              if (item.identity_id == identity_id) {
                next := Array.append<Identity>(next, [updated]);
              } else {
                next := Array.append<Identity>(next, [item]);
              };
            };

            identities := next;
            #ok(updated)
          };
        };
      };
    };
  };


  public shared ({ caller }) func bind_principal(
    identity_id : Text,
    principal_ref : Text,
    now : Int
  ) : async Result.Result<PrincipalBinding> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Principal binding is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(identity_id, #Identity)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Identity ID; expected IDN namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    switch (IDValidator.validateExpected(principal_ref, #Principal)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Principal ID; expected PRN namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var identity_found : ?Identity = null;

    for (identity in identities.vals()) {
      if (identity.identity_id == identity_id) {
        identity_found := ?identity;
      };
    };

    switch (identity_found) {
      case null {
        return #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Identity not found",
            null
          )
        );
      };

      case (?identity) {
        switch (identity.status) {
          case (#Archived) {
            return #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Archived Identity cannot receive a Principal binding",
                null
              )
            );
          };
          case (_) {};
        };      };
    };

    var active_binding : ?PrincipalBinding = null;

    for (binding in principalBindings.vals()) {
      if (binding.principal_ref == principal_ref and binding.active) {
        active_binding := ?binding;
      };
    };

    switch (active_binding) {
      case (?binding) {
        if (binding.identity_id == identity_id) {
          return #ok(binding);
        } else {
          return #err(
            ErrorFactory.fromCode(
              #Duplicate,
              "Principal is already bound to another Identity",
              null
            )
          );
        };
      };

      case null {};
    };

    let binding : PrincipalBinding = {
      identity_id = identity_id;
      principal_ref = principal_ref;
      bound_at = now;
      active = true;
    };

    principalBindings := Array.append<PrincipalBinding>(
      principalBindings,
      [binding]
    );

    #ok(binding)
  };

  public shared ({ caller }) func unbind_principal(
    identity_id : Text,
    principal_ref : Text
  ) : async Result.Result<PrincipalBinding> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Principal unbinding is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(identity_id, #Identity)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Identity ID; expected IDN namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    switch (IDValidator.validateExpected(principal_ref, #Principal)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Principal ID; expected PRN namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var found : ?PrincipalBinding = null;

    for (binding in principalBindings.vals()) {
      if (
        binding.identity_id == identity_id
        and binding.principal_ref == principal_ref
      ) {
        found := ?binding;
      };
    };

    switch (found) {
      case null {
        #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Principal binding not found",
            null
          )
        )
      };

      case (?binding) {
        if (not binding.active) {
          #ok(binding)
        } else {
          let updated : PrincipalBinding = {
            identity_id = binding.identity_id;
            principal_ref = binding.principal_ref;
            bound_at = binding.bound_at;
            active = false;
          };

          var next : [PrincipalBinding] = [];

          for (item in principalBindings.vals()) {
            if (
              item.identity_id == identity_id
              and item.principal_ref == principal_ref
            ) {
              next := Array.append<PrincipalBinding>(next, [updated]);
            } else {
              next := Array.append<PrincipalBinding>(next, [item]);
            };
          };

          principalBindings := next;
          #ok(updated)
        };
      };
    };
  };


  public shared ({ caller }) func link_verification(
    identity_id : Text,
    verification_id : Text
  ) : async Result.Result<VerificationRef> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Verification linking is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(identity_id, #Identity)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Identity ID; expected IDN namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    switch (IDValidator.validateExpected(verification_id, #Verification)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Verification ID; expected VER namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var identity_found : ?Identity = null;

    for (identity in identities.vals()) {
      if (identity.identity_id == identity_id) {
        identity_found := ?identity;
      };
    };

    switch (identity_found) {
      case null {
        return #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Identity not found",
            null
          )
        );
      };

      case (?identity) {
        switch (identity.status) {
          case (#Archived) {
            return #err(
              ErrorFactory.fromCode(
                #InvalidValue,
                "Archived Identity cannot receive a Verification link",
                null
              )
            );
          };
          case (_) {};
        };
      };
    };

    for (reference in verificationRefs.vals()) {
      if (
        reference.identity_id == identity_id
        and reference.verification_id == verification_id
      ) {
        return #ok(reference);
      };
    };

    let reference : VerificationRef = {
      identity_id = identity_id;
      verification_id = verification_id;
    };

    verificationRefs := Array.append<VerificationRef>(
      verificationRefs,
      [reference]
    );

    #ok(reference)
  };

  public shared ({ caller }) func unlink_verification(
    identity_id : Text,
    verification_id : Text
  ) : async Result.Result<VerificationRef> {

    if (not isOwner(caller)) {
      return #err(
        ErrorFactory.fromCode(
          #AuthorizationDenied,
          "Verification unlinking is not authorized",
          null
        )
      );
    };

    switch (IDValidator.validateExpected(identity_id, #Identity)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Identity ID; expected IDN namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    switch (IDValidator.validateExpected(verification_id, #Verification)) {
      case (#err(_)) {
        return #err(
          ErrorFactory.fromCode(
            #InvalidValue,
            "Invalid Verification ID; expected VER namespace",
            null
          )
        );
      };
      case (#ok(_)) {};
    };

    var found : ?VerificationRef = null;

    for (reference in verificationRefs.vals()) {
      if (
        reference.identity_id == identity_id
        and reference.verification_id == verification_id
      ) {
        found := ?reference;
      };
    };

    switch (found) {
      case null {
        #err(
          ErrorFactory.fromCode(
            #NotFound,
            "Verification reference not found",
            null
          )
        )
      };

      case (?reference) {
        var next : [VerificationRef] = [];

        for (item in verificationRefs.vals()) {
          if (
            not (
              item.identity_id == identity_id
              and item.verification_id == verification_id
            )
          ) {
            next := Array.append<VerificationRef>(next, [item]);
          };
        };

        verificationRefs := next;
        #ok(reference)
      };
    };
  };

  stable var projects : [Project] = [];
  stable var assets : [Asset] = [];
  stable var collaterals : [Collateral] = [];
  stable var valuations : [ValuationRecord] = [];
  stable var economicRights : [EconomicRight] = [];

  stable var assignments : [Assignment] = [];
  stable var acceptances : [Acceptance] = [];
  stable var energyVerifications : [EnergyVerification] = [];
  stable var certificates : [GeramCertificate] = [];
  stable var evidences : [Evidence] = [];
  stable var verifications : [Verification] = [];
  stable var contracts : [Contract] = [];
  // ============================================================
  // GERAM-P07.8 — ICRC-7 Token ID Allocator
  // ============================================================

  // GERAM token namespace starts above the experimental/test token range.
  // Certificate ID and ICRC-7 Token ID remain separate identifiers.
  stable var nextGeramTokenId : Nat = 1_000_001;

  // Finds the first unused Token ID in the GERAM namespace.
  // ICRC-7 remains the source of truth for actual NFT existence.
  private func findAvailableGeramTokenId() : Nat {
    var candidate = nextGeramTokenId;

    label search loop {
      switch (icrc7().get_nft(candidate)) {
        case (null) {
          return candidate;
        };
        case (?_) {
          candidate += 1;
        };
      };
    };

    candidate
  };

  stable var marketSnapshots : [MarketSnapshot] = [];

  // ============================================================
  // GERAM-HAMIFUND — Stable Registry
  //
  // این Registry لایه داده‌ای HamiFund است.
  // هنوز عملیات سرمایه‌گذاری، تخصیص دارایی یا AI execution
  // انجام نمی‌دهد.
  // ============================================================

  stable var hamiFunds : [HamiFund] = [];
  stable var fundAssets : [FundAsset] = [];
  stable var fundPositions : [FundPosition] = [];
  stable var fundTransactions : [FundTransaction] = [];

  // ============================================================
  // P41 — READ-ONLY VALIDATION LAYER
  // ============================================================

  public type ValidationResult = {
    #ok : Text;
    #err : Text;
  };

  // ============================================================
  // Internal authorization
  // ===============


func isOwner(caller : Principal) : Bool {
    caller == _owner
  };

  // ============================================================
  // P04-01 — Create Project
  // ============================================================

  // ==========================================================
  // P02-S02-F13 ? Contract Registry
  // ==========================================================

  public shared ({ caller }) func create_contract(
    contract : Contract
  ) : async ContractResult {
    if (not isOwner(caller)) {
      return #err("Unauthorized");
    };

    if (contract.contract_id == "") {
      return #err("Contract creation failed: contract_id is empty");
    };

    if (contract.contract_number == "") {
      return #err("Contract creation failed: contract_number is empty");
    };

    if (contract.project_id == "") {
      return #err("Contract creation failed: project_id is empty");
    };

    if (contract.contract_type == "") {
      return #err("Contract creation failed: contract_type is empty");
    };

    if (contract.version == 0) {
      return #err("Contract creation failed: version is zero");
    };

    if (contract.effective_timestamp <= 0) {
      return #err(
        "Contract creation failed: invalid effective_timestamp"
      );
    };

    switch (contract.expiry_timestamp) {
      case (?expiry) {
        if (expiry <= contract.effective_timestamp) {
          return #err(
            "Contract creation failed: expiry_timestamp must be greater than effective_timestamp"
          );
        };
      };
      case null {};
    };

    var duplicate = false;
    for (existing in contracts.vals()) {
      if (existing.contract_id == contract.contract_id) {
        duplicate := true;
      };
    };

    if (duplicate) {
      return #err("Contract already exists");
    };

    var projectExists = false;
    for (project in projects.vals()) {
      if (project.project_id == contract.project_id) {
        projectExists := true;
      };
    };

    if (not projectExists) {
      return #err("Contract creation failed: project_id not found");
    };

    let storedContract : Contract = {
      contract_id = contract.contract_id;
      contract_number = contract.contract_number;
      project_id = contract.project_id;
      contract_type = contract.contract_type;
      version = contract.version;
      party_ids = contract.party_ids;
      legal_basis = contract.legal_basis;
      document_hash = contract.document_hash;
      effective_timestamp = contract.effective_timestamp;
      expiry_timestamp = contract.expiry_timestamp;
      status = contract.status;
      created_at = Time.now();
    };

    contracts := Array.append<Contract>(
      contracts,
      [storedContract]
    );

    #ok(storedContract);
  };

  public query func get_contract(
    contract_id : Text
  ) : async ?Contract {
    Array.find<Contract>(
      contracts,
      func(c : Contract) : Bool {
        c.contract_id == contract_id
      }
    );
  };

  public query func list_contracts() : async [Contract] {
    contracts
  };

  // P02-S02-F14 ? TRUST & EVIDENCE FOUNDATION

  public shared ({ caller }) func create_evidence(
    evidence : Evidence
  ) : async EvidenceResult {
    if (not isOwner(caller)) {
      return #err("Unauthorized");
    };


    if (evidence.evidence_id == "") {
      return #err("Evidence creation failed: evidence_id is empty");
    };

    if (evidence.subject_type == "") {
      return #err("Evidence creation failed: subject_type is empty");
    };

    if (evidence.subject_id == "") {
      return #err("Evidence creation failed: subject_id is empty");
    };

    if (evidence.evidence_type == "") {
      return #err("Evidence creation failed: evidence_type is empty");
    };

    if (evidence.title == "") {
      return #err("Evidence creation failed: title is empty");
    };

    if (evidence.issuer_id == "") {
      return #err("Evidence creation failed: issuer_id is empty");
    };

    if (evidence.issued_at <= 0) {
      return #err(
        "Evidence creation failed: invalid issued_at"
      );
    };

    switch (evidence.valid_until) {
      case (?validUntil) {
        if (validUntil <= evidence.issued_at) {
          return #err(
            "Evidence creation failed: valid_until must be greater than issued_at"
          );
        };
      };
      case null {};
    };

    for (existing in evidences.vals()) {
      if (existing.evidence_id == evidence.evidence_id) {
        return #err("Evidence already exists");
      };
    };

    let storedEvidence : Evidence = {
      evidence_id = evidence.evidence_id;
      subject_type = evidence.subject_type;
      subject_id = evidence.subject_id;
      evidence_type = evidence.evidence_type;
      title = evidence.title;
      description = evidence.description;
      source_reference = evidence.source_reference;
      document_hash = evidence.document_hash;
      issuer_id = evidence.issuer_id;
      issued_at = evidence.issued_at;
      valid_until = evidence.valid_until;
      status = evidence.status;
      created_at = Time.now();
    };

    evidences := Array.append<Evidence>(
      evidences,
      [storedEvidence]
    );

    #ok(storedEvidence);
  };

  public query func get_evidence(
    evidence_id : Text
  ) : async ?Evidence {
    Array.find<Evidence>(
      evidences,
      func(e : Evidence) : Bool {
        e.evidence_id == evidence_id
      }
    );
  };

  public query func list_evidence() : async [Evidence] {
    evidences
  };

  public shared ({ caller }) func create_verification(
    verification : Verification
  ) : async VerificationResult {
    if (not isOwner(caller)) {
      return #err("Unauthorized");
    };

    if (verification.verification_id == "") {
      return #err(
        "Verification creation failed: verification_id is empty"
      );
    };

    if (verification.subject_type == "") {
      return #err(
        "Verification creation failed: subject_type is empty"
      );
    };

    if (verification.subject_id == "") {
      return #err(
        "Verification creation failed: subject_id is empty"
      );
    };

    if (verification.verification_method == "") {
      return #err(
        "Verification creation failed: verification_method is empty"
      );
    };

    if (verification.verifier_id == "") {
      return #err(
        "Verification creation failed: verifier_id is empty"
      );
    };

    if (verification.verified_at <= 0) {
      return #err(
        "Verification creation failed: invalid verified_at"
      );
    };

    for (existing in verifications.vals()) {
      if (
        existing.verification_id ==
        verification.verification_id
      ) {
        return #err("Verification already exists");
      };
    };

    switch (verification.evidence_id) {
      case (?evidenceId) {
        var evidenceExists = false;

        for (evidence in evidences.vals()) {
          if (evidence.evidence_id == evidenceId) {
            evidenceExists := true;

            if (
              evidence.subject_type != verification.subject_type
              or evidence.subject_id != verification.subject_id
            ) {
              return #err(
                "Verification creation failed: evidence subject mismatch"
              );
            };
          };
        };

        if (not evidenceExists) {
          return #err(
            "Verification creation failed: evidence_id not found"
          );
        };
      };
      case null {};
    };

    let storedVerification : Verification = {
      verification_id = verification.verification_id;
      subject_type = verification.subject_type;
      subject_id = verification.subject_id;
      evidence_id = verification.evidence_id;
      verification_method = verification.verification_method;
      verifier_id = verification.verifier_id;
      verification_reference =
        verification.verification_reference;
      verified_at = verification.verified_at;
      status = verification.status;
      created_at = Time.now();
    };

    verifications := Array.append<Verification>(
      verifications,
      [storedVerification]
    );

    #ok(storedVerification);
  };

  public query func get_verification(
    verification_id : Text
  ) : async ?Verification {
    Array.find<Verification>(
      verifications,
      func(v : Verification) : Bool {
        v.verification_id == verification_id
      }
    );
  };

  public query func list_verifications() : async [Verification] {
    verifications
  };

  public shared ({ caller }) func create_project(
    project : Project
  ) : async ProjectResult {

    if (not isOwner(caller)) {
      return #err("Unauthorized: only GERAM owner can create a project");
    };

    switch (
      Array.find<Project>(
        projects,
        func(p : Project) : Bool {
          p.project_id == project.project_id
        }
      )
    ) {
      case (?_) {
        #err("Project already exists");
      };

      case null {
        projects := Array.append<Project>(projects, [project]);
        #ok(project);
      };
    };
  };

  // ============================================================
  // P04-02 — Get Project
  // ============================================================

  public query func get_project(
    project_id : Text
  ) : async ?Project {

    Array.find<Project>(
      projects,
      func(p : Project) : Bool {
        p.project_id == project_id
      }
    );
  };

  // ============================================================
  // P04-03 — List Projects
  // ============================================================

  public query func list_projects() : async [Project] {
    projects
  };

  // ============================================================
  // ============================================================
  // GERAM-P06 — ASSET API
  // ============================================================

  public shared ({ caller }) func create_asset(asset : Asset) : async AssetResult {
    if (not isOwner(caller)) {
      return #err("Unauthorized");
    };

    for (existing in assets.vals()) {
      if (existing.asset_id == asset.asset_id) {
        return #err("Asset already exists");
      };
    };

    var projectExists = false;

    for (project in projects.vals()) {
      if (project.project_id == asset.project_id) {
        projectExists := true;
      };
    };

    if (not projectExists) {
      return #err("Referenced project does not exist");
    };

    assets := Array.append<Asset>(assets, [asset]);

    #ok(asset)
  };

  public query func get_asset(asset_id : Text) : async ?Asset {
    for (asset in assets.vals()) {
      if (asset.asset_id == asset_id) {
        return ?asset;
      };
    };

    null
  };

  public query func list_assets() : async [Asset] {
    assets
  };

  // ==========================================================
  // GERAM-F15 ? COLLATERAL & ENCUMBRANCE API
  // ==========================================================

  // ==========================================================
  // GERAM-F16 ? VALUATION REGISTRY FOUNDATION
  // ==========================================================

  public shared ({ caller }) func create_economic_right(
    right : EconomicRight
  ) : async EconomicRightResult {
    if (not isOwner(caller)) {
      return #err("Unauthorized");
    };

    if (right.right_id == "") {
      return #err("Economic right creation failed: right_id is empty");
    };

    if (right.certificate_id == "") {
      return #err("Economic right creation failed: certificate_id is empty");
    };

    if (right.project_id == "") {
      return #err("Economic right creation failed: project_id is empty");
    };

    if (right.rights_type == "") {
      return #err("Economic right creation failed: rights_type is empty");
    };

    if (right.entitlement == 0) {
      return #err("Economic right creation failed: entitlement is zero");
    };

    if (right.entitlement_unit == "") {
      return #err("Economic right creation failed: entitlement_unit is empty");
    };

    if (right.version == 0) {
      return #err("Economic right creation failed: version is zero");
    };

    if (right.created_at <= 0 or right.updated_at <= 0) {
      return #err("Economic right creation failed: invalid timestamps");
    };

    for (existing in economicRights.vals()) {
      if (existing.right_id == right.right_id) {
        return #err("Economic right already exists");
      };
    };

    var certificateExists = false;

    for (certificate in certificates.vals()) {
      if (certificate.certificate_id == right.certificate_id) {
        certificateExists := true;

        if (certificate.project_id != right.project_id) {
          return #err(
            "Economic right creation failed: certificate project mismatch"
          );
        };
      };
    };

    if (not certificateExists) {
      return #err(
        "Economic right creation failed: certificate_id not found"
      );
    };

    switch (right.contract_id) {
      case (?contractId) {
        var contractExists = false;

        for (contract in contracts.vals()) {
          if (contract.contract_id == contractId) {
            contractExists := true;

            if (contract.project_id != right.project_id) {
              return #err(
                "Economic right creation failed: contract project mismatch"
              );
            };
          };
        };

        if (not contractExists) {
          return #err(
            "Economic right creation failed: contract_id not found"
          );
        };
      };
      case null {};
    };

    let now = Time.now();

    let storedRight : EconomicRight = {
      right_id = right.right_id;
      certificate_id = right.certificate_id;
      project_id = right.project_id;
      contract_id = right.contract_id;
      beneficiary = right.beneficiary;
      rights_type = right.rights_type;
      entitlement = right.entitlement;
      entitlement_unit = right.entitlement_unit;
      status = right.status;
      version = right.version;
      created_at = now;
      updated_at = now;
    };

    economicRights := Array.append<EconomicRight>(
      economicRights,
      [storedRight]
    );

    #ok(storedRight)
  };

  public query func get_economic_right(
    right_id : Text
  ) : async ?EconomicRight {
    for (right in economicRights.vals()) {
      if (right.right_id == right_id) {
        return ?right;
      };
    };

    null
  };

  public query func list_economic_rights() : async [EconomicRight] {
    economicRights
  };


  // P02-S02-F18.03 ? ASSIGNMENT & ACCEPTANCE FOUNDATION
  // ====================================================

  public shared ({ caller }) func create_assignment(
    assignment : Assignment
  ) : async AssignmentResult {
    if (not isOwner(caller)) {
      return #err("Unauthorized");
    };

    if (assignment.assignment_id == "") {
      return #err("Assignment creation failed: assignment_id is required");
    };

    if (assignment.right_id == "") {
      return #err("Assignment creation failed: right_id is required");
    };

    if (assignment.from_beneficiary == assignment.to_beneficiary) {
      return #err("Assignment creation failed: beneficiaries must differ");
    };

    if (assignment.version == 0) {
      return #err("Assignment creation failed: version must be greater than zero");
    };

    for (item in assignments.vals()) {
      if (item.assignment_id == assignment.assignment_id) {
        return #err("Assignment creation failed: assignment_id already exists");
      };
    };

    var rightFound : ?EconomicRight = null;

    for (item in economicRights.vals()) {
      if (item.right_id == assignment.right_id) {
        rightFound := ?item;
      };
    };

    switch (rightFound) {
      case (null) {
        return #err("Assignment creation failed: economic right not found");
      };
      case (?right) {
        if (right.beneficiary != assignment.from_beneficiary) {
          return #err("Assignment creation failed: from_beneficiary mismatch");
        };
      };
    };

    let now = Time.now();

    let stored : Assignment = {
      assignment with
      status = #PENDING;
      created_at = now;
      updated_at = now;
    };

    assignments := Array.append<Assignment>(assignments, [stored]);

    #ok(stored)
  };

  public query func get_assignment(
    assignment_id : Text
  ) : async ?Assignment {
    for (item in assignments.vals()) {
      if (item.assignment_id == assignment_id) {
        return ?item;
      };
    };
    null
  };

  public query func list_assignments() : async [Assignment] {
    assignments
  };

  public shared ({ caller }) func create_acceptance(
    acceptance : Acceptance
  ) : async AcceptanceResult {
    if (not isOwner(caller)) {
      return #err("Unauthorized");
    };

    if (acceptance.acceptance_id == "") {
      return #err("Acceptance creation failed: acceptance_id is required");
    };

    if (acceptance.assignment_id == "") {
      return #err("Acceptance creation failed: assignment_id is required");
    };

    for (item in acceptances.vals()) {
      if (item.acceptance_id == acceptance.acceptance_id) {
        return #err("Acceptance creation failed: acceptance_id already exists");
      };
    };

    var assignmentFound : ?Assignment = null;

    for (item in assignments.vals()) {
      if (item.assignment_id == acceptance.assignment_id) {
        assignmentFound := ?item;
      };
    };

    switch (assignmentFound) {
      case (null) {
        return #err("Acceptance creation failed: assignment not found");
      };
      case (?assignment) {
        if (assignment.to_beneficiary != acceptance.assignee) {
          return #err("Acceptance creation failed: assignee mismatch");
        };

        if (assignment.status != #PENDING) {
          return #err("Acceptance creation failed: assignment is not pending");
        };
      };
    };

    let now = Time.now();

    let stored : Acceptance = {
      acceptance with
      status = #ACCEPTED;
      accepted_at = ?now;
      created_at = now;
    };

    acceptances := Array.append<Acceptance>(acceptances, [stored]);

    var nextAssignments : [Assignment] = [];

    for (item in assignments.vals()) {
      if (item.assignment_id == acceptance.assignment_id) {
        nextAssignments := Array.append<Assignment>(
          nextAssignments,
          [{
            item with
            status = #ACCEPTED;
            updated_at = now;
          }]
        );
      } else {
        nextAssignments := Array.append<Assignment>(nextAssignments, [item]);
      };
    };

    assignments := nextAssignments;

    #ok(stored)
  };

  public query func get_acceptance(
    acceptance_id : Text
  ) : async ?Acceptance {
    for (item in acceptances.vals()) {
      if (item.acceptance_id == acceptance_id) {
        return ?item;
      };
    };
    null
  };

  public query func list_acceptances() : async [Acceptance] {
    acceptances
  };

  public shared ({ caller }) func complete_assignment(
    assignment_id : Text
  ) : async AssignmentResult {
    if (not isOwner(caller)) {
      return #err("Unauthorized");
    };

    if (assignment_id == "") {
      return #err("Assignment ID is required");
    };

    var targetAssignment : ?Assignment = null;
    for (item in assignments.vals()) {
      if (item.assignment_id == assignment_id) {
        targetAssignment := ?item;
      };
    };

    switch (targetAssignment) {
      case (null) {
        return #err("Assignment not found");
      };
      case (?assignment) {
        if (assignment.status != #ACCEPTED) {
          return #err("Assignment completion failed: assignment is not accepted");
        };

        var acceptanceFound = false;
        for (item in acceptances.vals()) {
          if (
            item.assignment_id == assignment.assignment_id and
            item.assignee == assignment.to_beneficiary and
            item.status == #ACCEPTED
          ) {
            acceptanceFound := true;
          };
        };

        if (not acceptanceFound) {
          return #err("Assignment completion failed: accepted acceptance not found");
        };

        var targetRight : ?EconomicRight = null;
        for (item in economicRights.vals()) {
          if (item.right_id == assignment.right_id) {
            targetRight := ?item;
          };
        };

        switch (targetRight) {
          case (null) {
            return #err("Assignment completion failed: economic right not found");
          };
          case (?right) {
            if (right.beneficiary != assignment.from_beneficiary) {
              return #err("Assignment completion failed: beneficiary already changed");
            };

            let now = Time.now();

            let updatedRight : EconomicRight = {
              right with
              beneficiary = assignment.to_beneficiary;
              version = right.version + 1;
              updated_at = now;
            };

            let completedAssignment : Assignment = {
              assignment with
              status = #COMPLETED;
              updated_at = now;
            };

            var nextRights : [EconomicRight] = [];
            for (item in economicRights.vals()) {
              if (item.right_id == right.right_id) {
                nextRights := Array.append<EconomicRight>(
                  nextRights,
                  [updatedRight]
                );
              } else {
                nextRights := Array.append<EconomicRight>(
                  nextRights,
                  [item]
                );
              };
            };

            var nextAssignments : [Assignment] = [];
            for (item in assignments.vals()) {
              if (item.assignment_id == assignment.assignment_id) {
                nextAssignments := Array.append<Assignment>(
                  nextAssignments,
                  [completedAssignment]
                );
              } else {
                nextAssignments := Array.append<Assignment>(
                  nextAssignments,
                  [item]
                );
              };
            };

            economicRights := nextRights;
            assignments := nextAssignments;

            #ok(completedAssignment)
          };
        };
      };
    };
  };

  public shared ({ caller }) func create_valuation(
    valuation : ValuationRecord
  ) : async ValuationResult {
    if (not isOwner(caller)) {
      return #err("Unauthorized");
    };

    if (valuation.valuation_id == "") {
      return #err("Valuation ID is required");
    };

    for (existing in valuations.vals()) {
      if (existing.valuation_id == valuation.valuation_id) {
        return #err("Valuation already exists");
      };
    };

    if (valuation.subject_type != "PROJECT" and valuation.subject_type != "ASSET") {
      return #err("Invalid valuation subject type");
    };

    if (valuation.subject_id == "") {
      return #err("Valuation subject ID is required");
    };

    if (valuation.project_id == "") {
      return #err("Project ID is required");
    };

    if (valuation.base_value == 0) {
      return #err("Valuation base value must be greater than zero");
    };

    if (valuation.valuation_unit == "") {
      return #err("Valuation unit is required");
    };

    if (valuation.valuation_date <= 0) {
      return #err("Valuation date must be greater than zero");
    };

    if (valuation.version == 0) {
      return #err("Valuation version must be greater than zero");
    };

    var project_found = false;
    for (project in projects.vals()) {
      if (project.project_id == valuation.project_id) {
        project_found := true;
      };
    };

    if (not project_found) {
      return #err("Project does not exist");
    };

    if (valuation.subject_type == "ASSET") {
      var asset_found = false;

      for (asset in assets.vals()) {
        if (
          asset.asset_id == valuation.subject_id and
          asset.project_id == valuation.project_id
        ) {
          asset_found := true;
        };
      };

      if (not asset_found) {
        return #err("Asset does not exist or does not belong to project");
      };
    };

    let stored : ValuationRecord = {
      valuation with
      created_at = Time.now();
    };

    valuations := Array.append<ValuationRecord>(valuations, [stored]);
    #ok(stored)
  };

  public query func get_valuation(
    valuation_id : Text
  ) : async ?ValuationRecord {
    for (valuation in valuations.vals()) {
      if (valuation.valuation_id == valuation_id) {
        return ?valuation;
      };
    };

    null
  };

  public query func list_valuations() : async [ValuationRecord] {
    valuations
  };

  public shared ({ caller }) func create_collateral(
    collateral : Collateral
  ) : async CollateralResult {

    if (not isOwner(caller)) {
      return #err("Unauthorized");
    };

    if (collateral.collateral_id == "") {
      return #err("Collateral ID is required");
    };

    for (existing in collaterals.vals()) {
      if (existing.collateral_id == collateral.collateral_id) {
        return #err("Collateral already exists");
      };
    };

    var assetExists = false;
    for (asset in assets.vals()) {
      if (asset.asset_id == collateral.asset_id) {
        assetExists := true;
      };
    };

    if (not assetExists) {
      return #err("Referenced asset does not exist");
    };

    var projectExists = false;
    for (project in projects.vals()) {
      if (project.project_id == collateral.project_id) {
        projectExists := true;
      };
    };

    if (not projectExists) {
      return #err("Referenced project does not exist");
    };

    switch (collateral.contract_id) {
      case (?contract_id) {
        var contractExists = false;

        for (contract in contracts.vals()) {
          if (contract.contract_id == contract_id) {
            contractExists := true;

            if (contract.project_id != collateral.project_id) {
              return #err("Contract does not belong to project");
            };
          };
        };

        if (not contractExists) {
          return #err("Referenced contract does not exist");
        };
      };
      case (null) {};
    };

    var activeCollateralExists = false;

    for (existing in collaterals.vals()) {
      if (
        existing.asset_id == collateral.asset_id
        and existing.status == #ACTIVE
      ) {
        activeCollateralExists := true;
      };
    };

    if (activeCollateralExists) {
      return #err("Asset already has active collateral");
    };

    if (collateral.collateral_value == 0) {
      return #err("Collateral value must be greater than zero");
    };

    if (collateral.valuation_timestamp <= 0) {
      return #err("Invalid valuation timestamp");
    };

    if (collateral.coverage_bps > 10000) {
      return #err("Coverage must not exceed 10000 bps");
    };

    let stored : Collateral = {
      collateral with
      created_at = Time.now();
    };

    collaterals := Array.append<Collateral>(collaterals, [stored]);

    #ok(stored)
  };

  public query func get_collateral(
    collateral_id : Text
  ) : async ?Collateral {

    for (collateral in collaterals.vals()) {
      if (collateral.collateral_id == collateral_id) {
        return ?collateral;
      };
    };

    null
  };

  public query func list_collaterals() : async [Collateral] {
    collaterals
  };

  public shared ({ caller }) func release_collateral(
    collateral_id : Text,
    now : Int
  ) : async CollateralResult {

    if (not isOwner(caller)) {
      return #err("Unauthorized");
    };

    if (now <= 0) {
      return #err("Invalid release timestamp");
    };

    var found = false;
    var result : ?Collateral = null;

    let updated = Array.map<Collateral, Collateral>(
      collaterals,
      func(existing : Collateral) : Collateral {
        if (existing.collateral_id == collateral_id) {
          found := true;

          if (existing.status == #RELEASED) {
            result := ?existing;
            return existing;
          };

          let released : Collateral = {
            existing with
            status = #RELEASED;
            release_timestamp = ?now;
          };

          result := ?released;
          return released;
        };

        existing
      }
    );

    if (not found) {
      return #err("Collateral does not exist");
    };

    switch (result) {
      case (?released) {
        collaterals := updated;
        #ok(released)
      };
      case (null) {
        #err("Collateral update failed")
      };
    };
  };


  // ============================================================
  // GERAM-P06 — ENERGY VERIFICATION API
  // ============================================================

  public shared ({ caller }) func create_energy_verification(
    verification : EnergyVerification
  ) : async EnergyVerificationResult {
    if (not isOwner(caller)) {
      return #err("Unauthorized");
    };

    if (
      verification.measurement_period_end
      < verification.measurement_period_start
    ) {
      return #err("Invalid measurement period");
    };

    for (existing in energyVerifications.vals()) {
      if (existing.verification_id == verification.verification_id) {
        return #err("Energy verification already exists");
      };
    };

    var projectExists = false;

for (project in projects.vals()) {
      if (project.project_id == verification.project_id) {
        projectExists := true;
      };
    };

    if (not projectExists) {
      return #err("Referenced project does not exist");
    };

    var assetExists = false;
    var assetProjectMatches = false;

    for (asset in assets.vals()) {
      if (asset.asset_id == verification.asset_id) {
        assetExists := true;

        if (asset.project_id == verification.project_id) {
          assetProjectMatches := true;
        };
      };
    };

    if (not assetExists) {
      return #err("Referenced asset does not exist");
    };

    if (not assetProjectMatches) {
      return #err("Asset does not belong to referenced project");
    };

    energyVerifications := Array.append<EnergyVerification>(
      energyVerifications,
      [verification]
    );

    #ok(verification)
  };

  public query func get_energy_verification(
    verification_id : Text
  ) : async ?EnergyVerification {
    for (verification in energyVerifications.vals()) {
      if (verification.verification_id == verification_id) {
        return ?verification;
      };
    };

    null
  };

  public query func list_energy_verifications() : async [EnergyVerification] {
    energyVerifications
  };

  // P04-04 — Create Certificate Registry Record
  //
  // توجه: این تابع هنوز NFT mint نمی‌کند.
  // فقط رکورد Certificate را در Protocol Registry ثبت می‌کند.
  // ============================================================

  public shared ({ caller }) func create_certificate(
    certificate : GeramCertificate
  ) : async CertificateResult {

    if (not isOwner(caller)) {
      return #err("Unauthorized: only GERAM owner can create a certificate");
    };

    switch (
      Array.find<GeramCertificate>(
        certificates,
        func(c : GeramCertificate) : Bool {
          c.certificate_id == certificate.certificate_id
        }
      )
    ) {
      case (?_) {
        #err("Certificate already exists");
      };

      case null {
        certificates := Array.append<GeramCertificate>(
          certificates,
          [certificate]
        );
        #ok(certificate);
      };
    };
  };

  // ============================================================
  // P04-05 — Get Certificate
  // ============================================================

  // ============================================================
  // GERAM-P07.8 — Issue Certificate + ICRC-7 Mint
  // ============================================================

  public shared ({ caller }) func issue_certificate(
    request : IssueCertificateRequest
  ) : async IssueCertificateResult {

    // ------------------------------------------------------------
    // 1. Authorization
    // ------------------------------------------------------------

    if (not isOwner(caller)) {
      return #err("Unauthorized: only GERAM owner can issue a certificate");
    };

    // ------------------------------------------------------------
    // 2. Basic request validation
    // ------------------------------------------------------------

    if (request.certificate_id == "") {
      return #err("Certificate issuance failed: empty certificate_id");
    };

    if (request.project_id == "") {
      return #err("Certificate issuance failed: empty project_id");
    };

    if (request.issuer_id == "") {
      return #err("Certificate issuance failed: empty issuer_id");
    };

    if (request.face_value == 0) {
      return #err("Certificate issuance failed: face_value is zero");
    };

    if (request.base_value == 0) {
      return #err("Certificate issuance failed: base_value is zero");
    };

    if (request.currency == "") {
      return #err("Certificate issuance failed: empty currency");
    };

    if (request.icp_value == 0) {
      return #err(
        "Certificate issuance failed: icp_value is zero"
      );
    };

    if (request.icp_valuation_timestamp <= 0) {
      return #err(
        "Certificate issuance failed: invalid icp_valuation_timestamp"
      );
    };

    // ------------------------------------------------------------
    // 3. Validate referenced Project
    // ------------------------------------------------------------

    switch (
      Array.find<Project>(
        projects,
        func(p : Project) : Bool {
          p.project_id == request.project_id
        }
      )
    ) {
      case null {
        return #err(
          "Certificate issuance failed: referenced project not found"
        );
      };

      case (?_) {};
    };

    // ------------------------------------------------------------
    // 4. Validate optional Asset reference
    // ------------------------------------------------------------

    switch (request.asset_id) {
      case null {};
      case (?assetId) {

        if (assetId == "") {
          return #err(
            "Certificate issuance failed: asset_id is empty"
          );
        };

        switch (
          Array.find<Asset>(
            assets,
            func(a : Asset) : Bool {
              a.asset_id == assetId
            }
          )
        ) {
          case null {
            return #err(
              "Certificate issuance failed: referenced asset not found"
            );
          };

          case (?asset) {
            if (asset.project_id != request.project_id) {
              return #err(
                "Certificate issuance failed: asset does not belong to referenced project"
              );
            };
          };
        };
      };
    };

    // ------------------------------------------------------------
    // 5. Certificate uniqueness
    // ------------------------------------------------------------

    switch (
      Array.find<GeramCertificate>(
        certificates,
        func(c : GeramCertificate) : Bool {
          c.certificate_id == request.certificate_id
        }
      )
    ) {
      case (?_) {
        return #err("Certificate issuance failed: certificate already exists");
      };

      case null {};
    };

    // ------------------------------------------------------------
    // 6. Issue timestamp
    // ------------------------------------------------------------

    let issueTimestamp : Int = Time.now();

    if (request.maturity_timestamp <= issueTimestamp) {
      return #err(
        "Certificate issuance failed: maturity must be after issue timestamp"
      );
    };

    // ------------------------------------------------------------
    // 7. Allocate an unused GERAM Token ID
    // ------------------------------------------------------------

    let tokenId : Nat = findAvailableGeramTokenId();

    // ------------------------------------------------------------
    // 8. Build generic GERAM NFT metadata
    // ------------------------------------------------------------

    let metadata : ICRC7.NFTInput = #Map([
      ("certificate_id", #Text(request.certificate_id)),
      ("token_id", #Nat(tokenId)),
      ("project_id", #Text(request.project_id)),
      ("issuer_id", #Text(request.issuer_id)),
      ("certificate_type", #Text("GERAM")),
      ("face_value", #Nat(request.face_value)),
      ("base_value", #Nat(request.base_value)),
      ("currency", #Text(request.currency)),
      ("icp_value", #Nat(request.icp_value)),
      ("icp_valuation_timestamp", #Int(request.icp_valuation_timestamp)),
      ("maturity_timestamp", #Int(request.maturity_timestamp)),
      ("issue_timestamp", #Int(issueTimestamp)),
      ("physical_certificate_available", #Bool(
        request.physical_certificate_available
      )),
      ("physical_certificate_hash", #Option(
        switch (request.physical_certificate_hash) {
          case (?value) { ?#Text(value) };
          case null { null };
        }
      )),
      ("qr_reference", #Option(
        switch (request.qr_reference) {
          case (?value) { ?#Text(value) };
          case null { null };
        }
      )),
      ("GeramID", #Text(
        switch (request.qr_reference) {
          case (?value) { value };
          case null { request.certificate_id };
        }
      )),
      ("asset_id", #Option(
        switch (request.asset_id) {
          case (?value) { ?#Text(value) };
          case null { null };
        }
      )),
      ("asset_type", #Option(
        switch (request.asset_type) {
          case (?value) { ?#Text(value) };
          case null { null };
        }
      )),
      ("title", #Option(
        switch (request.title) {
          case (?value) { ?#Text(value) };
          case null { null };
        }
      )),
      ("description", #Option(
        switch (request.description) {
          case (?value) { ?#Text(value) };
          case null { null };
        }
      )),
      ("metadata_uri", #Option(
        switch (request.metadata_uri) {
          case (?value) { ?#Text(value) };
          case null { null };
        }
      )),
      ("external_reference", #Option(
        switch (request.external_reference) {
          case (?value) { ?#Text(value) };
          case null { null };
        }
      ))
    ]);

    // ------------------------------------------------------------
    // 9. Mint through ICRC-7
    // ------------------------------------------------------------

    let targetAccount : ICRC7.Account = {
      owner = request.initial_holder;
      subaccount = null;
    };

    let mintRequest : ICRC7.SetNFTRequest = [{
      token_id = tokenId;
      metadata = metadata;
      owner = ?targetAccount;
      override = false;
      memo = null;
      created_at_time = null;
    }];

    let mintResult =
      icrc7().set_nfts<system>(
        _owner,
        mintRequest,
        true
      );

    // ------------------------------------------------------------
    // 10. Confirm successful Mint and obtain transaction ID
    // ------------------------------------------------------------

    let transactionId : Nat = switch (mintResult) {

      case (#err(errorMessage)) {
        return #err(
          "Certificate issuance failed: ICRC-7 mint call failed: "
          # errorMessage
        );
      };

      case (#ok(results)) {

        if (results.size() != 1) {
          return #err(
            "Certificate issuance failed: unexpected ICRC-7 result count"
          );
        };

        switch (results[0]) {

          case (#Ok(?txId)) {
            txId;
          };

          case (#Ok(null)) {
            return #err(
              "Certificate issuance failed: ICRC-7 returned no transaction ID"
            );
          };

          case (#Err(_)) {
            return #err(
              "Certificate issuance failed: ICRC-7 rejected the mint request"
            );
          };

          case (#GenericError(error)) {
            return #err(
              "Certificate issuance failed: ICRC-7 generic error "
              # error.message
            );
          };
        };
      };
    };

    // ------------------------------------------------------------
    // 11. Create Certificate Registry record
    // ------------------------------------------------------------

    let certificate : GeramCertificate = {
      certificate_id = request.certificate_id;
      token_id = tokenId;
      project_id = request.project_id;
      issuer_id = request.issuer_id;
      initial_holder = request.initial_holder;
      issue_timestamp = issueTimestamp;
      maturity_timestamp = request.maturity_timestamp;
      face_value = request.face_value;
      base_value = request.base_value;
      currency = request.currency;
      icp_value = request.icp_value;
      icp_valuation_timestamp = request.icp_valuation_timestamp;
      annual_return_bps = request.annual_return_bps;
      risk_level = request.risk_level;
      physical_certificate_available =
        request.physical_certificate_available;
      physical_certificate_hash =
        request.physical_certificate_hash;
      qr_reference = request.qr_reference;
    };

    certificates := Array.append<GeramCertificate>(
      certificates,
      [certificate]
    );

    // ------------------------------------------------------------
    // 12. Advance allocator only after successful Mint + Registry
    // ------------------------------------------------------------

    nextGeramTokenId := tokenId + 1;

    // ------------------------------------------------------------
    // 13. Return issued Certificate
    // ------------------------------------------------------------

    #ok({
      certificate = certificate;
      token_id = tokenId;
      transaction_id = transactionId;
    });
  };

 public query func get_certificate(
    certificate_id : Text
  ) : async ?GeramCertificate {

    Array.find<GeramCertificate>(
      certificates,
      func(c : GeramCertificate) : Bool {
        c.certificate_id == certificate_id
      }
    );
  };

  // ============================================================
  // P04-06 — List Certificates
  // ============================================================

  public query func list_certificates() : async [GeramCertificate] {
    certificates
  };

  // ============================================================
  // P04-07 — Create Market Snapshot
  // ============================================================

  public shared ({ caller }) func create_market_snapshot(
    snapshot : MarketSnapshot
  ) : async MarketSnapshotResult {

    if (not isOwner(caller)) {
      return #err("Unauthorized: only GERAM owner can create a market snapshot");
    };

    marketSnapshots := Array.append<MarketSnapshot>(
      marketSnapshots,
      [snapshot]
    );

    #ok(snapshot);
  };

  // ============================================================
  // P04-08 — Get Latest Market Snapshot
  // ============================================================

  public query func get_market_snapshot(
    certificate_id : Text
  ) : async ?MarketSnapshot {

    var result : ?MarketSnapshot = null;

    for (snapshot in marketSnapshots.vals()) {
      if (snapshot.certificate_id == certificate_id) {
        result := ?snapshot;
      };
    };

    result;
  };

  // ====
// P04-09 — List Market Snapshots
  // ============================================================

  public query func list_market_snapshots() : async [MarketSnapshot] {
    marketSnapshots
  };

  // ============================================================
  // GERAM-HAMIFUND — Registry API
  //
  // P21:
  // فقط ثبت و بازیابی داده‌های HamiFund را انجام می‌دهد.
  // هیچ عملیات مالی، AI execution یا NFT minting ندارد.
  // ============================================================

  // ------------------------------------------------------------
  // P21-01 — Create HamiFund
  // ------------------------------------------------------------

  public shared ({ caller }) func create_hami_fund(
    fund : HamiFund
  ) : async HamiFundResult {

    if (not isOwner(caller)) {
      return #err("Unauthorized: only GERAM owner can create a HamiFund");
    };

    switch (
      Array.find<HamiFund>(
        hamiFunds,
        func(f : HamiFund) : Bool {
          f.fund_id == fund.fund_id
        }
      )
    ) {
      case (?_) {
        #err("HamiFund already exists");
      };

      case null {
        hamiFunds := Array.append<HamiFund>(
          hamiFunds,
          [fund]
        );

        #ok(fund);
      };
    };
  };

  // ------------------------------------------------------------
  // P21-02 — Get HamiFund
  // ------------------------------------------------------------

  public query func get_hami_fund(
    fund_id : Text
  ) : async ?HamiFund {

    Array.find<HamiFund>(
      hamiFunds,
      func(f : HamiFund) : Bool {
        f.fund_id == fund_id
      }
    );
  };

  // ------------------------------------------------------------
  // P21-03 — List HamiFunds
  // ------------------------------------------------------------

  public query func list_hami_funds() : async [HamiFund] {
    hamiFunds
  };

  // ------------------------------------------------------------
  // P21-04 — Create Fund Asset
  // ------------------------------------------------------------

  public shared ({ caller }) func create_fund_asset(
    asset : FundAsset
  ) : async FundAssetResult {

    if (not isOwner(caller)) {
      return #err("Unauthorized: only GERAM owner can create a fund asset");
    };

    switch (
      Array.find<FundAsset>(
        fundAssets,
        func(a : FundAsset) : Bool {
          a.asset_id == asset.asset_id
        }
      )
    ) {
      case (?_) {
        #err("Fund asset already exists");
      };

      case null {
        fundAssets := Array.append<FundAsset>(
          fundAssets,
          [asset]
        );

        #ok(asset);
      };
    };
  };

  // ------------------------------------------------------------
  // P21-05 — Get Fund Asset
  // ------------------------------------------------------------

  public query func get_fund_asset(
    asset_id : Text
  ) : async ?FundAsset {

    Array.find<FundAsset>(
      fundAssets,
      func(a : FundAsset) : Bool {
        a.asset_id == asset_id
      }
    );
  };

  // ------------------------------------------------------------
  // P21-06 — List Fund Assets
  // ------------------------------------------------------------

  public query func list_fund_assets(
    fund_id : ?Text
  ) : async [FundAsset] {

    switch (fund_id) {
      case null {
        fundAssets;
      };

      case (?id) {
        Array.filter<FundAsset>(
          fundAssets,
          func(a : FundAsset) : Bool {
            a.fund_id == id
          }
        );
      };
    };
  };

  // ------------------------------------------------------------
  // P21-07 — Create Fund Position
  // ------------------------------------------------------------

  public shared ({ caller }) func create_fund_position(
    position : FundPosition
  ) : async FundPositionResult {

    if (not isOwner(caller)) {
      return #err("Unauthorized: only GERAM owner can create a fund position");
    };

    switch (
      Array.find<FundPosition>(
        fundPositions,
        func(pos : FundPosition) : Bool {
          pos.position_id == position.position_id
        }
      )
    ) {
      case (?_) {
        #err("Fund position already exists");
      };

      case null {
        fundPositions := Array.append<FundPosition>(
          fundPositions,
          [position]
        );

        #ok(position);
      };
    };
  };

  // ------------------------------------------------------------
  // P21-08 — Get Fund Position
  public query func get_fund_position(
    position_id : Text
  ) : async ?FundPosition {

    Array.find<FundPosition>(
      fundPositions,
      func(pos : FundPosition) : Bool {
        pos.position_id == position_id
      }
    );
  };

  // ------------------------------------------------------------
  // P21-09 — List Fund Positions
  // ------------------------------------------------------------

  public query func list_fund_positions(
    fund_id : ?Text
  ) : async [FundPosition] {

    switch (fund_id) {
      case null {
        fundPositions;
      };

      case (?id) {
        Array.filter<FundPosition>(
          fundPositions,
          func(pos : FundPosition) : Bool {
            pos.fund_id == id
          }
        );
      };
    };
  };

  // ------------------------------------------------------------
  // P21-10 — Record Fund Transaction
  // ------------------------------------------------------------

  public shared ({ caller }) func record_fund_transaction(
    transaction : FundTransaction
  ) : async FundTransactionResult {

    if (not isOwner(caller)) {
      return #err("Unauthorized: only GERAM owner can record a fund transaction");
    };

    switch (
      Array.find<FundTransaction>(
        fundTransactions,
        func(t : FundTransaction) : Bool {
          t.transaction_id == transaction.transaction_id
        }
      )
    ) {
      case (?_) {
        #err("Fund transaction already exists");
      };

      case null {
        fundTransactions := Array.append<FundTransaction>(
          fundTransactions,
          [transaction]
        );

        #ok(transaction);
      };
    };
  };

  // ------------------------------------------------------------
  // P21-11 — Get Fund Transaction
  // ------------------------------------------------------------// ------------------------------------------------------------

  public query func get_fund_transaction(
    transaction_id : Text
  ) : async ?FundTransaction {

    Array.find<FundTransaction>(
      fundTransactions,
      func(t : FundTransaction) : Bool {
        t.transaction_id == transaction_id
      }
    );
  };

  // ------------------------------------------------------------
  // P21-12 — List Fund Transactions
  // ------------------------------------------------------------

  public query func list_fund_transactions(
    fund_id : ?Text
  ) : async [FundTransaction] {

    switch (fund_id) {
      case null {
        fundTransactions;
      };

      case (?id) {
        Array.filter<FundTransaction>(
          fundTransactions,
          func(t : FundTransaction) : Bool {
            t.fund_id == id
          }
        );
      };
    };
  };


  // ============================================================
  // P41-VALIDATION-FUNCTIONS
  // READ-ONLY — NO STATE MUTATION
  // ============================================================

  // ------------------------------------------------------------
  // P41-01 — Validate Project
  // ------------------------------------------------------------

  public query func validate_project(
    project_id : Text
  ) : async ValidationResult {

    if (project_id == "") {
      return #err("Project validation failed: empty project_id");
    };

    switch (
      Array.find<Project>(
        projects,
        func(p : Project) : Bool {
          p.project_id == project_id
        }
      )
    ) {
      case null {
        #err("Project validation failed: project not found");
      };

      case (?project) {

        if (project.issuer_id == "") {
          return #err("Project validation failed: empty issuer_id");
        };

        if (project.title == "") {
          return #err("Project validation failed: empty title");
        };

        if (project.asset.asset_id == "") {
          return #err("Project validation failed: empty asset_id");
        };

        if (project.valuation.base_value == 0) {
          return #err("Project validation failed: base_value is zero");
        };

        if (project.financial_terms.face_value == 0) {
          return #err("Project validation failed: face_value is zero");
        };

        if (project.financial_terms.currency == "") {
          return #err("Project validation failed: empty currency");
        };

        #ok("Project validation passed");
      };
    };
  };

  // ------------------------------------------------------------
  // P41-02 — Validate Certificate
  // ------------------------------------------------------------

  public query func validate_certificate(
    certificate_id : Text
  ) : async ValidationResult {

    if (certificate_id == "") {
      return #err("Certificate validation failed: empty certificate_id");
    };

    switch (
      Array.find<GeramCertificate>(
        certificates,
        func(c : GeramCertificate) : Bool {
          c.certificate_id == certificate_id
        }
      )
    ) {
      case null {
        #err("Certificate validation failed: certificate not found");
      };

      case (?certificate) {

        if (certificate.certificate_id == "") {
          return #err("Certificate validation failed: empty certificate_id");
        };

  if (certificate.project_id == "") {
          return #err("Certificate validation failed: empty project_id");
        };

        if (certificate.issuer_id == "") {
          return #err("Certificate validation failed: empty issuer_id");
        };

        if (certificate.face_value == 0) {
          return #err("Certificate validation failed: face_value is zero");
        };

        if (certificate.base_value == 0) {
          return #err("Certificate validation failed: base_value is zero");
        };

        if (certificate.currency == "") {
          return #err("Certificate validation failed: empty currency");
        };

        if (certificate.icp_value == 0) {
          return #err("Certificate validation failed: icp_value is zero");
        };

        if (certificate.icp_valuation_timestamp <= 0) {
          return #err(
            "Certificate validation failed: invalid icp_valuation_timestamp"
          );
        };

        if (certificate.token_id == 0) {
          return #err("Certificate validation failed: token_id is zero");
        };

        if (certificate.maturity_timestamp <= certificate.issue_timestamp) {
          return #err(
            "Certificate validation failed: maturity must be after issue timestamp"
          );
        };

        switch (
          Array.find<Project>(
            projects,
            func(p : Project) : Bool {
              p.project_id == certificate.project_id
            }
          )
        ) {
          case null {
            return #err(
              "Certificate validation failed: referenced project not found"
            );
          };

          case (?_) {};
        };

        #ok("Certificate validation passed");
      };
    };
  };

  // ------------------------------------------------------------
  // P41-03 — Validate HamiFund
  // ------------------------------------------------------------

  public query func validate_hami_fund(
    fund_id : Text
  ) : async ValidationResult {

    if (fund_id == "") {
      return #err("HamiFund validation failed: empty fund_id");
    };

    switch (
      Array.find<HamiFund>(
        hamiFunds,
        func(f : HamiFund) : Bool {
          f.fund_id == fund_id
        }
      )
    ) {
      case null {
        #err("HamiFund validation failed: fund not found");
      };

      case (?fund) {

        if (fund.name == "") {
          return #err("HamiFund validation failed: empty name");
        };

        if (fund.manager_id == "") {
          return #err("HamiFund validation failed: empty manager_id");
        };

        if (fund.base_currency == "") {
          return #err("HamiFund validation failed: empty base_currency");
        };

        if (fund.target_value == 0) {
          return #err("HamiFund validation failed: target_value is zero");
        };

        if (fund.risk_parameters.max_asset_weight_bps > 10_000) {
          return #err(
            "HamiFund validation failed: max_asset_weight_bps exceeds 10000"
          );
        };

        if (
          fund.risk_parameters.max_single_project_weight_bps > 10_000
        ) {
          return #err(
            "HamiFund validation failed: max_single_project_weight_bps exceeds 10000"
          );
        };

        if (fund.risk_parameters.min_liquidity_bps > 10_000) {
          return #err(
            "HamiFund validation failed: min_liquidity_bps exceeds 10000"
          );
        };

        if (fund.risk_parameters.max_drawdown_bps > 10_000) {
          return #err(
            "HamiFund validation failed: max_drawdown_bps exceeds 10000"
          );
        };

        #ok("HamiFund validation passed");
      };
    };
  };

  // ------------------------------------------------------------
  // P41-04 — Validate Fund Asset
  // ------------------------------------------------------------

  public query func validate_fund_asset(
    asset_id : Text
  ) : async ValidationResult {

    if (asset_id == "") {
      return #err("FundAsset validation failed: empty asset_id");
    };

    switch (
      Array.find<FundAsset>(
        fundAssets,
        func(a : FundAsset) : Bool {
          a.asset_id == asset_id
        }
      )
    ) {
      case null {
        #err("FundAsset validation failed: asset not found");
      };

    case (?asset) {

        if (asset.fund_id == "") {
          return #err("FundAsset validation failed: empty fund_id");
        };

        if (asset.asset_type == "") {
          return #err("FundAsset validation failed: empty asset_type");
        };

        switch (
          Array.find<HamiFund>(
            hamiFunds,
            func(f : HamiFund) : Bool {
              f.fund_id == asset.fund_id
            }
          )
        ) {
          case null {
            return #err(
              "FundAsset validation failed: referenced fund not found"
            );
          };

          case (?_) {};
        };

        switch (asset.certificate_id) {
          case null {};
          case (?certificate_id) {
            switch (
              Array.find<GeramCertificate>(
                certificates,
                func(c : GeramCertificate) : Bool {
                  c.certificate_id == certificate_id
                }
              )
            ) {
              case null {
                return #err(
                  "FundAsset validation failed: referenced certificate not found"
                );
              };

              case (?_) {};
            };
          };
        };

        switch (asset.project_id) {
          case null {};
          case (?project_id) {
            switch (
              Array.find<Project>(
                projects,
                func(p : Project) : Bool {
                  p.project_id == project_id
                }
              )
            ) {
              case null {
                return #err(
                  "FundAsset validation failed: referenced project not found"
                );
              };

              case (?_) {};
            };
          };
        };

        if (asset.quantity == 0) {
          return #err("FundAsset validation failed: quantity is zero");
        };

        if (asset.current_value == 0) {
          return #err("FundAsset validation failed: current_value is zero");
        };

        #ok("FundAsset validation passed");
      };
    };
  };

  // ------------------------------------------------------------
  // P41-05 — Validate Fund Position
  // ------------------------------------------------------------

  public query func validate_fund_position(
    position_id : Text
  ) : async ValidationResult {

    if (position_id == "") {
      return #err("FundPosition validation failed: empty position_id");
    };

    switch (
      Array.find<FundPosition>(
        fundPositions,
        func(pos : FundPosition) : Bool {
          pos.position_id == position_id
        }
      )
    ) {
      case null {
        #err("FundPosition validation failed: position not found");
      };

      case (?position) {

        if (position.fund_id == "") {
          return #err("FundPosition validation failed: empty fund_id");
        };

        switch (
          Array.find<HamiFund>(
            hamiFunds,
            func(f : HamiFund) : Bool {
              f.fund_id == position.fund_id
            }
          )
        ) {
          case null {
            return #err(
              "FundPosition validation failed: referenced fund not found"
            );
          };

          case (?_) {};
        };

        if (position.owner == Principal.fromText("aaaaa-aa")) {
          return #err(
            "FundPosition validation failed: anonymous principal is not allowed"
          );
        };

        if (position.current_value < position.deposited_value) {
          return #err(
            "FundPosition validation failed: current_value below deposited_value"
          );
        };

        if (position.share_units == 0) {
          return #err("FundPosition validation failed: share_units is zero");
        };

        #ok("FundPosition validation passed");
      };
    };
  };

  // ------------------------------------------------------------
  // P41-06 — Validate Fund Transaction
  // ------------------------------------------------------------

  public query func validate_fund_transaction(
    transaction_id : Text
  ) : async ValidationResult {

    if (transaction_id == "") {
      return #err(
        "FundTransaction validation failed: empty transaction_id"
      );
    };

    switch (
      Array.find<FundTransaction>(
        fundTransactions,
        func(t : FundTransaction) : Bool {
          t.transaction_id == transaction_id
        }
      )
    ) {
      case null {
        #err("FundTransaction validation failed: transaction not found");
      };

      case (?transaction) {

        if (transaction.fund_id == "") {
          return #err(
            "FundTransaction validation failed: empty fund_id"
          );
        };

        switch (
          Array.find<HamiFund>(
            hamiFunds,
            func(f : HamiFund) : Bool {
              f.fund_id == transaction.fund_id
            }
          )
        ) {
          case null {
            return #err(
              "FundTransaction validation failed: referenced fund not found"
            );
          };

          case (?_) {};
        };

        if (transaction.actor_principal == Principal.fromText("aaaaa-aa")) {
          return #err(
            "FundTransaction validation failed: anonymous principal is not allowed"
          );
        };

        if (transaction.value == 0) {
          return #err(
            "FundTransaction validation failed: transaction value is zero"
          );
        };

        #ok("FundTransaction validation passed");
      };
    };
  };


};
