program aleo_public_token2.aleo;

record token:
    owner as address.private;
    amount as u64.private;


mapping account:
	key left as address.public;
	value right as u64.public;

function mint_public:
    input r0 as address.public;
    input r1 as u64.public;

    finalize r0 r1;

finalize mint_public:
    input r0 as address.public;
    input r1 as u64.public;
    get.or_use account[r0] 0u64 into r2;
    add r2 r1 into r3;
    set r3 into account[r0];


function transfer_public:
    input r0 as address.public;
    input r1 as u64.public;

    finalize self.caller r0 r1;

finalize transfer_public:
    input r0 as address.public;
    input r1 as address.public;
    input r2 as u64.public;
    get.or_use account[r0] 0u64 into r3;
    sub r3 r2 into r4;
    set r4 into account[r0];
    get.or_use account[r1] 0u64 into r5;
    add r5 r2 into r6;
    set r6 into account[r1];
