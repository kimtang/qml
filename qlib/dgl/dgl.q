
d)lib %qml%/qlib/dgl/dgl.q
 Library for working with the lib dgl
 q).import.module`dgl 
 q).import.module`qml.dgl
 q).import.module"%qml%/qlib/dgl/dgl.q"

.dgl.summary:{} 

d).dgl.summary 
 Give a summary of this function
 q) .dgl.summary[] 


.dgl.r.as_adjacency_matrix1:{[graph]
 graph0:first graph:"r" .bt.print["as_adjacency_matrix(%name%)"] .bt.md[`name]graph;
 dim:first graph0[`Dim];
 (dim#0b){[x;y]@[x;y;:;1b]}/: -1_graph0[`p] cut graph0`i
 }

.dgl.r.as_adjacency_matrix:{[graph]
 graph0:first graph:"r" .bt.print["as_adjacency_matrix(%name%)"] .bt.md[`name]graph;
 dim:first graph0`Dim;
 t:([]p:1_deltas graph0[`p];num:-1_til count graph0[`p]);
 m:((dim*dim)#0b);
 names:graph0[`Dimnames]0;
 if[0h=type names;names:`$names];
 if[0=count names;names:til dim];
 ([]v0:names;v1:dim cut @[m; ;:;1b] graph0[`i] + raze exec {[p;x] x*p#1 }'[p;num*dim] from t)
 }

d).dgl.r.as_adjacency_matrix
 Get the adjacency_matrix of a graph
 r)library(igraph)
 r) g0 <- make_graph("Zachary") || print
 r)g1 <- make_graph(
  ~ Alice - Boris:Himari:Moshe, Himari - Alice:Nang:Moshe:Samira,
  Ibrahim - Nang:Moshe, Nang - Samira
 ) %>%
  set_vertex_attr("age", value = c(25, 31, 18, 23, 47, 22, 50)) %>%
  set_vertex_attr("gender", value = c("f", "m", "f", "m", "m", "f", "m")) %>%
  set_edge_attr("is_formal", value = c(FALSE, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, FALSE))
 q) acm1:.dgl.r.as_adjacency_matrix "g0"
 q) acm2:.dgl.r.as_adjacency_matrix "g1"

.dgl.as_edge:{[acm] update edge:v0 where@'v1 from acm}

d).dgl.as_edge
 return as edge from adjacency_matrix
 r)library(igraph) 
 r) .dgl.as_edge .dgl.r.as_adjacency_matrix "r" "g0 <- make_graph(\"Zachary\")"

.dgl.degree:{[acm] update degree: sum@'v1 from acm}

d).dgl.degree
 return as edge from adjacency_matrix
 r)library(igraph) 
 r) .dgl.degree .dgl.r.as_adjacency_matrix "r" "g0 <- make_graph(\"Zachary\")"