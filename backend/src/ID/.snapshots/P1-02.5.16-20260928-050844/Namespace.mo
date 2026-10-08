module {

  // ============================================================
  // GERAM-P1-02 ? CANONICAL ID NAMESPACES
  // Contract only. No domain mutation.
  // ============================================================

  public type Namespace = {
    #Identity;
    #Account;
    #Wallet;
    #Principal;
    #Project;
    #Asset;
    #Geram;
    #Verification;
    #Certificate;
    #NFT;
    #Fund;
    #Position;
    #Transaction;
    #Request;
    #Correlation;
    #Event;
    #Audit;
  };

  public func prefix(namespace : Namespace) : Text {
    switch (namespace) {
      case (#Identity) { "IDN" };
      case (#Account) { "ACC" };
      case (#Wallet) { "WLT" };
      case (#Principal) { "PRN" };
      case (#Project) { "PRJ" };
      case (#Asset) { "AST" };
      case (#Geram) { "GER" };
      case (#Verification) { "VER" };
      case (#Certificate) { "CER" };
      case (#NFT) { "NFT" };
      case (#Fund) { "FUN" };
      case (#Position) { "POS" };
      case (#Transaction) { "TXN" };
      case (#Request) { "REQ" };
      case (#Correlation) { "COR" };
      case (#Event) { "EVT" };
      case (#Audit) { "AUD" };
    };
  };

};
