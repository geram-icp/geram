import Namespace "./Namespace";
import Types "./Types";

module {

  // ============================================================
  // GERAM-P1-02.5.10
  // CANONICAL ID GENERATOR CORE
  //
  // Design principles:
  // - No domain mutation
  // - No main.mo integration
  // - No Candid change
  // - No external dependency
  // - Namespace remains explicit
  // ============================================================

  public func make(namespace : Namespace.Namespace, suffix : Text) : Types.CanonicalId {
    Namespace.prefix(namespace) # "-" # suffix
  };

};
