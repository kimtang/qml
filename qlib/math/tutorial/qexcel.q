args:.Q.def[`name`port!("qexcel.q";9081);].Q.opt .z.x

/ remove this line when using in production
/ 001_normal.q:localhost:9081::
{ if[not x=0; @[x;"\\\\";()]]; value"\\p 9081"; } @[hopen;`:localhost:9081;0];

system"l ",getenv[`btick2],"/qlib.q"
.import.require`math`qml

/ t:flip enlist[`rnd]!enlist .math.distributions.normal1d.random.boxmueller[`] 1e7
/ t:0!select cnt:count[i]%count t by rnd:0.01 xbar rnd from t