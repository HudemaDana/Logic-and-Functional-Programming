% Calculate the alternate sum of list’s elements (l1 - l2 + l3 ...).
%
%Mathematical model
%	alternateSum(L1,...,Ln,Ok)=
%		| 0, n = 0
%		| L1- alternateSum(L2,...,Ln,1), Ok=0
%		| L1+ alternateSum(L2,...Ln,0), Ok=1

%daca lista e goala, returnez 0
alternateSum([],_,0).

%daca ma aflu pe pozitie para aduc elementul la suma
alternateSum([H1|T],Ok,Result):-
    Ok=:=0,
    Ok1 is 1,
    alternateSum(T,Ok1,Result1),
    Result is Result1 + H1.

%daca ma aflu pe pozitie impara scad elementul de la suma
alternateSum([H1|T],Ok,Result):-
    Ok=:=1,
    Ok1 is 0,
    alternateSum(T,Ok1,Result1),
    Result is Result1 - H1.

test_alternateSum():-
    alternateSum([1,2,3],0,2), %suma e 1-2+3 = 2
	alternateSum([0,0,0],0,0), %suma e 0-0+0 = 0
	alternateSum([3,0,1],0,4). %suma e 3-0+1 = 4
