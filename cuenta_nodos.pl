%cuenta_nodos(+A, -N)
%es ciero cuando N unifica con el numero
%de nodos del arbol A

cuenta_nodos(nil, 0).
cuenta_nodos(a(_, HI, HD), R):-
 cuenta_nodos(HI, RI),
 cuenta_nodos(HD, RD),
 R is RI + RD + 1.

