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
  // GERAM-P04 — API Result Types
  // ============================================================

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
  // GERAM-P04 — Stable Protocol Registry
  //
  // این Registry هنوز دفتر صدور NFT نیست.
  // فقط لایه داده‌ای Protocol را نگهداری می‌کند.
  // ============================================================

  stable var projects : [Project] = [];
  stable var certificates : [GeramCertificate] = [];
  stable var marketSnapshots : [MarketSnapshot] = [];

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

};
