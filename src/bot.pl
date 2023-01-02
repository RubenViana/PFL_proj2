/*Criação de jogada para os diferentes números de pedras que o Computador tiver (>=3, 2 ou 1 pedras).*/
generatePlay(Player, 3, Board, Pieces, Move) :-
    printPlayerTurn(Player, P, Board),
    generatePiece(Player, Board, P, P1),
    printPlayerTurn(Player, P1, Board),
    generatePiece(Player, Board, P1, P2),
    printPlayerTurn(Player, P2, Board),
    generatePiece(Player, Board, P2, P3),
    printPlayerTurn(Player, P3, Board),
    random(0, 1, RandomMove),
    (RandomMove == 0, Move = 'r'; Move = 'l'),
    sort(P3, SortedPieces),
    (Player == 'black' -> reverse(SortedPieces, Pieces); Pieces = SortedPieces).

generatePlay(Player, 2, Board, Pieces, Move) :-
    printPlayerTurn(Player, P, Board),
    generatePiece(Player, Board, P, P1),
    printPlayerTurn(Player, P1, Board),
    generatePiece(Player, Board, P1, P2),
    printPlayerTurn(Player, P2, Board),
    random(0, 1, RandomMove),
    (RandomMove == 0, Move = 'r'; Move = 'l'),
    sort(P2, SortedPieces),
    (Player == 'black' -> reverse(SortedPieces, Pieces); Pieces = SortedPieces).

generatePlay(Player, 1, Board, Pieces, Move) :-
    printPlayerTurn(Player, P, Board),
    generatePiece(Player, Board, P, P1),
    printPlayerTurn(Player, P1, Board),
    random(0, 1, RandomMove),
    (RandomMove == 0, Move = 'r'; Move = 'l'),
    sort(P1, SortedPieces),
    (Player == 'black' -> reverse(SortedPieces, Pieces); Pieces = SortedPieces).

/*Validação da pedra do Computador.*/
validateBotPiece(Player, Row, Column, Board, P) :-
    getValueFromMatrix(Board, Row, Column, Value),
    (Value == Player, \+ member([Row, Column], P)).

/*Criar uma pedra Random.*/
generatePiece(Player, Board, P, NewP) :-
    repeat,
        random(0, 9, RandomRow),
        R is RandomRow,
        random(0, 9, RandomColumn),
        C is RandomColumn,
        validateBotPiece(Player, R, C, Board, P),
        append(P, [[R,C]], NewP), !.
