startGame(PlayerWhites, PlayerBlacks) :-
    initialBoard(Board),
    printBoard(Board),
    gameLoop(PlayerWhites, PlayerBlacks, Board).

gameLoop(P1, P2, Board) :-
    whitePlayerTurn(Board, NewBoard, P1),
    blackPlayerTurn(NewBoard, NewNewBoard, P2),
    gameLoop(P1, P2, NewNewBoard).


blackPlayerTurn(Board, NewBoard, 'P') :-
    write('\n------------------ PLAYER X (black pieces) -------------------\n\n'),
    askForPiece('black', Board, 1, R1, C1),
    askForPiece('black', Board, 2, R2, C2),
    askForPiece('black', Board, 3, R3, C3),
    printSelectedPieces(R1, C1, R2, C2, R3, C3),
    askForMove(Move),
    checkMove(Player, Board, Move, R1, C1, R2, C2, R3, C3, NewBoard),
    printBoard(NewBoard).

whitePlayerTurn(Board, NewBoard, 'P') :-
    write('\n------------------ PLAYER O (white pieces) -------------------\n\n'),
    askForPiece('white', Board, 1, R1, C1),
    askForPiece('white', Board, 2, R2, C2),
    askForPiece('white', Board, 3, R3, C3),
    printSelectedPieces(R1, C1, R2, C2, R3, C3),
    askForMove(Move),
    checkMove(Player, Board, Move, R1, C1, R2, C2, R3, C3, NewBoard),
    printBoard(NewBoard).


checkPieceMove('white', 'l', Board, R, C, BoardTmp) :-
    NewRow is R - 1,
    (R =< 4 -> NewColumn is C - 1; NewColumn is C), 
    getValueFromMatrix(Board, NewRow, NewColumn, Value),
    (
        Value == empty -> replaceInMatrix(Board, NewRow, NewColumn, 'white', Board1), replaceInMatrix(Board1, R, C, 'empty', BoardTmp); write('\nERROR: Move is not possible!\n\n'), BoardTmp = Board
    ).

checkPieceMove('white', 'r', Board, R, C, BoardTmp) :-
    NewRow is R - 1,
    (R =< 4 -> NewColumn is C; NewColumn is C + 1),
    getValueFromMatrix(Board, NewRow, NewColumn, Value),
    (
        Value == empty -> replaceInMatrix(Board, NewRow, NewColumn, 'white', Board1), replaceInMatrix(Board1, R, C, 'empty', BoardTmp); write('\nERROR: Move is not possible!\n\n'), BoardTmp = Board
    ).

checkPieceMove('black', 'l', Board, R, C, BoardTmp) :-
    NewRow is R + 1,
    (R =< 4 -> NewColumn is C + 1; NewColumn is C),
    getValueFromMatrix(Board, NewRow, NewColumn, Value),
    (
        Value == empty -> replaceInMatrix(Board, NewRow, NewColumn, 'black', Board1), replaceInMatrix(Board1, R, C, 'empty', BoardTmp); write('\nERROR: Move is not possible!\n\n'), BoardTmp = Board
    ).

checkPieceMove('black', 'r', Board, R, C, BoardTmp) :-
    NewRow is R + 1,
    (R =< 4 -> NewColumn is C; NewColumn is C - 1),
    getValueFromMatrix(Board, NewRow, NewColumn, Value),
    (
        Value == empty -> replaceInMatrix(Board, NewRow, NewColumn, 'black', Board1), replaceInMatrix(Board1, R, C, 'empty', BoardTmp); write('\nERROR: Move is not possible!\n\n'), BoardTmp = Board
    ).

checkMove(Player, Board, Move, R1, C1, R2, C2, R3, C3, NewBoard) :-
    (
        Player == 'white' -> R1 < R2, R2 < R3 -> R_1 is R1, C_1 is C1, R_2 is R2, C_2 is C2, R_3 is R3, C_3 is C3; (R1 > R2, R2 > R3 -> R_1 is R3, C_1 is C3, R_2 is R2, C_2 is C2, R_3 is R1, C_3 is C1; (R2 < R1, R1 < R3 -> R_1 is R2, C_1 is C2, R_2 is R1, C_2 is C1, R_3 is R3, C_3 is C3; (R2 < R3, R3 < R1 -> R_1 is R2, C_1 is C2, R_2 is R3, C_2 is C3, R_3 is R1, C_3 is C1; (R3 < R1, R1 < R2 -> R_1 is R3, C_1 is C3, R_2 is R1, C_2 is C1, R_3 is R2, C_3 is C2; (R1 < R3, R3 < R2 -> R_1 is R1, C_1 is C1, R_2 is R3, C_2 is C3, R_3 is R2, C_3 is C2; fail)))));
        (R1 > R2, R2 > R3 -> R_1 is R1, C_1 is C1, R_2 is R2, C_2 is C2, R_3 is R3, C_3 is C3; (R1 < R2, R2 < R3 -> R_1 is R3, C_1 is C3, R_2 is R2, C_2 is C2, R_3 is R1, C_3 is C1; (R2 > R1, R1 > R3 -> R_1 is R2, C_1 is C2, R_2 is R1, C_2 is C1, R_3 is R3, C_3 is C3; (R2 > R3, R3 > R1 -> R_1 is R2, C_1 is C2, R_2 is R3, C_2 is C3, R_3 is R1, C_3 is C1; (R3 > R1, R1 > R2 -> R_1 is R3, C_1 is C3, R_2 is R1, C_2 is C1, R_3 is R2, C_3 is C2; (R1 > R3, R3 > R2 -> R_1 is R1, C_1 is C1, R_2 is R3, C_2 is C3, R_3 is R2, C_3 is C2; fail))))))
    ),
    
    checkPieceMove(Player, Move, Board, R_1, C_1, Board1),
    checkPieceMove(Player, Move, Board1, R_2, C_2, Board2),
    checkPieceMove(Player, Move, Board2, R_3, C_3, NewBoard).
