% divide(+Elem, +Lista, -Menores, -Mayores)
%es cierto cuando Menores unifica con una lista que 
%contiene los elemenentos de Lista que son menores
%o iguales que Elem y Mayores unifica con una lista
%que contiene los elementos de Lista que son 
%mayores que Elem
%-----------------------------------------------------

divide(_,[],[],[]).
divide(Elem, [Cab|Resto], Menores, [Cab|Mayores]):- Cab > Elem,
						    divide(Elem, Resto, Menores, Mayores).
divide(Elem, [Cab|Resto], [Cab|Menores], Mayores):- Cab =< Elem,
						    divide(Elem, Resto, Menores, Mayores).

%-----------------------------------------------------
% ordena_quick(+Lista, -ListaR). 
%es cierto cuando ListaR unifica con una lista que
%contiene los mismos elementos que Lista ordenados
%de menor a mayor.
%-------------------------------------------------

ordena_quick([],[]).
ordena_quick([Cab|Resto], R):- divide(Cab, Resto, Men, May),
			       ordena_quick(Men, RMen),
			       ordena_quick(May, RMay),
			       append(RMen, [Cab|RMay], R).

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

% inserta_en_list_ord(+Elem, +Lista, -ListaR).
%es cierto cuando ListaR unifica con una lista
%que contiene los elementos de la lista ordenada
%Lista, con el elemento Elem insertado de forma
%ordenada.
%----------------------------------------------------

inserta_en_list_ord(Elem, [], [Elem]).
inserta_en_list_ord(Elem, [Cab|Resto], [Elem, Cab|Resto]):- Elem =< Cab.
inserta_en_list_ord(Elem, [Cab|Resto], [Cab|R]):- Elem > Cab,
						  inserta_en_list_ord(Elem, Resto, R).

%----------------------------------------------------
% ordena_insercion(+Lista, -ListaR). 
%es cierto cuando ListaR unifica con una lista que
%contiene los mismos elementos que Lista ordenados
%de menor a mayor.
%----------------------------------------------------

ordena_insercion([],[]).
ordena_insercion([Cab|Resto], R2):- ordena_insercion(Resto, R1),
				    inserta_en_list_ord(Cab,R1, R2).