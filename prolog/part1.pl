% courses :cse101,cse102,cse241,cse241,cse341,cse343
% classroms : Z06,Z10,Z23
% instructors : YG,HK,YSA,MG
% students : s1,s2,s3 ...
% they are all from GTU

room(z06). 
room(z10). 
room(z23).

capacity(z06,50).
capacity(z10,70).
capacity(z23,90).

capacity(cse101,80).
capacity(cse102,70).
capacity(cse241,60).
capacity(cse341,40).
capacity(cse343,50).

classrom(cse101,z06). %cse101 is in z06
classrom(cse102,z10).
classrom(cse241,z23).
classrom(cse341,z06).
classrom(cse343,z23).


time(cse101,8).
time(cse102,13).
time(cse241,11).
time(cse341,10).
time(cse343,11).

needs(cse101,projector).
needs(cse102,smart_board).
needs(cse241,smart_board).
needs(cse241,projector).
needs(cse341,projector).

needs(yg,projector).
needs(ysa,smart_board).
needs(mg,projector).
needs(mg,smart_board).

has(z23,projector).
has(z23,smart_board).
has(z06,projector).
has(z10,smart_board).

isLecturerOf(yg,cse102).
isLecturerOf(yg,cse341).
isLecturerOf(ysa,cse241).
isLecturerOf(mg,cse101).
isLecturerOf(hk,cse343).

handicapped(student2).
handicapped(student4).
handicapped(student15).

handicapFriendly(z06). % z06 is handicap firiendly class 

conflict(X,Y):- %X and Y are courses
    X\=Y,
    (classrom(X,A),classrom(Y,A),
    time(X,B), time(Y,B)).

assignRoom(C,R):-
    room(R),
    capacity(C, A), capacity(R, B), A=<B, %if the space in room is sufficient for the course
    forall(needs(C, X), has(R, X)), %a room might need an item
    isLecturerOf(I,C),
    forall(needs(I,X), has(R, X)). %instructor might need an item

enroll(S,C):-
    \+ (handicapped(S));(handicapped(S),classrom(C,X),handicapFriendly(X)).