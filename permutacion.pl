%permutacion(?L1, ?L2).
%Es cierto cuando L1 unifica con una lista
%que contiene los elementos de L2 en orden
%distinto. Por unificación debo poder ibtener
%todas las posibibles ordenaciones.

permutacion([], [Cabeza|Resto]):- 
permutacion(Pos, <`_<1Resto], Salida).

%insertar(E, Lista, R).
%Es cierto cuando R unifica con una lista
%que contiene los elementos de Lista con
%E insertado en cualquier posición. Por
%unificacion debe dar todas las posiciones

insertar(E, Lista, [E|Lista]).
insertar(E, [Cabeza|Resto, [Cabeza,[R]): insertar(E, Resto, R).