%Lista_hojas(+Arbol_binario, ?Lista_hojas)
%es cierto cuando Lista_hojas unifica con una lista que contiene
%las etiquetas de las hojas del árbol “Arbol_binario” 

lista_hojas(nil, []).
lista_hojas(a(_, nil, HD),LD):- HD \=nil,
                                lista_hojas(HD, LD).
lista_hojas(a(_,HI,nil), LI):- HI \= nil,
                               lista_hojas(HI, LI).
 lista_hojas(a(_, HI, HD), LR):- HI \= nil, HD\=nil,
                                 lista_hojas(HI, LI),
                                 lista_hojas(HD, LD),
                                 append(LI, LD, LR). lista_hojas(a(Et, nil,nil), [Et]).

dato(a(a,a(b,a(d,nil,nil),a(e,nil,nil)),a(c,nil,a(f,a(g,nil,nil),nil)))).

%cuenta_hojas(+A, -R)
%Es cierto cuando R unifica con el número de 
%hojas del árbol A
        
cuenta_hojas(A, R2):- lista_hojas(A, R),
                      length(R, R2).
    
%cuenta_internos(+A, -R).
%Es cierto cuando R unifica con el número
%de nodos internos del árbol A (todos los nodos 
% menos las hojas)
  
cuenta_internos(A, R):- cuenta_nodos(A, NumNodos),
                        cuenta_hojas(A, NumHojas),
                        R is NumNodos - NumHojas.