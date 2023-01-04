/* Facts */

schedule(ankara, rize, 5).
schedule(ankara, van, 4).
schedule(ankara, diyarbakir, 8).
schedule(ankara, izmir, 6).
schedule(ankara, istanbul, 1).

schedule(istanbul, izmir, 2).
schedule(istanbul, ankara, 1).
schedule(istanbul, rize, 4).

schedule(gaziantep, van, 3).

schedule(van, gaziantep, 3).
schedule(van, ankara, 4).

schedule(diyarbakir, antalya, 4).
schedule(diyarbakir, ankara, 8).

schedule(antalya, diyarbakir, 4).
schedule(antalya, izmir, 2).
schedule(antalya, erzincan, 3).

schedule(erzincan, antalya, 3).
schedule(erzincan, canakkale, 6).

schedule(canakkale, erzincan, 6).

schedule(izmir, antalya, 2).
schedule(izmir, ankara, 6).
schedule(izmir, istanbul, 2).

schedule(rize, ankara, 5).
schedule(rize, istanbul, 4).

/*rules*/

connection(X , Y , C) :-  
    total_cost(X , Y , C , []) ; 
    schedule(X, Y, _).

% recursive operation like newrote = currentrote + flight to make all possible connections departure to arrived location
total_cost(Dep , Arr , Cost , _) :- 
    schedule(Dep , Arr , Cost).

%Calculating cost off all connections 
total_cost(Dep , Arr , Cost, Locs) :-  
    \+ member(Dep , Locs)  , 
    schedule(Dep , TP , NewCost) ,  %checking the location passed or not passed it and calcualting cost as recursively
    total_cost(TP , Arr , Sum , [Dep | Locs]) , 
    Dep \= Arr,  Cost is (NewCost + Sum).
