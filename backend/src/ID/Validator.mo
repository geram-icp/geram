import Namespace "./Namespace";
import Types "./Types";
import Text "mo:base/Text";

module {

  // ============================================================
  // GERAM-P1-02.5.12
  // CANONICAL ID VALIDATOR CORE
  //
  // Structural validation only.
  // No domain mutation.
  // No persistence.
  // No collision lookup.
  // No main.mo integration.
  // No Candid change.
  // ============================================================

  public func validate(id : Types.CanonicalId) : {
    #ok : Types.IdParts;
    #err : Types.IdError;
  } {
    if (id == "") {
      return #err(#Empty);
    };

    let parts = Text.split(id, #char '-');

    let namespace = parts.next();
    let suffix = parts.next();
    let extra = parts.next();

    switch (namespace, suffix, extra) {
      case (?ns, ?sf, null) {
        if (ns == "" or sf == "") {
          #err(#InvalidFormat)
        } else {
          #ok({
            namespace = ns;
            suffix = sf;
          })
        };
      };

      case (_) {
        #err(#InvalidFormat)
      };
    };
  };

  public func validateExpected(
    id : Types.CanonicalId,
    expected : Namespace.Namespace
  ) : {
    #ok : Types.IdParts;
    #err : Types.IdError;
  } {
    switch (validate(id)) {
      case (#err(error)) {
        #err(error)
      };

      case (#ok(parts)) {
        if (parts.namespace != Namespace.prefix(expected)) {
          #err(#NamespaceMismatch)
        } else {
          #ok(parts)
        };
      };
    };
  };

};
