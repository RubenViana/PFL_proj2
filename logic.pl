startGame(PlayerWhites, PlayerBlacks) :-
    initialBoard(Board),
    gameLoop(PlayerWhites, PlayerBlacks, Board).

gameLoop(P1, P2, Board) :-
    whitePlayerTurn(Board, NewBoard, P1),
    blackPlayerTurn(NewBoard, NewNewBoard, P2),
    gameLoop(P1, P2, NewNewBoard).


blackPlayerTurn(Board, NewBoard, 'P') :-
    cls,
    printBoard(Board),
    write('\n--------------------- PLAYER X ---------------------\n'),
    write('                   (Black Pieces)                   \n\n'),
    askForPlay('black', Board, Pieces, Move),
    checkMove('black', Board, Move, Pieces, NewBoard).

whitePlayerTurn(Board, NewBoard, 'P') :-
    cls,
    printBoard(Board),
    write('\n--------------------- PLAYER O ---------------------\n'),
    write('                   (White Pieces)                   \n\n'),
    askForPlay('white', Board, Pieces, Move),
    checkMove('white', Board, Move, Pieces, NewBoard).


checkPieceMove('white', 'l', Board, R, C, BoardTmp, V) :-
    NewRow is R - 1,
    (R =< 4 -> NewColumn is C - 1; NewColumn is C), 
    getValueFromMatrix(Board, NewRow, NewColumn, Value),
    (
        Value == empty -> replaceInMatrix(Board, NewRow, NewColumn, 'white', Board1), replaceInMatrix(Board1, R, C, 'empty', BoardTmp), V = 'true'; BoardTmp = Board, V = 'false'
    ).

checkPieceMove('white', 'r', Board, R, C, BoardTmp, V) :-
    NewRow is R - 1,
    (R =< 4 -> NewColumn is C; NewColumn is C + 1),
    getValueFromMatrix(Board, NewRow, NewColumn, Value),
    (
        Value == empty -> replaceInMatrix(Board, NewRow, NewColumn, 'white', Board1), replaceInMatrix(Board1, R, C, 'empty', BoardTmp), V = 'true'; BoardTmp = Board, V = 'false'
    ).

checkPieceMove('black', 'l', Board, R, C, BoardTmp, V) :-
    NewRow is R + 1,
    (R < 4 -> NewColumn is C + 1; NewColumn is C),
    getValueFromMatrix(Board, NewRow, NewColumn, Value),
    (
        Value == empty -> replaceInMatrix(Board, NewRow, NewColumn, 'black', Board1), replaceInMatrix(Board1, R, C, 'empty', BoardTmp), V = 'true'; BoardTmp = Board, V = 'false'
    ).

checkPieceMove('black', 'r', Board, R, C, BoardTmp, V) :-
    NewRow is R + 1,
    (R < 4 -> NewColumn is C; NewColumn is C - 1),
    getValueFromMatrix(Board, NewRow, NewColumn, Value),
    (
        Value == empty -> replaceInMatrix(Board, NewRow, NewColumn, 'black', Board1), replaceInMatrix(Board1, R, C, 'empty', BoardTmp), V = 'true'; BoardTmp = Board, V = 'false'
    ).

checkMove(_Player, Board, _Move, [], NewBoard) :- NewBoard = Board, write('\nPlay Complete!\n').

checkMove(Player, Board, Move, [P|T], NewBoard) :-
    nth0(0, P, R),
    nth0(1, P, C),
    checkPieceMove(Player, Move, Board, R, C, TmpBoard, V),
    (V == 'true' -> checkMove(Player, TmpBoard, Move, T, NewBoard); write('\nInvalid Play!\n'), fail).
