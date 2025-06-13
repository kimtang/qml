d)lib %qml%/qlib/adf/adf.q
 Library for working with the lib adf
 q).import.module`adf 
 q).import.module`qml.adf
 q).import.module "%qml%/qlib/adf/adf.q"

.import.require`proto;

.adf.summary:{} 

d).adf.summary 
 Give a summary of this function
 q) .adf.summary[] 

.adf.forward0.o:
  .proto.odefine[`Plus;{[x;y](x[0]+y[0];x[1]+y[1])}]
  .proto.odefine[`Hyphen;{[x;y](x[0]-y[0];x[1]-y[1])}]
  .proto.odefine[`Multiply;{[x;y]enlist[x[0]*y[0];] (x[0]*y[1])+x[1]*y[0]}]
  .proto.odefine[`Log;{[x]enlist[log x[0];]x[1] % x[0] }]
  .proto.odefine[`Sin;{[x]enlist[sin x[0];] x[1]*cos x[0] }]
  .proto.odefine[`Cos;{[x]enlist[cos x[0];] x[1]*neg sin x[0]}]
  .proto.odefine[`Procenttecken;{[x;y] enlist[x[0]%y[0];] ((x[1]*y[0]) - x[0]*y[1]) % y[0]*y[0] }]
  .proto.odefine[`Exp;{[x] enlist[exp x[0];] x[1]*exp x[0] }]
  .proto.odefine[`Xexp;{[x;y] enlist[x[0] xexp y[0];] x[1] *y[0]* x[0] xexp -1+y[0] }]
  .proto.odefine[`Sqrt;{[x] enlist[sqrt x[0];] x[1] % 2f * sqrt x[0] }]  
  .proto.odefine[`.adf.const2;{[x] enlist[2;]0f}]
  .proto.odefine[`.adf.const3;{[x] enlist[3;]0f}]    
  .proto.nil  

.adf.const2:{2}
.adf.const3:{3}

.adf.forward0.a:{[x;y] y x } over enlist[ .proto.nil], .proto.adefine[;{enlist,(x;0f)}]@' `float`long`int`real

.adf.carg:{[arg] arg{(x;count[x]#\:enlist y)}'{x }@'"f"$til[narg]=/:til narg:count arg}
/ .adf.carg:{[arg] arg{ (x;y) }'"f"$til[narg]=/:til narg:count arg}

.adf.forward0.forward0:.proto.proton[.adf.forward0.a;.adf.forward0.o]

.adf.forward0.return:{[r]
 if[not 1=count r 0;:r];
 if[0>type r 0;:@[r;1;first]];
 @[r;1;] {enlist@'x 0}
 }

.adf.forward0.d0:()!()

.adf.forward0.d0[1]:{[input;x0] input:@[input;`arg;:;] input[`arg]! .proto.targ@' .adf.carg enlist x0;r:.proto.proto0_[input]; .adf.forward0.return r }
.adf.forward0.d0[2]:{[input;x0;x1] input:@[input;`arg;:;] input[`arg]! .proto.targ@' .adf.carg (x0;x1);r:.proto.proto0_[input]; .adf.forward0.return r }
.adf.forward0.d0[3]:{[input;x0;x1;x2] input:@[input;`arg;:;] input[`arg]! .proto.targ@' .adf.carg (x0;x1;x2);r:.proto.proto0_[input]; .adf.forward0.return r }
.adf.forward0.d0[4]:{[input;x0;x1;x2;x3] input:@[input;`arg;:;] input[`arg]! .proto.targ@' .adf.carg (x0;x1;x2;x3);r:.proto.proto0_[input]; .adf.forward0.return r }
.adf.forward0.d0[5]:{[input;x0;x1;x2;x3;x4] input:@[input;`arg;:;] input[`arg]! .proto.targ@' .adf.carg (x0;x1;x2;x3;x4);r:.proto.proto0_[input]; .adf.forward0.return r }
.adf.forward0.d0[6]:{[input;x0;x1;x2;x3;x4;x5] input:@[input;`arg;:;] input[`arg]! .proto.targ@' .adf.carg (x0;x1;x2;x3;x4;x5);r:.proto.proto0_[input]; .adf.forward0.return r }
.adf.forward0.d0[7]:{[input;x0;x1;x2;x3;x4;x5;x6] input:@[input;`arg;:;] input[`arg]! .proto.targ@' .adf.carg (x0;x1;x2;x3;x4;x5;x6);r:.proto.proto0_[input]; .adf.forward0.return r }

.adf.forward0.proton:{[f]
 input:.proto.getb[f],`index`val`a`o!(()!();();.adf.forward0.a;.adf.forward0.o);
 input:@[input;`exn;:;] .proto.exn input`exn ;
 .adf.forward0.d0[count input`arg][input]
 }

.adf.forward:.adf.forward0.proton

.adf.s:{[a;o;x]
 data:x`data;proj:x`proj;
 u:x`u;
 u:.adf.adata[u]proj; 
 u0:.adf.atom[u;a];
 u1:.adf.adata[u0]data;
 u2:.adf.operator[u1;o];
 e:exec e from u2 where g=pind;
 r:.proto.eval0 e;
 data0:.proto.udata[o;data;e;r];
 u0:update e:count[i]#enlist r from u2 where pind=ind;
 u0:update pind:max p where p<pind from u0;
 `proj`u`data!(proj;u0;data0)
 }

.adf.atom:{[u;a]a:{x["j"$type y;`fnc] y} .proto.atom0 lj ([tipe:key a]fnc:value a);
 update e:a@'e from u where 100h>type@'e
 }

.adf.addg:{[u] update g:@[ind;where p=pind;:;pind 0] from u}

.adf.adata:{[u;data]
 tmp:(1#0#r),r:.adf.addg u;
 1_update e:data e from tmp where -11h=type@'e,e in\:key data
 }

.adf.operator:.proto.operator

.adf.backward0.o:
 .proto.odefine[`Hyphen;{[v;hat] enlist[hat 0],hat[0]*/:1 -1f }]
 .proto.odefine[`Plus;{[v;hat] enlist[hat 0],hat[0]*/:1 1f }]
 .proto.odefine[`Multiply;{[v;hat] enlist[hat 0],hat[0] */: reverse 1_v}]
 .proto.odefine[`Procenttecken;{[v;hat] enlist[hat 0;hat[1]%v[2];] -1 * hat[1]*v[1] % v[2]*v[2]   }] 
 .proto.odefine[`Log;{[v;hat] (hat[0];hat[0] % v[1]) }]
 .proto.odefine[`Sin;{[v;hat] (hat[0];hat[0] * cos v[1]) }]   
 .proto.odefine[`Xexp;{[v;hat] (hat[0];hat[0] * v[2] * v[1] xexp -1+v 2;0f)  }]
 .proto.odefine[`Sqrt;{[v;hat] (hat[0];0.5*hat[0] % sqrt v[1]) }]   
 .proto.odefine[`.adf.const2;{[v;hat] (hat[0];0f)  }]
 .proto.odefine[`.adf.const3;{[v;hat] (hat[0];0f)  }]  
 .proto.nil

.adf.backward0.a:.proto.nil

.adf.backward0.backward:{[a;o;result]
 m:max count@'result`data;
 result:@[result;`u;{[m;x]update pind:min p,hat:@[;where not p=ind;:;0nf]count[i]#enlist m#1f from select ind,p,e:orig,v:e from x}[m]];  
 graph:.adf.backward0.backward0[a;o]/[result`u];
 select sum hat by e from graph where -11h=type@'e,e in key result`data 
 }

.adf.backward0.backward0:{[a;o;graph]
 graph:.adf.atom[graph;a];
 graph:.adf.operator[graph;o];
 graph:update hat:e[0][v;hat] from graph where (p=pind)or pind=ind;
 graph:update pind:{[p;hat;ind] min k where (k:p where 1b~'null hat) in ind where not 1b~'null hat }[p;hat;ind] from graph;
 graph
 }

.adf.backward0.exn:{[exn]
 exn:parse exn;
 exn:$[";"~exn 0;1_exn;enlist exn];
 exn:.proto.untree@'exn;
 exn:{update e:first each e from x where ((0h=type@'e) and (1={@[count;x;0]}@'e) and (11h=abs {type first x}@'e)) or (11h=type@'e) and 1=count@'e } @'exn;
 exn:{update pind:max p,orig:e from x}@'exn;
 exn  
 }

.adf.backward_:{[a;o;exn;data;proj]
 l:enlist[`data`proj!(data;proj)] , exn;
 r0:reverse 1_{[a;o;x;y] .adf.s[a;o]/[`proj`data`u!(x`proj;x`data;y)] }[.proto.nil;.proto.nil]\[l];
 c:r0[ 0;`u;0;`e];
 r:exec e!hat from sum .adf.backward0.backward[.adf.backward0.a;.adf.backward0.o;]@'r0;
 enlist[c;] flip ((k!count[k]#0f),r) k where -11h=type@'k:key data
 }

.adf.backward0.return:{[d;r] if[0>type r 0;:@[r;1;first]];@[r;1;{enlist@'first x}]}

.adf.backward1:()!()
.adf.backward1[1]:{[d;x0]data:((::),d[`arg])!(::;x0);d:@[d;`exn;:;.adf.backward0.exn d`exn];r:.adf.backward_[d`a;d`o;d`exn;data;d`proj];.adf.backward0.return[d;r]}
.adf.backward1[2]:{[d;x0;x1]data:((::),d[`arg])!(::;x0;x1);d:@[d;`exn;:;.adf.backward0.exn d`exn];r:.adf.backward_[d`a;d`o;d`exn;data;d`proj];.adf.backward0.return[d;r]}
.adf.backward1[3]:{[d;x0;x1;x2]data:((::),d[`arg])!(::;x0;x1;x2);d:@[d;`exn;:;.adf.backward0.exn d`exn];r:.adf.backward_[d`a;d`o;d`exn;data;d`proj];.adf.backward0.return[d;r]}
.adf.backward1[4]:{[d;x0;x1;x2;x3]data:((::),d[`arg])!(::;x0;x1;x2;x3);d:@[d;`exn;:;.adf.backward0.exn d`exn];r:.adf.backward_[d`a;d`o;d`exn;data;d`proj];.adf.backward0.return[d;r]}
.adf.backward1[5]:{[d;x0;x1;x2;x3;x4]data:((::),d[`arg])!(::;x0;x1;x2;x3;x4);d:@[d;`exn;:;.adf.backward0.exn d`exn];r:.adf.backward_[d`a;d`o;d`exn;data;d`proj];.adf.backward0.return[d;r]}
.adf.backward1[6]:{[d;x0;x1;x2;x3;x4;x5]data:((::),d[`arg])!(::;x0;x1;x2;x3;x4;x5);d:@[d;`exn;:;.adf.backward0.exn d`exn];r:.adf.backward_[d`a;d`o;d`exn;data;d`proj];.adf.backward0.return[d;r]}
.adf.backward1[7]:{[d;x0;x1;x2;x3;x4;x5;x6]data:((::),d[`arg])!(::;x0;x1;x2;x3;x4;x5;x6);d:@[d;`exn;:;.adf.backward0.exn d`exn];r:.adf.backward_[d`a;d`o;d`exn;data;d`proj];.adf.backward0.return[d;r]}

.adf.backward:{[f]d:.proto.getb[f],`a`o!(.adf.backward0.a;.adf.backward0.o);.adf.backward1[count d`arg][d]  }  