% -------------------Pertenece: Verifica si un elemento se encuentra en una lista dada.-------------------------
pertenece(X, [X|_]).
pertenece(X,[_|Y]):- pertenece(X,Y).

% ---------------------------------- size: Obtiene la longitud de una lista------------------------------------
size([_],1).
size([],0).
size([_|Xs],R):- size(Xs,Aux), R is Aux+1.

% ----------------------------concatenar: Da como resultado dos cadenas concatenadas---------------------------
concatenar(L1,[],L1).
concatenar([],L2,L2).
concatenar([H1|T1], L2, [H1|R]):- concatenar(T1,L2,R).

% ----------------------------Eliminar: El método ayuda a eliminar un objeto de una lista----------------------
eliminar(_,[],[]).
eliminar(E, [E|Tail],Tail).
eliminar(E, [X|Tail], [X|R]):- eliminar(E, Tail,R).

% ----------------------------Agregar: Añade un elemento nuevo a una lista-------------------------------------
agregar(X,L,[X|L]).

% ------------------Separar: Ayuda a separar una lista en 2 listas, es decir pares e impares-------------------
separar([],[],[]).
separar([X|Xs],[P|Ps],Is) :- 
    X mod 2 =:=0,
    P is X,
    separar(Xs,Ps,Is).
separar([X|Xs],Ps,[I|Is]) :-
    X mod 2 =\=0,
    I is X,
    separar(Xs,Ps,Is).

% --------------- Ascendente: Verifica si los elementos de una lista se encuentran de manera ascendente.--------------
asc([_]).
asc([X1,X2|Tail]):- X1<X2, asc([X2|Tail]).

% --------------- Descendente: Verifica si los elementos de una lista se encuentran de manera descendente.
des([_]).
des([X1,X2|Tail]):- X1>X2, des([X2|Tail]).

% ---------------Aplanar: aplanar(L, A), donde L es "una lista de listas",---------------------------------
% -               A es la lista que resulta de reorganizar los elementos contenidos 
%                 en las listas anidadas en un único nivel.
aplanar([],[]).
aplanar([X|R], [X|P]) :- atomic(X), aplanar(R,P).
aplanar([X|R],P) :- not(atomic(X)), aplanar(X, P_X), aplanar(R, P_R), append(P_X, P_R, P).

% ----------------Menor que Head: Es de utilidad para obtener a obtener uns lista con los elementos menores que el elemento Head.--------------------
menorHead([],[]).
menorHead([_],[]).
menorHead([X1,X2|Tail],[X2|L]) :- X1>X2, menorHead([X1|Tail],L).
menorHead([X1,X2|Tail],L) :- X1<X2, menorHead([X1|Tail],L).
menorHead([X1,X2|Tail],L) :- X1=:=X2, menorHead([X1|Tail],L).

% ----------------Mayor que Head: Es de utilidad para obtener una lista con los elementos mayores que el elemento Head.
mayorHead([],[]).
mayorHead([_],[]).
mayorHead([X1,X2|Tail],[X2|L]) :- X1<X2, mayorHead([X1|Tail],L).
mayorHead([X1,X2|Tail],L) :- X1>X2, mayorHead([X1|Tail],L).
mayorHead([X1,X2|Tail],L) :- X1=:=X2, mayorHead([X1|Tail],L).

% ------------------- Invertir: obtener una lista con los elementos invertidos.-------------------------------
invierte([],[]).
invierte([H|T],L):- invierte(T,R), concat(R,[H],L).

concat([],L,L).
concat([X|L1],L2,[X|L3]):- concat(L1,L2,L3).