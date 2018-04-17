%cuenta_nodos(+A, -N)
%es ciero cuando N unifica con el numero
%de nodos del arbol A

cuenta_nodos(nil, 0).
cuenta_nodos(a(_, HI, HD), R):-
 cuenta_nodos(HI, RI),
 cuenta_nodos(HD, RD),
 R is RI + RD + 1.

dato(a(a,a(b,a(d,nil,nil),a(e,nil,nil)),a(c,nil,a(f,a(g,nil,nil),nil)))).