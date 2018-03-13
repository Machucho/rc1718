%dec2peano(Dec, Peano)
%Es cierto cuando Peano unifica
%con el equivalente al decimal Dec
%ejemplo:
%dec2peano(3, P)
%P =s(s(s(0)))

dec2peano(0, 0).
dec2peano(Dec, s(Z)):- Dec > 0, Dec2 is Dec-1, dec2peano(Dec2, Z). 