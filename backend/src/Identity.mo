module {

  public type IdentityKind = {
    #Individual;
    #Organization;
    #Institution;
    #Other;
  };

  public type IdentityStatus = {
    #Pending;
    #Active;
    #Suspended;
    #Archived;
  };

  public type Identity = {
    identity_id : Text;
    kind : IdentityKind;
    status : IdentityStatus;
    created_at : Int;
    updated_at : Int;
    metadata_ref : ?Text;
  };

};
