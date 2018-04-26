%crea_arbol(+L, -Ag)
%Es cierto cuando Ag unifica con un arbol generico
%que contiene todas las etiquetas de la lista L

crea_arbol_ag([Ca|Resto], a(Ca, r)):-
    cre_lista_ag(Resto, R).

crea_lista_ag([], []).
cre_lista_ag([Ca|Resto], [a(Ca, [])|R]):-
    cre_lista_ag(Resto, R).