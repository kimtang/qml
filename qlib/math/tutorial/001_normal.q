args:.Q.def[`name`port!("001_normal.q";8888);].Q.opt .z.x

/ remove this line when using in production
/ 001_normal.q:localhost:8888::
{ if[not x=0; @[x;"\\\\";()]]; value"\\p 8888"; } @[hopen;`:localhost:8888;0];

system"l ",getenv[`btick2],"/qlib.q"
.import.module`rlang`math

(::)t:flip enlist[`rnd]!enlist .math.distributions.normal1d.random.boxmueller[`] 1e7
(::)t:0!select cnt:count[i]%count t by rnd:0.01 xbar rnd from t


/ u) ggplot(`t,aes(rnd,cnt)) + geom_point() + ggtitle("Distribution Plot")
/ r) ggsave("plot/001.png")

d) txt
 TODO: Better it is to implement the shapiro-wilk test
 https://math.mit.edu/~rmd/465/shapiro.pdf
  / ![hello](plot/001.png){width="600", height="600"}