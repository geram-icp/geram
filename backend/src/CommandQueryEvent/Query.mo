module {

  public type Query = {
    request_id : Text;
    correlation_id : Text;
    query_type : Text;
    actor_ref : Text;
    parameters : Text;
    timestamp : Int;
  };

};
