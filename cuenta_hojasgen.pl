%cuenta_hojas_ag(+A, -N)
%Es cierto cuando N unifica con el numero de hojas 
%del arbol generico A

cuenta_hojas_ag(_, 0).
cuenta_hojas_ag(a(_,[]),1).

cuenta_hojas_ag(a(_,Lista_hijos),R):-
    Lista_hijos/=[],
    cuenta_hojas_ag(Lista_hijos,R).

cuenta_hojas_ag([Ca|Resto], R):-
    cuenta_hojas_ag(Ca,RCab),
    cuenta_hojas_ag(Resto, RResto),
    R is RCab+ RResto.