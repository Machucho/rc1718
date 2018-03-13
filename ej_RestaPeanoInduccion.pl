resta(X, 0, X). %x-0=X
resta(X, s(0), Z):- resta(X, Y, s(Z)). %4-2=2, ->4-1=3.