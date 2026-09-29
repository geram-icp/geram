module {

  public type ErrorCategory = {
    #Validation;
    #RequiredField;
    #NotFound;
    #Reference;
    #Identity;
    #BusinessRule;
    #Authorization;
    #Conflict;
    #System;
    #External;
  };

  public type ErrorState = {
    #Failed;
    #Unknown;
  };

  public type Error = {
    code : Text;
    category : ErrorCategory;
    message : Text;
    retryable : Bool;
    state : ErrorState;
    correlation_id : ?Text;
  };

  public type Result<T> = {
    #ok : T;
    #err : Error;
  };
};
