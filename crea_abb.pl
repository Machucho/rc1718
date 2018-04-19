%crea_abb(+L, -A)
%Es cierto cuando A unifica con un arbol binario
%de busqueda balanceado que contiene todas las
%etiqueras de L. Consideremos que la lista esta ordenada

crea_abb([], nil).
crea_abb([L], a(Cab, R1, R2)):-
    length(L, N),
    N2 is N div 2, %No hace falta caso para un elemento porque length devuelve lista vacia([])
    length(L1, N2), %uso inverso del length
    append(L1, [Cab|Resto], L),
    crea_arbol(L1, R1),
    crea_arbol(Resto, R2).