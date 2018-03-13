%peano2dec(Peano, Dec)

peano2dec(0, 0).
peano2dec(s(P), D2):- peano2dec(P,D), D2 is D + 1. 