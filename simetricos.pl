%invertir(+A, -R)
%es cierto cuando R unifica con el arbol A
%invertido

invertir(nil, nil).
invertir(a(E, HI, HD),a(E, RD, RI)):- invertir(HI,RI), 
                                      invertir(HD,RD).

%simetrico(+A
%Es cierto si A es un arbol simetrico respecto 
%a su eje central

simetrico(A):- invertir(A, A).

    %simetricos(+A, +B)
    %Es cierti cuando A es simetrico a B

    simetricos(A, B):- invertir(A, B).

        arbol1(
            a(1, a(2,a(3,nil,nil),nil), a(2,nil,a(3,nil,nil))).

        arbol2(
            a(1,a(2,a(3,nil,nil),nil))).
