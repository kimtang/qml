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
  .proto.odefine[`Xexp;{[x;y] enlist[x[0] xexp y[0];] x[1] *y[0]* x[0] xexp -1+y[0] }]
  .proto.nil  

.adf.transform0:{(x;0f)}

.adf.forward0.a:{[x;y] y x } over enlist[ .proto.nil], .proto.adefine[;.adf.transform0]@' `float`long`int`real

.adf.forward:.proto.proto[.adf.forward0.a;.adf.forward0.o]

.adf.s:{[a;o;x]
 data:x`data;
 u:x`u;
 u0:.adf.atom[u;a];
 u1:.adf.adata[u0]data;
 u2:.adf.operator[u1;o];
 e:exec e from u2 where g=pind;
 r:.proto.eval0 e;
 data0:.proto.udata[o;data;e;r];
 u0:update e:count[i]#enlist r from u2 where pind=ind;
 u0:update pind:max p where p<pind from u0;
 `u`data!(u0;data0)
 }

.adf.atom:{[u;a]a:{x["j"$type y;`fnc] y} .proto.atom0 lj ([tipe:key a]fnc:value a);
 update e:a@'e from u where 100h>type@'e
 }

.adf.addg:{[u] update g:@[ind;where p=pind;:;pind 0] from u}

.adf.adata:{[u;data]
 tmp:(1#0#r),r:.adf.addg u;
 1_update e:data e from tmp where -11h=type@'e,e in\:key data
 }

.adf.operator:{[u;o]
 o:{if[not y in (0!.proto.operator0)`e;:y ] ;x[y;`fnc]} .proto.operator0 lj ([nme:key o]fnc:value o);
 // u:update e0:e from u;
 update e:o@'e from u where 99h<type@'e
 }

.adf.backward0.o:.proto.odefine[`Hyphen;{[v;hat] hat[0],hat[0]*1 -1f }]
 .proto.odefine[`Plus;{[v;hat] hat[0],hat[0]*1 1f }]
 .proto.odefine[`Multiply;{[v;hat] hat[0],hat[0] * reverse 1_v}]   
 .proto.odefine[`Log;{[v;hat] hat[0],hat[0] % v[1] }]
 .proto.odefine[`Sin;{[v;hat] hat[0],hat[0] * cos v[1] }]   
 .proto.odefine[`Xexp;{[v;hat] (hat[0];hat[0] * v[2] * v[1] xexp -1+v 2;0f)  }]
 .proto.nil

.adf.backward0.a:.proto.nil

.adf.backward0.backward:{[a;o;result]
 result:@[result;`u;{update pind:min p,hat:@[;where p=ind;:;1f]count[i]#0nf from select ind,p,e:orig,v:e from x}];  
 graph:.adf.backward0.backward0[a;o]/[result`u];
 select sum hat by e from graph where -11h=type@'e,e in key result`data 
 }

.adf.backward0.backward0:{[a;o;graph]
 graph:.adf.atom[graph;a];
 graph:.adf.operator[graph;o];
 graph:update hat:e[0][v;hat] from graph where (p=pind)or pind=ind;
 graph:update pind:{[p;hat;ind] min k where (k:p where null hat) in ind where not null hat }[p;hat;ind] from graph ;
 graph
 }  

.adf.backward_:{[a;o;exn;data]
 exn:parse exn;
 exn:$[";"~exn 0;1_exn;enlist exn];
 exn:.proto.untree@'exn;
 exn:{update e:first each e from x where ((0h=type@'e) and (1={@[count;x;0]}@'e) and (11h=abs {type first x}@'e)) or (11h=type@'e) and 1=count@'e } @'exn;
 exn:{update pind:max p,orig:e from x}@'exn;
 l:enlist[(enlist`data)!enlist data] , exn;
 r0:reverse 1_{[a;o;x;y] .adf.s[a;o]/[`data`u!(x`data;y)] }[.proto.nil;.proto.nil]\[l];
 c:r0[ 0;`u;0;`e];
 / update cost:c from sum .adf.backward0.backward[.adf.backward0.a;.adf.backward0.o;]@'r0
 (1!enlist`e`hat!(`cost;c)),sum .adf.backward0.backward[.adf.backward0.a;.adf.backward0.o;]@'r0
 }

.adf.backward1:()!()
.adf.backward1[1]:{[d;x0]data:((::),d[`arg])!(::;x0);.adf.backward_[d`a;d`o;d`exn;data]}
.adf.backward1[2]:{[d;x0;x1]data:((::),d[`arg])!(::;x0;x1);.adf.backward_[d`a;d`o;d`exn;data]}
.adf.backward1[3]:{[d;x0;x1;x2]data:((::),d[`arg])!(::;x0;x1;x2);.adf.backward_[d`a;d`o;d`exn;data]}
.adf.backward1[4]:{[d;x0;x1;x2;x3]data:((::),d[`arg])!(::;x0;x1;x2;x3);.adf.backward_[d`a;d`o;d`exn;data]}
.adf.backward1[5]:{[d;x0;x1;x2;x3;x4]data:((::),d[`arg])!(::;x0;x1;x2;x3;x4);.adf.backward_[d`a;d`o;d`exn;data]}
.adf.backward1[6]:{[d;x0;x1;x2;x3;x4;x5]data:((::),d[`arg])!(::;x0;x1;x2;x3;x4;x5);.adf.backward_[d`a;d`o;d`exn;data]}
.adf.backward1[7]:{[d;x0;x1;x2;x3;x4;x5;x6]data:((::),d[`arg])!(::;x0;x1;x2;x3;x4;x5;x6);.adf.backward_[d`a;d`o;d`exn;data]}

.adf.backward:{[f]d:.proto.getb[f],`a`o!(.adf.backward0.a;.adf.backward0.o);.adf.backward1[count d`arg][d]  }  