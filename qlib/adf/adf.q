d)lib qml.adf 
 Library for working with the lib adf
 q).import.module`adf 
 q).import.module`qml.adf
 q).import.module "%qml%/qlib/adf/adf.q"

.import.require`proto;

.adf.summary:{} 

d)fnc adf.adf.summary 
 Give a summary of this function
 q) .adf.summary[] 

.adf.forward0.o:.proto.odefine[`Plus;{[x;y](x[0]+y[0];x[1]+y[1])}]
  .proto.odefine[`Hyphen;{[x;y](x[0]-y[0];x[1]-y[1])}]
  .proto.odefine[`Multiply;{[x;y]enlist[x[0]*y[0];] (x[0]*y[1])+x[1]*y[0]}]
  .proto.odefine[`Log;{[x]enlist[log x[0];]x[1] % x[0] }]
  .proto.odefine[`Sin;{[x]enlist[sin x[0];] x[1]*cos x[0] }]
  .proto.odefine[`Cos;{[x]enlist[cos x[0];] x[1]*neg sin x[0]}]    
  .proto.odefine[`Procenttecken;{[x;y] enlist[x[0]%y[0];] ((x[1]*y[0]) - x[0]*y[1]) % y[0]*y[0] }]
  .proto.odefine[`Exp;{[x] enlist[exp x[0];] x[1]*exp x[0] }]
  .proto.odefine[`Xexp;{[x;y] enlist[x[0] xexp y[0];] x[1]* y[0] * x[0] xexp -1+y[0] }]
  .proto.nil  

.adf.forward0.a:.proto.nil

.adf.forward:.proto.proto[.adf.forward0.a;.adf.forward0.o]  