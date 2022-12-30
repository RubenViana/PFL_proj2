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


toLetter(8, S) :- S = 'A'.
toLetter(7, S) :- S = 'B'.
toLetter(6, S) :- S = 'C'.
toLetter(5, S) :- S = 'D'.
toLetter(4, S) :- S = 'E'.
toLetter(3, S) :- S = 'F'.
toLetter(2, S) :- S = 'G'.
toLetter(1, S) :- S = 'H'.
toLetter(0, S) :- S = 'I'.

printSelectedPieces(Pieces) :-
    write('             '),
    (foreach( X, Pieces) do nth0(0, X, R), nth0(1, X, C), toLetter(R, S), write('  <'), write(S), write('-'), Cc is C + 1, write(Cc), write('>  ')),
    write('\n\n').

cls :- write('\33\[2J').

printPlayerTurn('white', Pieces, Board) :-
    cls,
    printBoard(Board),
    write('\n--------------------- PLAYER O ---------------------\n'),
    write('                   (White Pieces)                   \n\n'),
    printSelectedPieces(Pieces).

    
printPlayerTurn('black', Pieces, Board) :-
    cls,
    printBoard(Board),
    write('\n--------------------- PLAYER X ---------------------\n'),
    write('                   (Black Pieces)                   \n\n'),
    printSelectedPieces(Pieces).