args:.Q.def[`name`port!("qexcel.q";9081);].Q.opt .z.x

/ remove this line when using in production
/ qexcel.q:localhost:9081::
{ if[not x=0; @[x;"\\\\";()]]; value"\\p 9081"; } @[hopen;`:localhost:9081;0];

system"l ",getenv[`btick2],"/qlib.q"
.import.require`math`qml

/ t:flip enlist[`rnd]!enlist .math.distributions.normal1d.random.boxmueller[`] 1e7
/ t:0!select cnt:count[i]%count t by rnd:0.01 xbar rnd from t


.qml.bls x:`spot`type_`direct`strike`rate`vola`matur!(95 95f;`bls`bls;`call`call;100 100f;0 0f;0.2 0.2f;1 1f)
.kmp1
type .kmp1
type .kmp3

{.kmp4: x;x} .kmp1

.qml.bls:{[x] .qml.bls0[`$ string type x] x}

.qml.bls0 `98

{[x]
    :$[not 0<sum 0<type each value x;first .qml.bls enlist x;
    $[`impl=x`type_; .qml.bls0[`impl] x; .qml.bls0[x`type_] x,.qml.bls0[`d] x ]]
    }