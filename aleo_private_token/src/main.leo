
program aleo_private_token.aleo {
    // Define a token struct with an owner and balance
    record Token {
        owner: address,
        balance: u32,
    }

    // Define a mint transition that takes a balance and returns a token
    transition mint(balance: u32) -> Token {
        return Token {
            owner: self.caller,
            balance: balance,
        };
    }

    // Define a transfer transition that takes a receiver, amount and token and returns two tokens
    transition transfer(receiver: address, amount: u32, input: Token) -> (Token, Token) {
        let balance: u32 = input.balance - amount;
        let recipient: Token = Token {
            owner: receiver,
            balance: amount,
        };

        let sender: Token  = Token {
            owner: self.caller,
            balance
        };

        return (recipient, sender);
    }
}