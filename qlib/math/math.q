
d)lib qml.math 
 Library for working with the lib math
 q).import.module`math 
 q).import.module`qml.math
 q).import.module"%qml%/qlib/math/math.q"

.import.require"%qml%/qlib/math/math.constants.q";
.import.require"%qml%/qlib/math/math.special_functions.q";
.import.require"%qml%/qlib/math/math.linalg.q";
.import.require"%qml%/qlib/math/math.distributions.q";

.math.summary:{ .doc.summary`math} 

d)fnc qml.math.summary 
 Give a summary of this function
 q) math.summary[] 

.math.linspace:{[arg;start;stop]
 if[not 99h=type arg;arg:()!()];
 arg:(`num`endpoint`retstep!(50j;1b;0b)),arg;
 d:(stop - start) % num: arg[`num] - 0 1 arg`endpoint;
 if[not -7h = type num;num:`long$num];
 res:start+d*til num - 0 -1 arg`endpoint;
 if[not arg`retstep;:res];
 update step: deltas samples from ([]samples:res)
 }

