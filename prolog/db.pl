happy(albert).
happy(alice).
happy(bill).
with_albert(alice).

dances(alice) :-
    happy(alice),
    with_albert(alice).

male(albert).
male(bob).
male(bill).
male(carl).
male(charlie).


female(alice).
female(betsy).
female(diana).

parent(albert,bob).
parent(albert,betsy).
parent(albert,bill).

parent(alice,bob).
parent(alice,betsy).
parent(alice,bill).

parent(bob,carl).
parent(bob,charlie).

get_grandchild :-
    parent(albert,X),
    parent(X,Y),
    write('Alberts grandchild is '),
    write(Y),nl.

get_grandparent :-
    parent(X,carl),
    parent(X,charlie),
    format('~w ~s grandparent ~n',[X,"is "]).

brother(bob,bill).

grand_parent(X,Y) :-
    parent(Z,X),
    parent(Y,Z).

blushes(X) :- human(X).
human(alex).

stabs(tybalt,mercutio,sword).
hates(romeo,X) :- stabs(X,mercutio,sword).

customer(tom,smith,34.35).
customer(sally,smith,231.40).

get_customer_bal(FName,LName):-
    customer(FName,LName,Balance),
    write(FName), tab(2),
    format('~w owes us $~2f ~n',[LName,Balance]).
