% Define a predicate to test if a list of an integer elements has a "valley" aspect (a set has a "valley" aspect if
%elements decreases up to a certain point, and then increases.
%eg: 10 8 6 9 11 13 – has a “valley” aspect
%
%mathematical model
%!  checkValley(L1,...,Ln,Ok1,Ok2) =
%      |      true  , n=1 && Ok1=1 && Ok2=1
%      |      checkValley(L2,...,Ln,1,0),  n>1 && Ok2=0 && L1>L2
%      |      checkValley(L2,...,Ln,1,1) , n>1 && Ok1=1 && L1<=L2
%      |      false , otherwise

%daca mai e un elem si am avut si vale si deal atunci return true
checkValley([_],1,1).

%cat timp a>b inseamna ca se afla pe ramura de vale si merge mai departe(obligatoriu sa nu fi mers pe ramura de deal inainte)
checkValley([H1,H2|T],_,0):-
    H1 > H2,
    checkValley([H2|T],1,0).

%cat timp a<=b inseamna ca se afla pe ramura de deal si merge mai departe(obligatoriu sa fi mers pe ramura de vale inainte)
checkValley([H1,H2|T],1,_):-
    H1 =< H2,
    checkValley([H2|T],1,1).

test_checkValley():-
    \+checkValley([1,2,3],0,0), %return false
      checkValley([1,0,3],0,0), %return true
    \+checkValley([1,4,3],0,0), %return false
	\+checkValley([3,2,1],0,0), %return false
	\+checkValley([],0,0).      %return false
