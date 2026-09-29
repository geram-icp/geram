module {

  public type Event = {
    event_id : Text;
    event_type : Text;
    correlation_id : Text;
    causation_id : ?Text;
    aggregate_type : Text;
    aggregate_id : Text;
    timestamp : Int;
    version : Nat;
    payload : Text;
  };

};
