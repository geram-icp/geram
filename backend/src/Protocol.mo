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


  // ============================================================
  // HAMIFUND — AI-DeFi Specialized Decentralized Fund Layer
  // ============================================================

  public type FundType = {
    #Housing;
    #Energy;
    #Tourism;
    #Production;
    #Logistics;
    #Infrastructure;
    #MultiSector;
    #Other;
  };

  public type FundStatus = {
    #Draft;
    #Active;
    #Paused;
    #Closed;
    #Matured;
  };

  public type FundStrategy = {
    #Hold;
    #Trade;
    #Liquidity;
    #Collateral;
    #Income;
    #MultiStrategy;
  };

  public type AIStrategyStatus = {
    #Disabled;
    #Advisory;
    #Assisted;
    #Automated;
  };

  public type AIModelReference = {
    model_id : Text;
    model_version : Text;
    provider : ?Text;
    endpoint_reference : ?Text;
    enabled : Bool;
  };

  public type FundRiskParameters = {
    max_asset_weight_bps : Nat;
    max_single_project_weight_bps : Nat;
    max_risk_level : RiskLevel;
    min_liquidity_bps : Nat;
    max_drawdown_bps : Nat;
  };

  public type HamiFund = {
    fund_id : Text;
    name : Text;
    title : Text;
    description : Text;
    fund_type : FundType;
    status : FundStatus;
    strategy : FundStrategy;

    base_currency : Text;
    manager_id : Text;

    created_at : Int;
    activation_timestamp : ?Int;
    maturity_timestamp : ?Int;

    target_value : Nat;
    minimum_position_value : ?Nat;

    ai_status : AIStrategyStatus;
    ai_model : ?AIModelReference;
    risk_parameters : FundRiskParameters;

    decentralized : Bool;
    smart_contract_reference : ?Text;

    allowed_geram : Bool;
    allowed_tokens : [Text];

    metadata_uri : ?Text;
  };

  public type FundAsset = {
    fund_id : Text;
    asset_id : Text;
    asset_type : Text;
    certificate_id : ?Text;
    token_id : ?Nat;
    project_id : ?Text;

    quantity : Nat;
    acquisition_value : Nat;
    current_value : Nat;

    valuation_timestamp : Int;
    risk_level : RiskLevel;
    active : Bool;
  };

  public type FundPosition = {
    position_id : Text;
    fund_id : Text;
    owner : Principal;

    deposited_value : Nat;
    current_value : Nat;

    asset_count : Nat;
    share_units : Nat;

    created_at : Int;
    updated_at : Int;
    active : Bool;
  };

  public type FundTransactionType = {
    #Deposit;
    #Withdrawal;
    #AssetAcquire;
    #AssetSell;
    #Rebalance;
    #Distribution;
    #Fee;
    #Adjustment;
  };

  public type FundTransaction = {
    transaction_id : Text;
    fund_id : Text;
    position_id : ?Text;
    transaction_type : FundTransactionType;

    actor_principal : Principal;
    asset_id : ?Text;
    certificate_id : ?Text;
    token_id : ?Nat;

    value : Nat;
    timestamp : Int;

    reference : ?Text;
    ai_generated : Bool;
  };

}
