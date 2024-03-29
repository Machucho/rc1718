%masveces(+L, -E, -N).
%es cierto cuando E unifica con el elemento
%que mas veces se repite en L y N con el
%numero de veces que se repite

masveces(L, E, N):-
    msort(L, R),
    comprime(R, R2),
    ordena_quick(R2, R3),
    reverse(R3, [(E,N)|_]).
%--------------------------------COMPRIME----------------------------------------------
%comprime(+Lista, -R)
%es cierto cuando R unifica con una lista
%que contiene los elementos de Lista
%en formato comprimido:
%Ejemplo; [a,a,a,b,b,b,c] .> [(a,3),(b,3),(c,1)] 
%--------------------------------------------------

comprime([], []).
comprime([E], [(E,1)]).
comprime([Ca, Ca|Resto], [(Ca,N2)|R]):- comprime([Ca|Resto], [(Ca,N)|R]),
										N2 is N+1.

comprime([Ca1, Ca2|Resto], [(Ca1,1)|R]):- Ca1 \= Ca2,
  										  comprime([Ca2|Resto], R).
%--------------------------------------------------------------------------------------


%----------------------------------QUICKSORT--------------------------------------------
% divide(+Elem, +Lista, -Menores, -Mayores)
%es cierto cuando Menores unifica con una lista que 
%contiene los elemenentos de Lista que son menores
%o iguales que Elem y Mayores unifica con una lista
%que contiene los elementos de Lista que son 
%mayores que Elem
%-----------------------------------------------------

divide(_,[],[],[]).
divide(Elem, [(Valor, N)|Resto], Mayores, [(Valor, N)|Menores]):- N > Elem,
						    divide(Elem, Resto, Menores, Mayores).
divide(Elem, [(Valor, N)|Resto], [(Valor, N)|Menores], Mayores):- N =< Elem,
						    divide(Elem, Resto, Menores, Mayores).

%-----------------------------------------------------
% ordena_quick(+Lista, -ListaR). 
%es cierto cuando ListaR unifica con una lista que
%contiene los mismos elementos que Lista ordenados
%de menor a mayor.
%-------------------------------------------------

ordena_quick([],[]).
ordena_quick([(Valor, N)|Resto], R):- divide((Valor, N), Resto, Men, May),
			       ordena_quick(Men, RMen),
			       ordena_quick(May, RMay),
			       append(RMen, [(Valor, N)|RMay], R).
%--------------------------------------------------------------------------------------