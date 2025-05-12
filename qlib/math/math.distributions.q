
.math.distributions.normal1d.pdf:{[arg;x]if[99h<>type arg;arg:()!()];arg:(`mean`std!0 1f),arg;  exp[  neg .math.constants.half * x*x:(x- arg`mean) % std] % .math.constants.root_two_pi * std:arg`std  }

d) fnc qml.math.distributions.normal1d.pdf
 Normal function https://en.wikipedia.org/wiki/Normal_distribution
 q) .math.distributions.normal1d.pdf[`] x:-0.1 0.0 0.1

.math.distributions.normal1d.cdf:{[arg;x]
  if[99h<>type arg;arg:()!()];arg:(`mean`std!0 1f),arg;
  .math.constants.half * 1 + .math.special_functions.erf.fnc (x - arg`mean) % .math.constants.root_two * arg`std
 }

d) fnc qml.math.distributions.normal1d.cdf
 Normal function https://en.wikipedia.org/wiki/Normal_distribution
 q) .math.distributions.normal1d.cdf[`mean`std!0 1f] -0.1 0.0 0.1


.math.distributions.normal1d.random.boxmueller:{[arg;n]
 if[-7h<>type n;n:"j"$n];
 if[99h<>type arg;arg:()!()];arg:(`mean`std!0 1f),arg;
 x:n#raze (sqrt -2*log last x)*/: (sin;cos)@\: 2*.math.constants.pi*first x:n0 cut (2*n0:ceiling .math.constants.half * n)?1.0;
 arg[`mean] + x*arg`std
 }

d) fnc qml.math.distributions.normal1d.random.boxmueller
 Normal function https://en.wikipedia.org/wiki/Normal_distribution
 q) .math.distributions.normal1d.random.boxmueller[`mean`std!0 1f] 10000

.math.distributions.normalmd.random:{[arg;n] if[-7<>type n;n:"j"$n];
 if[99h<>type arg;arg:()!()];arg:(`mean`std!(0 0f;2 cut 1 .5 .5 1)),arg;
 mean + arg[`std] mmu rnd:n cut .math.distributions.normal1d.random.boxmueller[`] n*cnt:count mean:arg`mean
 }

d) fnc qml.math.distributions.normalmd.random
 Normal function https://en.wikipedia.org/wiki/Normal_distribution
 q) .math.distributions.normalmd.random[arg:`mean`std!(0 0f;2 cut 1 .5 .5 1)] n:10000


.math.distributions.bernoulli.random:{[arg;n]
 if[-7h<>type n;n:"j"$n];
 if[-7h=type arg;arg:"f"$arg]; 
 if[-9h=type arg;
   $[arg within 0 1f;arg:(1#`success_fraction)!1#arg;arg:(1#`success_fraction)!1# reciprocal abs arg];
  ];
 if[99h<>type arg;arg:()!()];arg:((1#`success_fraction)!1#0.5),arg;
 (n?1.0)<= arg`success_fraction
 }

.math.distributions.binomial.random:{[arg;n]
 if[-7h<>type n;n:"j"$n];
 if[99h<>type arg;arg:()!()];arg:(`success_fraction`trial!0.3,10),arg; 
 N:arg[`trial]*n;
 if[-7h<>type N;N:"j"$N]; 
 sum n cut (N?1.0)<= arg`success_fraction
 }

.math.distributions.geometric.random:{[arg;n]
 if[-7h<>type n;n:"j"$n];
 if[-7h=type arg;arg:"f"$arg]; 
 if[-9h=type arg;arg:(1#`success_fraction)!1#arg;];
 if[99h<>type arg;arg:()!()];arg:((1#`success_fraction)!1#0.3),arg; 
 k:3*"j"$(log 1 - 0.995 ) % log 1 - arg`success_fraction; 
 r:n cut not .math.distributions.bernoulli.random[arg] k*n; 
 r:sum prds r;
 c:count w:where r=k;
 if[c=0;:r];
 d:.math.distributions.geometric.random[arg;c];
 @[r;w;+;d]
 }

