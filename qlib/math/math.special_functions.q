
.math.special_functions.erf.fnc:{[x] signum[x]* 1 - t* exp (neg x*x) +  -1.26551223 + 1.00002368 0.37409196 0.09678418 -0.18628806 0.27886807 -1.13520398 1.48851587 -0.82215223 0.17087277 wsum (*) scan 9#enlist t:reciprocal 1+ .math.constants.half*abs x}

d).math.special_functions.erf.fnc
 Error function https://en.wikipedia.org/wiki/Error_function
 q) 1.0e-6 > sum abs -0.022564575 0 0.022564575 - .math.special_functions.erf.fnc x:-0.02 0.0 0.02


.math.special_functions.erf.dt:{[x] (2 * exp neg x*x) % .math.constants.root_pi}

d).math.special_functions.erf.dt
 Error function https://en.wikipedia.org/wiki/Error_function
 q) .math.special_functions.erf.dt x:-0.1 0.0 0.1