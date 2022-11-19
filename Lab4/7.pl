% 7. A player wants to choose the predictions for 4 games. The predictions can be 1, X, 2. Write a predicate
%   to generate all possible variants considering that: last prediction can’t be 2 and no more than two
%   possible predictions X.

%MATHEMATICAL MODEL
%---------------------------------------------------------
%checkLists(l1l2...ln)=
%		| true, countX(l1l2..ln)<=2 && ckeckLast2(l1l2..ln)==true
%		| false, otherwise

%countX(l1l2...ln)=
%	| 0, n=0
%	| 1+countX(l2l3...ln), l1==2
%	|countX(l2l3...ln), otherwise

%checkLast2(l1l2...ln)=
%	| false, n==1 && ln == 2
%	| true, n==1 && ln != 2
%	| checkLast2(l2...ln), otherwise

% allCombinations(n,i,c) = 
% = c, if i = n
% = allCombinations(n, i + 1, prediction(X) U c), otherwise

%-----------------------------------------------------------
prediction(1).
prediction(2).
prediction("x").

% allCombination(N:number, I:number, C: accumulator list, R: result list)
% (i,i,i,o)
allCombinations(N,N,C,C):-!.
allCombinations(N,I,C,R):-
    prediction(X),
    NI is I + 1,
    allCombinations(N,NI,[X|C],R).

%function to count the number of occurences of 'x' in the list
countX([],0).
countX([H|T],R):-
    H =:= "x",!,
    countX(T,R1),
    R is R1+1.
countX([_|T],R):-
    countX(T,R).

%function to check if the last digit in a list is 2
checkLast2([H|[]]):-
    atomic(H),
    H=\=2,!.
checkLast2([_|T]):-
    checkLast2(T).

%check for each list if has the right format
checkLists(L):-
    checkLast2(L),
    countX(L,Count),
    Count=<2,!.

oneSol(Nr,R):-
    allCombinations(Nr,0,[],R),
    checkLists(R).

allSols(Nr,R):-
    findall(RPartial, oneSol(Nr,RPartial),R).


testPrediction():-
	allSols(1,[[1], ["x"]]),
	allSols(2,[[1, 1], [2, 1], ["x", 1], [1, "x"], [2, "x"], ["x", "x"]]).

