import Generator "./Generator";
import Namespace "./Namespace";
import Types "./Types";

module {

  public func projectId(suffix : Text) : Types.CanonicalId {
    Generator.make(#Project, suffix)
  };

  public func assetId(suffix : Text) : Types.CanonicalId {
    Generator.make(#Asset, suffix)
  };

  public func geramId(suffix : Text) : Types.CanonicalId {
    Generator.make(#Geram, suffix)
  };

  public func verificationId(suffix : Text) : Types.CanonicalId {
    Generator.make(#Verification, suffix)
  };

  public func certificateId(suffix : Text) : Types.CanonicalId {
    Generator.make(#Certificate, suffix)
  };

  public func fundId(suffix : Text) : Types.CanonicalId {
    Generator.make(#Fund, suffix)
  };

  public func positionId(suffix : Text) : Types.CanonicalId {
    Generator.make(#Position, suffix)
  };

  public func transactionId(suffix : Text) : Types.CanonicalId {
    Generator.make(#Transaction, suffix)
  };
};
