import Array "mo:base/Array";
import ClassPlus "mo:class-plus";
import ICRC7 "mo:icrc7-mo";
import Principal "mo:base/Principal";

import ICRC7Mixin "mo:icrc7-mo/mixin";
import Protocol "./Protocol";

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
    description = ?"Green Energy & Resource Asset Mechanism";
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

  include ICRC7Mixin({
    ICRC7.defaultMixinArgs(org_icdevs_class_plus_manager) with
    args = ?geramArgs;
    pullEnvironment = ?getGeramEnvironment;
    onInitialize = null;
  });

  // ============================================================
  // GERAM Protocol v1.0 — public type aliases
  // ============================================================

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

  stable var projects : [Project] = [];
  stable var assets : [Asset] = [];
  stable var energyVerifications : [EnergyVerification] = [];
  stable var certificates : [GeramCertificate] = [];
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
