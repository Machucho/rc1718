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

%descomprime(+Lista, -R)
%es cierto cuando R unifica con una lista
%que contiene los elementos de Lista
%en formato descomprimido:
%Ejemplo; [(a,3),(b,3),(c,1)]  -> [a,a,a,b,b,b,c]
%--------------------------------------------------

descomprime([], []).
descomprime([E,1], [E]).
descomprime([(E,N),Resto], [E|R]):-
			N>1,
			N2 is N - 1,
			descomprime([(E, N2)|Resto],R).
descomprime([(E,1)|Resto], [E|R]):- descomprime(Resto, R).