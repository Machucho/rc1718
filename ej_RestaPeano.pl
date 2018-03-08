%resta(?X, ?Y, ?Z)
%Es cierto cuando Z
%Unifica con la resta X-Y
suma(0,Y,Y).
suma(s(X),Y, s(Z)):- suma(X,Y,Z).
resta(X, Y, Z):- suma(Y, Z, X).