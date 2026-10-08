module {

  public type WalletKind = {
    #Personal;
    #Organization;
    #Custodial;
    #Settlement;
    #Other;
  };

  public type WalletStatus = {
    #Pending;
    #Active;
    #Suspended;
    #Closed;
    #Archived;
  };

  public type Wallet = {
    wallet_id : Text;
    account_id : Text;
    kind : WalletKind;
    status : WalletStatus;
    created_at : Int;
    updated_at : Int;
    metadata_ref : ?Text;
  };

};
