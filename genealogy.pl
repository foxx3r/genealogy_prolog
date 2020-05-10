man(andre).
man(gabriel).
man(bernardo).
man(nicolas).
man(odeval).
man(joab).
man(ivan).

woman(livia).
woman(alicia).
woman(cris).
woman(nicole).
woman(sophia).
woman(alanis).
woman(isabele).
woman(raquel).
woman(joseli).
woman(giovanna).
woman(brenda).
woman(marielle).
woman(fatima).

father(andre, gabriel).
father(andre, nicolas).
father(andre, bernardo).
father(andre, livia).
father(andre, alicia).
father(odeval, andre).
father(odeval, joab).
father(odeval, raquel).
father(ivan, nicole).
father(ivan, sophia).
father(ivan, isabele).
father(ivan, alanis).
father(joab, giovanna).
father(joab, brenda).

mother(cris, gabriel).
mother(cris, nicolas).
mother(cris, bernardo).
mother(cris, livia).
mother(cris, alicia).
mother(fatima, andre).
mother(fatima, joab).
mother(fatima, raquel).
mother(joseli, cris).
mother(raquel, nicole).
mother(raquel, sophia).
mother(raquel, isabele).
mother(raquel, alanis).
mother(marielle, giovanna).
mother(marielle, brenda).

brother(X, Y) :- father(P, X), father(P, Y), X \= Y, man(X).
brother(X, Y) :- mother(M, X), mother(M, Y), X \= Y, man(X).

sister(X, Y) :- father(P, X), father(P, Y), X \= Y, woman(X).
sister(X, Y) :- mother(M, X), mother(M, Y), X \= Y, woman(X).

sibling(X, Y) :- father(P, X), father(P, Y), X \= Y.
sibling(X, Y) :- mother(M, X), mother(M, Y), X \= Y.

son(X, Y) :- father(Y, X), man(X).
son(X, Y) :- mother(Y, X), man(X).

daughter(X, Y) :- father(Y, X), woman(X).
daughter(X, Y) :- mother(Y, X), woman(X).

uncle(X, Y) :- brother(X, P), father(P, Y), man(X).
uncle(X, Y) :- brother(X, M), mother(M, Y), man(X).

aunt(X, Y) :- sister(X, P), father(P, Y), woman(X).
aunt(X, Y) :- sister(X, M), mother(M, Y), woman(X).

nephew(X, Y) :- uncle(Y, X), man(X).
nephew(X, Y) :- aunt(Y, X), man(X).

niece(X, Y) :- uncle(Y, X), woman(X).
niece(X, Y) :- aunt(Y, X), woman(X).

grandfather(X, Y) :- father(P, Y), father(X, P), man(X).
grandfather(X, Y) :- mother(M, Y), father(X, M), man(X).

grandmother(X, Y) :- father(P, Y), mother(X, P), woman(X).
grandmother(X, Y) :- mother(M, Y), mother(X, M), woman(X).

grandson(X, Y) :- grandfather(Y, X), man(X).
grandson(X, Y) :- grandmother(Y, X), man(X).

granddaughter(X, Y) :- grandfather(Y, X), woman(X).
granddaughter(X, Y) :- grandmother(Y, X), woman(X).

cousin(X, Y) :- father(P, X), father(SP, Y), sibling(SP, P).
