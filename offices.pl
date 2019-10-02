%ChristianMarquardt%
%CSCI305_Prolog%

offices([office(hunter, _), office(jack, _), office(jim, _), office(sally, _), office(laura, _)]).

layout(X) :- offices(X),
             member(office(A, 1), X), A \= sally, A \= jim, A \= laura,
             member(office(B, 2), X), 
             member(office(C, 3), X), C \= jack, C \= laura, C \=jim,
	     member(office(D, 4), X), 
             member(office(E, 5), X), E \= hunter, E \= jim, E \= laura, ( E = sally -> B = laura ).
