module siw_sui::siw {
    use std::option;
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer::{public_transfer};
    use sui::tx_context;

    public struct SIW has drop {}
 
    #[allow(unused_const)]
    /// (100 Billion)
    const TOTAL_SUPPLY_SIW: u64 = 100_000_000_000;

    fun init(otw:SIW, ctx:&mut TxContext) {
        let sender = tx_context::sender(ctx);
        let (t, d, c) = coin::create_regulated_currency(
            otw,
            6,
            b"SIW",
            b"Siw Token",
            b"Based on sui blockchain, let us stay in this world",
            option::none(),
            ctx
        );

        public_transfer(t, sender);
        public_transfer(c, sender);
        public_transfer(d, sender);
    }

}
