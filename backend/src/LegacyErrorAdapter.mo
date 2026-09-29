import ErrorCode "./ErrorCode";
import ErrorFactory "./ErrorFactory";
import ErrorMapper "./ErrorMapper";
import Result "./Result";

module {

  public func fromLegacy(
    message : Text,
    correlation_id : ?Text
  ) : Result.Result<Result.Error> {

    let code : ErrorCode.ErrorCode =
      ErrorMapper.map(message);

    #ok(
      ErrorFactory.fromCode(
        code,
        message,
        correlation_id
      )
    )
  };
};
