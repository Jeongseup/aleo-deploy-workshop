// The 'aleo_public_token' program.
program aleo_public_token2.aleo {
    // On-chain storage of an `account` map, with `address` as the key,
    // and `u64` as the value.
    mapping account: address => u64;

    record token {
        // The token owner.
        owner: address,
        // The token amount.
        amount: u64,
    }

    /* Mint */
    // The function `mint_public` issues the specified token amount for the token receiver publicly on the network.
    transition mint_public(public receiver: address, public amount: u64) {
        // Mint the tokens publicly by invoking the computation on-chain.
        return then finalize(receiver, amount);
    }

    finalize mint_public(public receiver: address, public amount: u64) {
        // Increments `account[receiver]` by `amount`.
        // If `account[receiver]` does not exist, it will be created.
        // If `account[receiver] + amount` overflows, `mint_public` is reverted.
        let receiver_amount: u64 = Mapping::get_or_use(account, receiver, 0u64);
        Mapping::set(account, receiver, receiver_amount + amount);
    }

    /* Transfer */
    transition transfer_public(public receiver: address, public amount: u64) {
        // Transfer the tokens publicly, by invoking the computation on-chain.
        return then finalize(self.caller, receiver, amount);
    }

    finalize transfer_public(public sender: address, public receiver: address, public amount: u64) {
        // Decrements `account[sender]` by `amount`.
        // If `account[sender]` does not exist, it will be created.
        // If `account[sender] - amount` underflows, `transfer_public` is reverted.
        let sender_amount: u64 = Mapping::get_or_use(account, sender, 0u64);
        Mapping::set(account, sender, sender_amount - amount);
        
        // Increments `account[receiver]` by `amount`.
        // If `account[receiver]` does not exist, it will be created.
        // If `account[receiver] + amount` overflows, `transfer_public` is reverted.
        let receiver_amount: u64 = Mapping::get_or_use(account, receiver, 0u64);
        Mapping::set(account, receiver, receiver_amount + amount);
    }
}
