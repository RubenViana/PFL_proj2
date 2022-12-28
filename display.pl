initialBoard([
                [black,black,black,black,black],
            [empty,black,black,black,black,empty],
        [empty,empty,black,black,black,empty,empty],
    [empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty],
    [empty,empty,empty,empty,empty,empty,empty,empty],
        [empty,empty,white,white,white,empty,empty],
            [empty,white,white,white,white,empty],
                [white,white,white,white,white]
]).

symbol(empty,S) :- S=' '.
symbol(black,S) :- S='X'.
symbol(white,S) :- S='O'.

letter(1, L) :- L='            I'.
letter(2, L) :- L='          H'.
letter(3, L) :- L='        G'.
letter(4, L) :- L='      F'.
letter(5, L) :- L='    E'.
letter(6, L) :- L='      D'.
letter(7, L) :- L='        C'.
letter(8, L) :- L='          B'.
letter(9, L) :- L='            A'.


printBoard(X) :-
    nl,
    write('                  1   2   3   4   5  \n'),
    write('                / \\ / \\ / \\ / \\ / \\\n'),
    printMatrix(X, 1),
    write('                  1   2   3   4   5  \n').

printMatrix([], 10).

printMatrix([Head|Tail], N) :-
    letter(N, L),
    write(' '),
    write(L),
    N1 is N + 1,
    write(' | '),
    printLine(Head),
    printSep(N),
    printMatrix(Tail, N1).

printLine([]).

printLine([Head|Tail]) :-
    symbol(Head, S),
    write(S),
    write(' | '),
    printLine(Tail).
 
printSep(1) :- write('\n              / \\ / \\ / \\ / \\ / \\ / \\ 6\n').
printSep(2) :- write('\n            / \\ / \\ / \\ / \\ / \\ / \\ / \\ 7\n').
printSep(3) :- write('\n          / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ 8\n').
printSep(4) :- write('\n        / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ 9\n').
printSep(5) :- write('\n        \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / 9\n').
printSep(6) :- write('\n          \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / 8\n').
printSep(7) :- write('\n            \\ / \\ / \\ / \\ / \\ / \\ / \\ / 7\n').
printSep(8) :- write('\n              \\ / \\ / \\ / \\ / \\ / \\ / 6\n').
printSep(9) :- write('\n                \\ / \\ / \\ / \\ / \\ /\n').


printSelectedPieces(R1, C1, R2, C2, R3, C3) :-
    write('> Selected Pieces:\n'),
    write('Piece 1: '), write(R1), write('-'), write(C1),nl,
    write('Piece 2: '), write(R2), write('-'), write(C2),nl,
    write('Piece 3: '), write(R3), write('-'), write(C3),nl.
