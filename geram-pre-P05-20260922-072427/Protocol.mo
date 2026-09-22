module {

  public type ProjectType = {
    #Energy;
    #Housing;
    #Production;
    #Logistics;
    #Infrastructure;
    #Other;
  };

  public type ProjectStatus = {
    #Draft;
    #Approved;
    #Active;
    #Completed;
    #Matured;
    #Suspended;
  };

  public type RiskLevel = {
    #Low;
    #Medium;
    #High;
  };

  public type AssetReference = {
    asset_id : Text;
    asset_type : Text;
    description : Text;
    registry_reference : ?Text;
  };

  public type Valuation = {
    base_value : Nat;
    valuation_unit : Text;
    valuation_date : Int;
    expert_reference : ?Text;
    methodology : ?Text;
  };

  public type FinancialTerms = {
    maturity_timestamp : Int;
    annual_return_bps : ?Nat;
    face_value : Nat;
    currency : Text;
    liquidity_guaranteed : Bool;
  };

  public type Project = {
    project_id : Text;
    issuer_id : Text;
    project_type : ProjectType;
    title : Text;
    description : Text;
    status : ProjectStatus;
    asset : AssetReference;
    valuation : Valuation;
    financial_terms : FinancialTerms;
    risk_level : RiskLevel;
  };

  public type GeramCertificate = {
    certificate_id : Text;
    token_id : Nat;
    project_id : Text;
    issuer_id : Text;
    initial_holder : Principal;
    issue_timestamp : Int;
    maturity_timestamp : Int;
    face_value : Nat;
    base_value : Nat;
    currency : Text;
    annual_return_bps : ?Nat;
    risk_level : RiskLevel;
    physical_certificate_available : Bool;
    physical_certificate_hash : ?Text;
    qr_reference : ?Text;
  };

  public type OrganizationRole = {
    #FlowChain;
    #ICP;
    #ZK;
    #PAI;
    #PFC;
    #THS;
    #NSJ;
    #Other;
  };

  public type OrganizationNode = {
    node_id : Text;
    name : Text;
    acronym : Text;
    role : OrganizationRole;
    active : Bool;
  };

  public type MarketSnapshot = {
    certificate_id : Text;
    valuation_timestamp : Int;
    base_value : Nat;
    indicative_value : Nat;
    demand_level : ?Nat;
    supply_level : ?Nat;
    annual_return_bps : ?Nat;
    risk_level : RiskLevel;
    maturity_timestamp : Int;
    valuation_reference : ?Text;
  };

}
