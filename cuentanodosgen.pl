%cuenta_nodos(+A, -N)
%es ciero cuando N unifica con el numero
%de nodos del arbol A

%cláusula para un árbol genérico
cuenta_nodos(a(_, Lista_hijos), R):-
    cuenta_nodos(Lista_hijos, N),
    R is N + 1.
    % cláusulas para lista de árboles
    cuenta_nodos([], 0).
    cuenta_nodos([Cab|Resto], R):-
     cuenta_nodos(Cab, NCab),
     cuenta_nodos(Resto, NResto),
     R is Ncab + Nresto.
    dato(a(a,[a(f,[a(g,[])]),a(c,[]),a(b,[a(d,[]),a(e,[])])])).
    /* dato(A), cuenta_nodos(A,N).
    A = a(a, [a(f, [a(g, [])]), a(c, []), a(b, [a(d, []), a(e, [])])])
    N = 7 */