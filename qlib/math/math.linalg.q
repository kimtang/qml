
.math.linalg.cholcov:{
 f:{[x;y] A:x;i:y 0; j:y 1; s:(A . y) - sum ((*) . A y) til j; A[i;j]:$[i>j;s % A[j;j];(i=j) & s>0f;sqrt s;'`.math.linalg.cholcov.not_pos_def];:A};
 r:f over enlist[x] , raze (tn,/:\:tn)@'where each wn:tn>=\:tn:til n:count x;
 :flip r* wn;
 }

d) fnc qml.math.linalg.cholcov
 Cholesky decomposition https://en.wikipedia.org/wiki/Cholesky_decomposition
 q) .math.linalg.cholcov 3 cut 4 12 -16 12 37 -43 -16 -43 98f