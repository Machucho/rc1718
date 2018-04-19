%crea_arbol(+l, -A)
%Es cierto cierto cuando A es un arbol binario que 
%contiene todas las etiquetas de la lista L

crea_arbol([], nil).
crea_arbol([Cab|L], a(Cab, R1, R2)):-
    length(L, N),
    N2 is N div 2, %No hace falta caso para un elemento porque length devuelve lista vacia([])
    length(L1, N2), %uso inverso del length
    append(L1, L2, L),
    crea_arbol(L1, R1),
    crea_arbol(L2, R2).