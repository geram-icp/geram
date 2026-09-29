import ErrorCode "./ErrorCode";

module {

  public func map(message : Text) : ErrorCode.ErrorCode {
    if (message == "asset not found" or
        message == "position not found" or
        message == "transaction not found" or
        message == "referenced fund not found" or
        message == "referenced certificate not found" or
        message == "referenced project not found" or
        message == "certificate not found" or
        message == "fund not found" or
        message == "project not found") {
      #NotFound
    } else if (message == "anonymous principal is not allowed") {
      #AnonymousNotAllowed
    } else if (message == "quantity is zero" or
               message == "current_value is zero" or
               message == "share_units is zero" or
               message == "transaction value is zero" or
               message == "target_value is zero" or
               message == "base_value is zero" or
               message == "face_value is zero" or
               message == "token_id is zero") {
      #ZeroValue
    } else if (message == "current_value below deposited_value") {
      #ValueBelowRequired
    } else if (message == "empty fund_id" or
               message == "empty asset_type" or
               message == "empty asset_id" or
               message == "empty position_id" or
               message == "empty transaction_id" or
               message == "empty base_currency" or
               message == "empty certificate_id" or
               message == "empty currency" or
               message == "empty issuer_id" or
               message == "empty manager_id" or
               message == "empty name" or
               message == "empty project_id" or
               message == "empty title") {
      #EmptyField
    } else if (
      message == "maturity must be after issue timestamp" or
      message == "max_asset_weight_bps exceeds 10000" or
      message == "max_drawdown_bps exceeds 10000" or
      message == "max_single_project_weight_bps exceeds 10000" or
      message == "min_liquidity_bps exceeds 10000"
    ) {
      #InvalidValue
    } else {
      #InvalidValue
    };
  };
};
