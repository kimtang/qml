args:.Q.def[`name`port!("002_mc.q";9073);].Q.opt .z.x

/ remove this line when using in production
/ 002_mc.q:localhost:9073::
{ if[not x=0; @[x;"\\\\";()]]; value"\\p 9073"; } @[hopen;`:localhost:9073;0];

system"l ",getenv[`btick2],"/qlib.q"
.import.require`repository`qtx`qml
.import.module`qml

(::)paths:.qml.paths x:`type_`output`spot`drift`diffu`matur`steps`repl!(`euler;`wtime;100f;{[t;s] 0.01 *s };{[t;s] 0.25 * s};1.0;4;1000000)
(::)time:paths 0
(::)paths:paths 1
exp[-0.01] * avg {[x] max enlist[0;x - 100] } paths[;-1+count time]
.qml.bls`type_`direct`spot`strike`rate`vola`matur!(`bls;`call;100;100;0.01;0.25;1.0)


