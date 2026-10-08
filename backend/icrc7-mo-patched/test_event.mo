});

testsys<system>("Event Listeners work correctly", func<system>() {
    let user1 = get_actor_principal(1);
    let user2 = get_actor_principal(2);

    var transferNotified = false;
    var mintNotified = false;

    let myClass = getICRC7Class(null);

    // Register listeners
    myClass.register_token_transferred_listener("test_transfer", func<system>(notification, trxid) {
        transferNotified := true;
    });

    myClass.register_token_mint_listener("test_mint", func<system>(notification, trxid) {
        mintNotified := true;
    });

    let tokenID : Nat = 1000;
    
    let result = myClass.set_nfts([
        {
            token_id = tokenID;
            owner = ?{ owner = user1; subaccount = null };
            metadata = [("test", #Text("mint"))];
            memo = null;
            override = true;
            created_at_time = null;
        }
    ]);

    assert(mintNotified == true);

    let _transferResult = myClass.transfer_tokens<system>(user1, [
        {
            from_subaccount = null;
            to = { owner = user2; subaccount = null };
            token_id = tokenID;
            memo = null;
            created_at_time = null;
        }
    ]);

    assert(transferNotified == true);
});
