import ClassPlus "mo:class-plus";
import ICRC7 "mo:icrc7-mo";
import Principal "mo:base/Principal";
import Text "mo:base/Text";
import Nat "mo:base/Nat";

import ICRC7Mixin "mo:icrc7-mo/mixin";

shared ({ caller = _owner }) persistent actor class GERAM() = this {

  transient let canisterId = Principal.fromActor(this);

  transient let org_icdevs_class_plus_manager =
    ClassPlus.ClassPlusInitializationManager<system>(
      _owner,
      canisterId,
      true
    );

  include ICRC7Mixin({
    ICRC7.defaultMixinArgs(org_icdevs_class_plus_manager) with
    args = null;
    pullEnvironment = null;
    onInitialize = null;
  });

};
