module {

  public type Command = {
    command_id : Text;
    request_id : Text;
    correlation_id : Text;
    command_type : Text;
    actor_ref : Text;
    payload : Text;
    timestamp : Int;
    idempotency_key : Text;
  };

};
