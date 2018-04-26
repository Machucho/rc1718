%balanceado(+A)
%es cierto si para todo nodo, la diferencia de
%alturas entr el subarbol izdo y el dcho
%difiere como maximo una unidad.
balanceado(nil).
balanceado(a,(_,HI,HD)):-
    balanceado(HI),
    balanceado(HD),
    altura(HD, RD),
    R is RI - RD,
    R2 is abs(R),
    R2 < 2.


%altura(+A, -N)
%Es cierto cuando N unifica con la altura del 
%arbol A.
altura(nil, 0).
altura(A(_, HI, HD), R2):-  altura(HI, RI),
                            altura(HD, RD),
                            R is max(RI, RD),
                            R2 is R + 1.