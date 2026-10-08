import Types "./migrations/types";
import Service "./service";
import ICRC7 ".";
import ClassPlusLib "mo:class-plus";
import Interface "./Interface";
import Inspect "./Inspect";

mixin(
  config: ICRC7.MixinFunctionArgs
) {

    transient let icrc7 = ICRC7.Init({
      manager = config.org_icdevs_class_plus_manager;
      initialState = switch(config.initialState){
         case(?s) s;
         case(null) ICRC7.initialState();
      };
      args = config.args;
      pullEnvironment = config.pullEnvironment;
      onInitialize = config.onInitialize;
      onStorageChange = switch(config.onStorageChange){
         case(?f) f;
         case(null) func(s: ICRC7.State){};
      };
    });

    transient let org_icdevs_icrc7_interface = Interface.defaultInterface();

    public shared query ({caller}) func icrc7_name() : async Text {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), Text>(
            ctx,
            org_icdevs_icrc7_interface.beforeName,
            func (_ctx) = icrc7().name(),
            org_icdevs_icrc7_interface.afterName
        );
    };

    public shared query ({caller}) func icrc7_symbol() : async Text {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), Text>(
            ctx,
            org_icdevs_icrc7_interface.beforeSymbol,
            func (_ctx) = icrc7().symbol(),
            org_icdevs_icrc7_interface.afterSymbol
        );
    };

    public shared query ({caller}) func icrc7_description() : async ?Text {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), ?Text>(
            ctx,
            org_icdevs_icrc7_interface.beforeDescription,
            func (_ctx) = icrc7().description(),
            org_icdevs_icrc7_interface.afterDescription
        );
    };
    
    public shared query ({caller}) func icrc7_logo() : async ?Text {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), ?Text>(
            ctx,
            org_icdevs_icrc7_interface.beforeLogo,
            func (_ctx) = icrc7().logo(),
            org_icdevs_icrc7_interface.afterLogo
        );
    };

    public shared query ({caller}) func icrc7_total_supply() : async Nat {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), Nat>(
            ctx,
            org_icdevs_icrc7_interface.beforeTotalSupply,
            func (_ctx) = icrc7().total_supply(),
            org_icdevs_icrc7_interface.afterTotalSupply
        );
    };
    
    public shared query ({caller}) func icrc7_supply_cap() : async ?Nat {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), ?Nat>(
            ctx,
            org_icdevs_icrc7_interface.beforeSupplyCap,
            func (_ctx) = icrc7().supply_cap(),
            org_icdevs_icrc7_interface.afterSupplyCap
        );
    };

    public shared query ({caller}) func icrc7_max_query_batch_size() : async ?Nat {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), ?Nat>(
            ctx,
            org_icdevs_icrc7_interface.beforeMaxQueryBatchSize,
            func (_ctx) = icrc7().max_query_batch_size(),
            org_icdevs_icrc7_interface.afterMaxQueryBatchSize
        );
    };
    
    public shared query ({caller}) func icrc7_max_update_batch_size() : async ?Nat {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), ?Nat>(
            ctx,
            org_icdevs_icrc7_interface.beforeMaxUpdateBatchSize,
            func (_ctx) = icrc7().max_update_batch_size(),
            org_icdevs_icrc7_interface.afterMaxUpdateBatchSize
        );
    };

    public shared query ({caller}) func icrc7_default_take_value() : async ?Nat {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), ?Nat>(
            ctx,
            org_icdevs_icrc7_interface.beforeDefaultTakeValue,
            func (_ctx) = icrc7().default_take_value(),
            org_icdevs_icrc7_interface.afterDefaultTakeValue
        );
    };

    public shared query ({caller}) func icrc7_max_take_value() : async ?Nat {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), ?Nat>(
            ctx,
            org_icdevs_icrc7_interface.beforeMaxTakeValue,
            func (_ctx) = icrc7().max_take_value(),
            org_icdevs_icrc7_interface.afterMaxTakeValue
        );
    };

    public shared query ({caller}) func icrc7_max_memo_size() : async ?Nat {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), ?Nat>(
            ctx,
            org_icdevs_icrc7_interface.beforeMaxMemoSize,
            func (_ctx) = icrc7().max_memo_size(),
            org_icdevs_icrc7_interface.afterMaxMemoSize
        );
    };
    
    public shared query ({caller}) func icrc7_atomic_batch_transfers() : async ?Bool {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), ?Bool>(
            ctx,
            org_icdevs_icrc7_interface.beforeAtomicBatchTransfers,
            func (_ctx) = icrc7().atomic_batch_transfers(),
            org_icdevs_icrc7_interface.afterAtomicBatchTransfers
        );
    };
    
    public shared query ({caller}) func icrc7_tx_window() : async ?Nat {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), ?Nat>(
            ctx,
            org_icdevs_icrc7_interface.beforeTxWindow,
            func (_ctx) = icrc7().tx_window(),
            org_icdevs_icrc7_interface.afterTxWindow
        );
    };
    
    public shared query ({caller}) func icrc7_permitted_drift() : async ?Nat {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), ?Nat>(
            ctx,
            org_icdevs_icrc7_interface.beforePermittedDrift,
            func (_ctx) = icrc7().permitted_drift(),
            org_icdevs_icrc7_interface.afterPermittedDrift
        );
    };

    public shared query ({caller}) func icrc7_collection_metadata() : async Service.CollectionMetadataResponse {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), Service.CollectionMetadataResponse>(
            ctx,
            org_icdevs_icrc7_interface.beforeCollectionMetadata,
            func (_ctx) = icrc7().collection_metadata(),
            org_icdevs_icrc7_interface.afterCollectionMetadata
        );
    };

    public shared query ({caller}) func icrc7_token_metadata(args: Service.TokenMetadataRequest) : async Service.TokenMetadataResponse {
        Inspect.guardTokenMetadata(args, null);
        let ctx : Interface.QueryContext<Service.TokenMetadataRequest> = { args = args };
        Interface.executeQuery<Service.TokenMetadataRequest, Service.TokenMetadataResponse>(
            ctx,
            org_icdevs_icrc7_interface.beforeTokenMetadata,
            func (_ctx) = icrc7().token_metadata(_ctx.args),
            org_icdevs_icrc7_interface.afterTokenMetadata
        );
    };

    public shared query ({caller}) func icrc7_owner_of(args: Service.OwnerOfRequest) : async Service.OwnerOfResponse {
        Inspect.guardOwnerOf(args, null);
        let ctx : Interface.QueryContext<Service.OwnerOfRequest> = { args = args };
        Interface.executeQuery<Service.OwnerOfRequest, Service.OwnerOfResponse>(
            ctx,
            org_icdevs_icrc7_interface.beforeOwnerOf,
            func (_ctx) = icrc7().owner_of(_ctx.args),
            org_icdevs_icrc7_interface.afterOwnerOf
        );
    };

    public shared query ({caller}) func icrc7_balance_of(args: Service.BalanceOfRequest) : async Service.BalanceOfResponse {
        Inspect.guardBalanceOf(args, null);
        let ctx : Interface.QueryContext<Service.BalanceOfRequest> = { args = args };
        Interface.executeQuery<Service.BalanceOfRequest, Service.BalanceOfResponse>(
            ctx,
            org_icdevs_icrc7_interface.beforeBalanceOf,
            func (_ctx) = icrc7().balance_of(_ctx.args),
            org_icdevs_icrc7_interface.afterBalanceOf
        );
    };

    public shared query ({caller}) func icrc7_tokens(prev: ?Nat, take: ?Nat) : async [Nat] {
        let ctx : Interface.QueryContext<(?Nat, ?Nat)> = { args = (prev, take) };
        Interface.executeQuery<(?Nat, ?Nat), [Nat]>(
            ctx,
            org_icdevs_icrc7_interface.beforeTokens,
            func (_ctx) = icrc7().tokens(_ctx.args.0, _ctx.args.1),
            org_icdevs_icrc7_interface.afterTokens
        );
    };
    
    public shared query ({caller}) func icrc7_tokens_of(account: Service.Account, prev: ?Nat, take: ?Nat) : async [Nat] {
        let ctx : Interface.QueryContext<(Service.Account, ?Nat, ?Nat)> = { args = (account, prev, take) };
        Interface.executeQuery<(Service.Account, ?Nat, ?Nat), [Nat]>(
            ctx,
            org_icdevs_icrc7_interface.beforeTokensOf,
            func (_ctx) = icrc7().tokens_of(_ctx.args.0, _ctx.args.1, _ctx.args.2),
            org_icdevs_icrc7_interface.afterTokensOf
        );
    };

    public shared ({caller}) func icrc7_transfer(args: [Service.TransferArg]) : async [?Service.TransferResult] {
        Inspect.guardTransfer(args, null);
        let ctx : Interface.TransferContext = { caller = caller; args = args };
        await* Interface.executeTransfer(
            ctx,
            org_icdevs_icrc7_interface.beforeTransfer,
            func (_ctx : Interface.TransferContext) : async* [?Service.TransferResult] { icrc7().transfer<system>(_ctx.caller, _ctx.args) },


            org_icdevs_icrc7_interface.afterTransfer
        );
    };

    public shared query ({caller}) func icrc7_supported_standards() : async Service.SupportedStandardsResponse {
        let ctx : Interface.QueryContext<()> = { args = () };
        Interface.executeQuery<(), Service.SupportedStandardsResponse>(
            ctx,
            org_icdevs_icrc7_interface.beforeSupportedStandards,
            func (_ctx) = icrc7().supported_standards(),
            org_icdevs_icrc7_interface.afterSupportedStandards
        );
    };

    public shared query({caller}) func get_icrc85_stats() : async {
        activeActions: Nat;
        lastActionReported: ?Nat;
        nextCycleActionId: ?Nat;
    } {
        icrc7().get_icrc85_stats();
    };
};
