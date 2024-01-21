
d)lib qml.qml 
 Library for working with the os
 q).import.module`qml 
 q).import.module`qml.qml
 q).import.module"%qml%/qlib/qml/qml.q"

.import.require`math

.qml.summary:{} 

d)fnc qml.qml.summary 
 Give a summary of this function
 q) qml.summary[] 


.qml.bls0:()!(); 

.qml.bls0[`d]:{[x] d1:(log[x[`spot] % x[`strike]] + x[`matur]*x[`rate]+0.5*x[`vola] xexp 2) %x[`vola] * sqrt x[`matur];
	d2:d1-x[`vola] *sqrt x[`matur];
	sig:neg 1f-2f*`float$(x[`direct]=`call );
	(`d1`d2`sig)!(d1;d2;sig) };

.qml.bls0[`bls]:{[x] neg x[`sig]*(  x[`strike]*exp[neg x[`rate]*x[`matur]] *.math.distributions.normal1d.cdf[`] x[`sig]*x[`d2] )-x[`spot]*.math.distributions.normal1d.cdf[`] x[`sig]*x[`d1]};

.qml.bls0[`delta]:{[x] x[`sig]*.math.distributions.normal1d.cdf[`] x[`sig]*x[`d1] };
.qml.bls0[`theta]:{[x] nd2:x[`strike]*x[`rate]*.math.distributions.normal1d.cdf[`] x[`sig]*x[`d2];
	nd1:%[neg x[`vola]*x[`spot]*.math.distributions.normal1d.pdf[`] x[`d1];2f*sqrt x[`matur]];
	:nd1+x[`sig]*nd2*exp neg x[`matur]};
.qml.bls0[`gamma]:{[x] :.math.distributions.normal1d.pdf[`;x[`d1]] % x[`spot]*x[`vola]*sqrt x[`matur]   };

.qml.bls0[`vega]: {[x] :.math.distributions.normal1d.pdf[`;x[`d1]]*x[`spot]*sqrt x[`matur] };

.qml.bls0[`rho]:{[x] :x[`strike]*x[`matur]*exp[neg x[`rate] *x[`matur] ] *.math.distributions.normal1d.cdf[`] x[`sig]*x[`d2]  };

.qml.bls0[`98]:{[x] a:update num :til count x from x ; impl:select from a where type_=`impl; nimpl:select from a where not type_=`impl;
              t:$[0=count nimpl;nimpl;flip flip[nimpl],'.qml.bls0[`d]nimpl] ;
              g:$[0=count t;nimpl;t group t`type_];
              nimpl:$[0=count t;nimpl;raze key [g] {[x;y] p:.qml.bls0[x] y ; update p from y}' value g];
              impl:update p:.qml.bls each impl from impl;
              :exec p from `num xasc nimpl,impl
    };
/ dictionary
.qml.bls0[`99]:{[x] 
    :$[0<sum 0<type each value x;first .qml.bls enlist x;
	   $[`impl=x`type_; .qml.bls0[`impl] x; .qml.bls0[x`type_] x,.qml.bls0[`d] x ]]
    };

.qml.bls0[`impl]:{ [x] p:`type_ _ x;
    www:{[p;x] 1e-10< abs p[`price]-.qml.bls p,(`type_`vola)!(`bls;x)  } p ;
    /ww:{[x] abs p[`price]-.qml.bls p,(`type_`vola)!(`bls;x)};
    {[p;x] x+(p[`price]-.qml.bls p,(`type_`vola)!(`bls;x))  % .qml.bls p,(`type_`vola)!(`vega;x) }[p]/[www;0.65]
    };


.qml.bls:{ [x] :.qml.bls0[`$ string type x] x
    / xx:?[`impl =x`type_;{x};.ql_impl.bls[`dm] ][x] ;.ql_impl.bls[xx`type_]xx
    };

d)fnc qml.qml.bls 
 Give a summary of this function
 q) .qml.bls tab:flip `type_`direct`spot`strike`rate`vola`matur!(`bls`vega`delta`theta`vega`rho;`call;100;100;0.01;0.25;1.0)


.qml.binbaum0:()!();

.qml.binbaum0[99h]:{[x]
 s:x[`spot];r:x[`rate];v:x[`vola];t:x[`matur];n:x[`num];f:x[`payoff];
 dt:t % n;
 beta: avg exp dt*(0f;v*v)+(neg r;r);
 u:beta + sqrt neg 1-beta*beta;
 d:reciprocal u;
 p:(neg d-exp r*dt) % u-d;
 q:1-p;
 S: s */{[u;d;x](u xexp x;d xexp reverse x)}[u;d;til n] ;
 V:f S;
 exp[neg r*t]*{[p;q;x]if[1=count x;:first x];:(p*1_x )+ q*-1_x}[p;q] over V
 }

.qml.binbaum0[98h]:{
 s:x[`spot];r:x[`rate];v:x[`vola];t:x[`matur];n:max x[`num];f:x[`payoff];
 dt:t % n;
 beta:avg exp dt*/:(0f;v*v)+(neg r;r);
 u:beta + sqrt neg 1-beta*beta;
 d:reciprocal u;
 p:(neg d-exp r*dt) % u-d;
 q:1-p;
 S:s */{[u;d;x](u xexp\: x;d xexp\: reverse x)}[u;d;til n] ;
 V:f@'S;
 exp[neg r*t] *first@'{[p;q;x]if[1=count x 0;:x];:(p*1_/:x )+ q*-1_/:x}[p;q] over V
 }

.qml.binbaum0[0h]:{.qml.binbaum0[99h;`spot`rate`vola`matur`num`payoff!x til 6 ]};

.qml.binbaum:{[x] .qml.binbaum0[type x;x]}

d)fnc qml.qml.binbaum 
 Give a summary of this function
 q) update price: .qml.binbaum each t from t:([] spot:100;rate:0.01;vola:0.25;matur:1.0;num:2500;payoff:({x};{max 0,x-100};{max 0,100-x};{abs 100-x}))


.qml.linspace:{[start;end;num] start+til[num]*dt:(end - start) % -1+num:"j"$num}

d)fnc qml.qml.linspace 
 Give a spaced linearly array
 q) .qml.linspace[0f;10f;10]



.qml.ostyle:()!();
.qml.ostyle[`native]:{x};
.qml.ostyle[`wtime]:{[x] t: flip[x] 0; p:flip[x] 1;
                $[ 1 = count first[p] 0 ;(t; flip p) ;(t;flip each flip p)] };
.qml.ostyle[`opaths]:{[x] .qml.ostyle[`wtime;x] 1};

.qml.pathsde:()!();
.qml.pathsde[`euler]:{[x] 
    spot:x[`spot];drift:x[`drift];diffu:x[`diffu];matur:x[`matur];steps:x[`steps]-1;repl:x[`repl];
    h:matur % steps;
    delta:sqrt h;
    / get rid of the time vector
    :{ [drift;diffu;delta;repl;h;x] x + (h;(drift[x 0; x 1] * h) +diffu[x 0; x 1]*delta * .math.distributions.normal1d.random.boxmueller[`] repl) }[drift;diffu;delta;repl;h]\[steps;(0f;repl#spot)]
    };

/pathsde[`milstein]:{[x] 
/    spot:x[`spot];drift::x[`drift];diffu::x[`diffu];matur:x[`matur];steps:x[`steps]-1;repl::x[`repl];
/    h::matur % steps;
/    delta::sqrt h;
    / get rid of the time vector
/    {[x] diffu[x 0; x 1] * delta * .ql.randn repl }\[steps;(of;repl#spot)]
/    flip first 1_flip { [x] x + (h;(drift[x 0; x 1] * h) +diffu[x 0; x 1]*delta * .ql.randn repl) }\[steps;(0f;repl#spot)]
/    };

.qml.pathsde[`runge]:{[x] 
    spot:x[`spot];drift:x[`drift];diffu:x[`diffu];matur:x[`matur];steps:x[`steps]-1;repl:x[`repl];
    h:matur % steps;
    delta:sqrt h;
    / get rid of the time vector
    :{ [drift;diffu;delta;repl;h;x]
        deltaw:delta * .math.distributions.normal1d.random.boxmueller[`] repl;
        yhat:x[1]+ (drift[x 0; x 1] * h )+diffu[x 0; x 1]*delta;
        x + (h;(drift[x 0; x 1] * h )+ (diffu[x 0; x 1]*deltaw) + reciprocal[2f*delta] * ( diffu[x 0;yhat]-diffu[x 0; x 1] ) * neg[h - deltaw*deltaw])
        }[drift;diffu;delta;repl;h]\[steps;(0f;repl#spot)]
    };

/ paths:{ [x] spot::x[`spot];r:x[`rate];v:x[`vola];t:x[`matur];st:x[`steps];repl:x[`repl];
/    dt:t % st;
/    nudt: dt* r- 0.5* v xexp 2;
/    sidt: v * sqrt dt;
/    inc:nudt+sidt*.ql.randn (repl;st);
/    logp: sums each {log[spot],x} each inc;
/    : exp each logp
/    };

/ here we will implement the multidimensional sde
.qml.pathmde:()!();
.qml.pathmde[`euler]:{[x] 
    spot:x[`spot];drift:x[`drift];diffu:x[`diffu];matur:x[`matur];steps:x[`steps]-1;repl:x[`repl];
    d:count spot;h:matur % steps;delta:sqrt h;    
    :
    {[spot;drift;diffu;repl;d;h;delta;x] 
        current:x 1;t:x 0;wnt:delta*(repl,d) # .math.distributions.normal1d.random.boxmueller[`] d*repl;
        x+(h;current{[drift;diffu;t;h;x;y] (drift[t;x]*h) +diffu[t;x] wsum\: y }[drift;diffu;t;h]'wnt)
    }[spot;drift;diffu;repl;d;h;delta]\[steps;(0f;repl#enlist spot)]
    };

.qml.pathmde[`neuler]:{[x] 
    spot::x[`spot];drift::x[`drift];diffu::x[`diffu];matur:x[`matur];steps:x[`steps]-1;repl::x[`repl];
    d::count spot;h::matur % steps;delta::sqrt h; wnt: delta*flip steps cut d cut .math.distributions.normal1d.random.boxmueller[`] d*repl*steps;
    str:(0f;repl#enlist spot);
    :enlist[str],{[x;y] cur:x 1;t::x 0;x+(h;(drift[t;cur]*h) +diffu[t;cur;y])}\[str;wnt]
 };

.qml.paths:{[x] 
    res:$[1=count x`spot;.qml.pathsde[x`type_] x;.qml.pathmde[x`type_] x];
    style:$[` = x`output;`opaths;x`output];
    :.qml.ostyle[style] res};    

d)fnc qml.qml.paths 
 Simulate sde
 q) .qml.paths    