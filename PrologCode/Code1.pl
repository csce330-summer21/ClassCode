% basic comparisons : < , > , >= , =< , =:= (negate last)

strictlyIncreasing(A,B,C):- A<B,B<C.

nonDecreasing(A,B,C) :- A=<B,B=<C.

% Y is 2, X is Y, \+ X =:= Y.


% try 30/4 , note floating point returned

%other ops available
%div(), also //, integer div., %mod
% note, basically a return (unusual)

% is vs =:= ( left hand of is can be unset for unificaiton)

quotient_remainder(X,Y,Q,R) :- Q is div(X,Y), R is mod(X,Y).

quotient_remainder2(X,Y,Q,R) :- Q is X // Y, R is mod(X,Y).

%square function?
square(N,Sq) :- Sq is N*N.

square2(N,Sq) :- Sq is N^2.

%sqrt(N). Kind of pointless
square_root(S,SR) :- SR is sqrt(S).

%factorial
factorial(0,1).
factorial(N,F):- 
    N>0,
    Nm1 is N-1, 
    factorial(Nm1,Fm1),
    F is Fm1*N.


%so, what's power of a pow(A,P,A_to_the_P) ?
%yes ^ works in Prolog, but this is recursive...

power(_,0,1).
power(B,P,B2P) :- 
    P>0,
    Pm1 is P-1,
    power(B,Pm1,B2Pm1),
    B2P is B * B2Pm1.
power(B,P,B2P) :-
    P < 0,
    PosP is -1*P, 
    power(B,PosP,B2PosP),
    B2P is 1/B2PosP.


%define with power(A,0,1) ?

%so, what's blocks world?

%loc(b1,x,y) screen-coordinate order
loc(b1,0,2).
loc(b2,0,3).
loc(b3,1,0).
loc(b4,1,1).
loc(b5,1,2).
loc(b6,1,3).
loc(b7,2,3).

%generator for blocks?
block(B):-loc(B,_,_).

on(Bt,Bb):-
    loc(Bt,X,Yt),
    loc(Bb,X,Yb),
    Yb -Yt =:= 1.

above(Bt,Bb):-
    loc(Bt,X,Yt),
    loc(Bb,X,Yb),
    Yb -Yt > 0.

below(Bb,Bt):- above(Bt,Bb).

left(Bl,Br) :- loc(Bl,Xl,_),loc(Br,Xr,_),Xl<Xr.


%really important - Lists!

%note these examples:
% head_tail([1,2,3,4,5,6], H,T). , H is not list (in general), T is list
% head_tail([1], H,T). , T is empty list
% head_tail([], H,T). ,FAILS, H _must_ match at item and there's no
%     items...
head_tail( [H|T],H,T).

%real predicate is length/2
len([],0).
len( [_|T],Len ):- len(T,LT),Len is LT+1.

%sum items in a list
sum([],0).
sum([N|T],S):- sum(T,ST),S is N+ST. 


%adjacent equals?
%adjacent_equals( [H | [H|_] ] ).
adjacent_equals( [H,H|_] ).
adjacent_equals( [_|T]) :- adjacent_equals(T).

%class is_sorted (non-decreasing) order, multiple base cases
is_sorted([]).
is_sorted([_]).
is_sorted([X,Y|T]):- X =< Y, is_sorted([Y|T]).

%elem (real: member) -- test with M both set and unset
elem(E,[E|_]).
elem(E,[_|T]):-elem(E,T).

%concat (real, append)
%append([1,2,3], [4,5,6],C).
%append(A,B,[1,2,3,4,5,6]).
concat([],L,L).
concat( [H|T], L, [H|TL] ) :- concat(T,L,TL).

%real predicate is reverse
rev([],[]).
rev([H|T],RevTH):-
    rev(T,RevT),
    append(RevT,[H],RevTH).


% rev2 (library, example of accumulator pattern, also define helper rule
% (always okay)
rev2(L,R):-rev2Helper( L, [], R).

rev2Helper([],Rev,Rev).
rev2Helper([H|T], RevBegin, Rev) :- 
    rev2Helper(T,[H|RevBegin],Rev).

is_palindrome(L):-reverse(L,L).






%subset -- multiple cases
subset([],[]).
subset([H|R],[H|S]):- subset(R,S).
subset([_|R],S):- subset(R,S).

%permutation
perm([],[]).
perm([H|T],PHT):-
    perm(T,PT),
    append(A,B,PT),
    append(A,[H|B],PHT).

%disjoint using member, NO RECURSION (explicitly)
disjoint(A,B):- \+ (member(M,A),member(M,B) ).


%disjoint2 
disjoint2([],_).
disjoint2([H|T],B):-
    \+ append(_,[H|_],B),  % this is really member
    disjoint2(T,B).

%intersects
intersects(A,B):- \+disjoint(A,B).


%max rule
max(X,Y,M):-X>Y ,M is X.
max(X,Y,M):-X=<Y,M is Y.

%max of LIST
%maxL(L,Max)
maxL([H],H).
maxL([H|T],Max):-
    maxL(T,MaxT),
    max(H,MaxT,Max).


%list_evil 
list_evil([e,v,i,l|_]).
list_evil([_|T]):-list_evil(T).

%call following line:
% set_prolog_flag(answer_write_options,[max_depth(0)]).


%take Pre is length N prefix of L
take(0,_,[]).
take(N,[H|T],[H|PreT]):-
    Nm1 is N-1,
    take(Nm1,T,PreT).

%drop
drop(0,L,L).
drop(N,[_|T], Drop ):-
    Nm1 is N-1,
    drop(Nm1,T,Drop).





% more efficient version (take, in particular, computes and then
% discards the drop answer).

%note use of helper predicate, below
%split

% split less efficient with take and drop
splitInefficient(List,L,R):-
    length(List,Len),
    Half is Len//2,
    take(Half,List,L),
    drop(Half,List,R).

splitN(0,List,[],List).
splitN(N,[H|T],[H|LS],R):-
    Nm1 is N-1,
    splitN(Nm1,T,LS,R).

split(List,L,R):-
    length(List,Len),
    Half is Len//2,
    splitN(Half,List,L,R).


%merge_lists -- input lists are sorted
merge_lists([],L,L).
merge_lists(L,[],L).
merge_lists([G|S],[H|T],[G|M] ):-
    G =< H,
    merge_lists(S,[H|T],M).
merge_lists([G|S],[H|T],[H|M] ):-
    G > H,
    merge_lists([G|S],T,M).

%what happens if I do <, >= (sort NOT stable - 350)
mergesort([],[]).
mergesort([X],[X]).
mergesort(Unsorted,Sorted):-
    len2orMore(Unsorted),
    split(Unsorted,L,R),
    mergesort(L,SL),
    mergesort(R,SR),
    merge_lists(SL,SR,Sorted).

len2orMore( [_,_|_] ).

index(0,[H|T],H).
index(N,[_|T],Item):-
    N>0,
    Nm1 is N -1,
    index(Nm1,T,Item).