% suma(?X, ?Y, ?Z)
% es cierto cuando Z unifica con la suma
% de X e Y en aritmética de Peano.

suma(0, Y, Y).
suma(s(X), Y, s(Z)) :- suma(X, Y, Z).

% resta(?X, ?Y, ?Z)
% es cierto cuando Z unifica con la resta
% de X e Y en aritmética de Peano.

% QuickMaths! X-Y=Z -> X=Z+Y
resta(X, Y, Z) :- suma(Y,Z,X). %suma(Z,Y,X).

% producto(?X, ?Y, ?Z)
% Es cierto cuando Z unifica con
% el producto de X por Y

producto(_,0,0).
producto(X,s(Y),Z2) :- producto(X,Y,Z), suma(Z,X,Z2). 

%menor(X,Y)
%es cierto cuando X es menor que Y en
%aritmetoca de Peano.
menor(0, s(_)).
menor(s(X), s(Y)):- menor(X,Y).

%mayor(?X, ?Y)
%Es cierto si X es mayor que Y
mayor(s(_),0).
mayor(s(X), s(Y)):- mayor(X, Y).

mayor_o_igual(X, X).
mayor_o_igual(X, Y):- mayor(X,Y).

%dec2peano(Dec, Peano)
%Es cierto cuando Peano unifica
%con el equivalente al decimal Dec
%ejemplo:
%dec2peano(3, P)
%P =s(s(s(0)))

dec2peano(0, 0).
dec2peano(Dec, s(Z)):- Dec > 0, Dec2 is Dec-1, dec2peano(Dec2, Z). 

%peano2dec(Peano, Dec)

peano2dec(0, 0).
peano2dec(s(P), D2):- peano2dec(P,D), D2 is D + 1. 

%divide(?X, ?Y, ?Z, ?Resto)
%Es cierto si Z unifica con la division entera
%de X entre Y y Resto unifica con el resto en
%aritmetica de Peano.

%1) P(no)
%2) P(n-1) -> P(n)

divide(X, Y, 0, X):- menor(X, Y).
divide(X,Y,s(Z),Resto) :- mayor_o_igual(X, Y), resta(X,Y,X2), divide(X2,Y,Z,Resto).  

