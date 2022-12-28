startGame(PlayerWhites, PlayerBlacks) :-
    initialBoard(Board),
    printBoard(Board),
    gameLoop(PlayerWhites, PlayerBlacks, Board).

gameLoop(P1, P2, Board) :-
    whitePlayerTurn(Board, NewBoard, P1),
    blackPlayerTurn(Board, NewNewBoard, P2),
    gameLoop(P1, P2, Board).


blackPlayerTurn(Board, NewBoard, 'P') :-
    write('\n------------------ PLAYER X (black pieces) -------------------\n\n'),
    askForPiece('black', Board).
    %printBoard(NewBoard).

whitePlayerTurn(Board, NewBoard, 'P') :-
    write('\n------------------ PLAYER O (white pieces) -------------------\n\n'),
    askForPiece('white', Board).
    %printBoard(NewBoard).