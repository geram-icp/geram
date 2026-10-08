import ClassPlus "mo:class-plus";
import ICRC7 "../src";
import Principal "mo:base/Principal";
import ICRC7Mixin "../src/mixin";

shared ({ caller = _owner }) persistent actor class Token() = this {

    transient let canisterId = Principal.fromActor(this);
    transient let org_icdevs_class_plus_manager = ClassPlus.ClassPlusInitializationManager<system>(_owner, canisterId, true);
    
    include ICRC7Mixin({
      ICRC7.defaultMixinArgs(org_icdevs_class_plus_manager) with
      args = null;
      pullEnvironment = null;
      onInitialize = null;
    });

};
