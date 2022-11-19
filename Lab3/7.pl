findMaxElem([],Max,Max).
findMaxElem([H|T],Max,R):-
    H>Max,
    findMaxElem(T,H,R).

findMaxElem([H|T],Max,R):-
    H=<Max,
    findMaxElem(T,Max,R).

findMaxMain([H|T],R):-
    findMaxElem(T,H,R),!.

%maxpos(L-list,CL-clone of the list,pos-position where we are,R-result list)
%-------------------------------------------------
%MATHEMATICAL MODEL
%-------------------------------------------------
%maxpos(l1l2...ln,Max,Pos) =
%		|	[]									, n=0
%		|	{pos} U maxpos(l2l3...ln,max,pos+1) , l1 == max
%		|	maxpos(l2l3...ln,max,pos+1)			, othewise

maxpos([],_,_,[]).
maxpos([H|T],Max,Pos,[Pos|R]):-
    H=:=Max,
    Pos1 is Pos+1,
    maxpos(T,Max,Pos1,R).
maxpos([H|T],Max,Pos,R):-
    H=\=Max,
    Pos1 is Pos+1,
    maxpos(T,Max,Pos1,R).

maxposMain(L,R):-
    findMaxMain(L,Max),
    maxpos(L,Max,1,R).

%heterList(L - initial list, R-resulted list)
%-------------------------------------------------
%MATHEMATICAL MODEL
%-------------------------------------------------
%heterList(l1l2...ln) =
%		|	[]										, n=0
%		|	maxposMain(l1) U heterList(l2l3...ln) , l1 is a list
%		|	heterList(l2l3...ln)					, otherwise

heterList([],[]).
heterList([H|T],[RM|R]):-
    is_list(H),
    !,
    maxposMain(H,RM),
    heterList(T,R).
heterList([H|T],[H|R]):-
    heterList(T,R).
