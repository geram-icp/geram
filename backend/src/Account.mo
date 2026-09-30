module {

  public type AccountKind = {
    #Personal;
    #Organization;
    #Institution;
    #Custodial;
    #Settlement;
    #Other;
  };

  public type AccountStatus = {
    #Pending;
    #Active;
    #Suspended;
    #Closed;
    #Archived;
  };

  public type Account = {
    account_id : Text;
    identity_id : Text;
    kind : AccountKind;
    status : AccountStatus;
    created_at : Int;
    updated_at : Int;
    metadata_ref : ?Text;
  };

};
