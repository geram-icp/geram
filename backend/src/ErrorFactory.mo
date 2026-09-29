import ErrorCode "./ErrorCode";
import Result "./Result";

module {

  public func fromCode(
    code : ErrorCode.ErrorCode,
    message : Text,
    correlation_id : ?Text
  ) : Result.Error {

    let category : Result.ErrorCategory = switch (code) {
      case (#EmptyField) { #RequiredField };
      case (#ZeroValue) { #Validation };
      case (#InvalidValue) { #Validation };
      case (#NotFound) { #NotFound };
      case (#AnonymousNotAllowed) { #Identity };
      case (#ValueBelowRequired) { #BusinessRule };
      case (#Duplicate) { #Conflict };
      case (#AuthorizationDenied) { #Authorization };
      case (#SystemInternal) { #System };
      case (#SystemUnknown) { #System };
      case (#ExternalUnavailable) { #External };
      case (#ExternalTimeout) { #External };
    };

    let retryable : Bool = switch (code) {
      case (#SystemUnknown) { true };
      case (#ExternalUnavailable) { true };
      case (#ExternalTimeout) { true };
      case (_) { false };
    };

    let state : Result.ErrorState = switch (code) {
      case (#SystemUnknown) { #Unknown };
      case (_) { #Failed };
    };

    {
      code = ErrorCode.toText(code);
      category = category;
      message = message;
      retryable = retryable;
      state = state;
      correlation_id = correlation_id;
    }
  };
};
