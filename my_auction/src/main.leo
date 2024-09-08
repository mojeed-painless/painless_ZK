program my_auction.aleo {

    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool,
    }

    
    transition place_bid(bidder: address, amount: u64) -> Bid {
       
        assert_eq(self.caller, bidder);
       
        return Bid {
            owner: aleo1ctxdtpedfjzl55qnmcj5drcmfly9qwrvyq36jl7jrx7hf89h9vgsadztvg,
            bidder: bidder,
            amount: amount,
            is_winner: false,
        };
    }

    
    transition resolve(first: Bid, second: Bid) -> Bid {
        
        assert_eq(self.caller, aleo1ctxdtpedfjzl55qnmcj5drcmfly9qwrvyq36jl7jrx7hf89h9vgsadztvg);
        
        if (first.amount >= second.amount) {
            return first;
        } else {
            return second;
        }
    }

    
    transition finish(bid: Bid) -> Bid {
        
        assert_eq(self.caller, aleo1ctxdtpedfjzl55qnmcj5drcmfly9qwrvyq36jl7jrx7hf89h9vgsadztvg);
       
        return Bid {
            owner: bid.bidder,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: true,
        };
    }
}

