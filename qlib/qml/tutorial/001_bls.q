args:.Q.def[`name`port!("001_bls.q";9073);].Q.opt .z.x

/ remove this line when using in production
/ 001_bls.q:localhost:9073::
{ if[not x=0; @[x;"\\\\";()]]; value"\\p 9073"; } @[hopen;`:localhost:9073;0];

system"l ",getenv[`btick2],"/qlib.q"
.import.require`rlang`qml

(::)tab:flip `type_`direct`spot`strike`rate`vola`matur!(`bls;`call;100;100;0.01;.qml.linspace[0f;0.25;100];1.0)
(::)tab:tab,(update spot:spot+10 from tab),(update spot:spot-10 from tab)
(::)tab:update premium:.qml.bls tab from tab 
(::)tab:update spot:`$string spot from tab 
(::)tab1:update num:2500,payoff:{max 0,x-100} from tab
\t tab1:update binbaum: .qml.binbaum each tab1 from tab1


/

r) library(patchwork)
r) library(gridExtra)
r) library(ggpubr)
(::)summary:{([]name:key x;val:value x)}first key select by type_,direct,strike,rate,matur from tab
r) first.step <- lapply(`summary, unlist) 
r) second.step <- as.data.frame(first.step, stringsAsFactors = F) 
r) g<-ggtexttable(second.step) 
u) ggplot(`tab,aes(vola,premium,color=spot)) + geom_point() + scale_x_continuous(labels = scales::percent)
u) gg+g


/

(::)t:([] spot:100;rate:0.01;vola:0.25;matur:1.0;num:2500;payoff:({x};{max 0,x-100};{max 0,100-x};{abs 100-x}))
update price: .qml.binbaum each t from t


(::)tab:flip `type_`direct`spot`strike`rate`vola`matur!(`bls`vega`delta`theta`vega`rho;`call;100;100;0.01;0.25;1.0)
.qml.bls tab 0

num:1000;
(::)tab2:flip `type_`direct`spot`strike`rate`price`matur!(`impl;num?`call`put;100;100;0.01;(03.00 + 0.005*til num);1.0)
update blsprice: .qml.bls res2 from res2:update type_:`bls, vola: .qml.bls tab2 from tab2


.qtx.summary[]

.qtx.module "lib=`math"
.qtx.main ["lib=`math"]()!()

.qtx.result[]
.qtx.fail "lib=`math"