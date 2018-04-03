%concatena(+List1, +List2, -ListR).
%
%es cierto cuando ListaR unifica con una
%lista que contiene los elementos de la 
%lista List1 en el mismo orden y seguidos
%de los mismos elementos de la lista List2 en el
mismo orden.
%---------------------------------------------------

concatena([], L2, L2).
concatena([Cabeza|Resto], L2, [Cabeza|R]):- concatena(Resto, L2, R).

%---------------------------------------------------
%ordenada(+Lista)
%es cierto cuando Lista unifica con una lista
%que contiene sus elementos ordenados de menor
%a mayor.
%---------------------------------------------------

ordenada([]). 
ordenada([_]). 
ordenada([Cab1, Cab2|Resto]):-  Cab1 =< Cab2,   
				ordenada([Cab2|Resto]).

%---------------------------------------------------
% ordena_burbuja(+Lista, -ListaR).
%es cierto cuando ListaR unifica con una lista que
%contiene los mismos elementos que Lista ordenados
%de menor a mayor.
%---------------------------------------------------

ordena_burbuja(Lista, Lista):- ordenada(Lista).
ordena_burbuja(Lista, RT):- append(L1, [E1,E2|Resto], Lista),
			    E1 > E2,
			    append(L1, [E2, E1|Resto], R)
			    ordena_burbuja(R, R2).