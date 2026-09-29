module {

  public type ErrorCode = {
    #EmptyField;
    #ZeroValue;
    #InvalidValue;
    #NotFound;
    #AnonymousNotAllowed;
    #ValueBelowRequired;
    #Duplicate;
    #AuthorizationDenied;
    #SystemInternal;
    #SystemUnknown;
    #ExternalUnavailable;
    #ExternalTimeout;
  };

  public func toText(code : ErrorCode) : Text {
    switch (code) {
      case (#EmptyField) { "VALIDATION.EMPTY_FIELD" };
      case (#ZeroValue) { "VALIDATION.ZERO_VALUE" };
      case (#InvalidValue) { "VALIDATION.INVALID_VALUE" };
      case (#NotFound) { "REFERENCE.NOT_FOUND" };
      case (#AnonymousNotAllowed) { "IDENTITY.ANONYMOUS_NOT_ALLOWED" };
      case (#ValueBelowRequired) { "BUSINESS_RULE.VALUE_BELOW_REQUIRED" };
      case (#Duplicate) { "CONFLICT.DUPLICATE" };
      case (#AuthorizationDenied) { "AUTHORIZATION.DENIED" };
      case (#SystemInternal) { "SYSTEM.INTERNAL" };
      case (#SystemUnknown) { "SYSTEM.UNKNOWN" };
      case (#ExternalUnavailable) { "EXTERNAL.UNAVAILABLE" };
      case (#ExternalTimeout) { "EXTERNAL.TIMEOUT" };
    };
  };
};
