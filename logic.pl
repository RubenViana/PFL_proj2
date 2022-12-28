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
    askForPiece('black', Board, 1, R1, C1),
    askForPiece('black', Board, 2, R2, C2),
    askForPiece('black', Board, 3, R3, C3),
    %printSelectedPieces(R1, C1, R2, C2, R3, C3),
    printBoard(Board).

whitePlayerTurn(Board, NewBoard, 'P') :-
    write('\n------------------ PLAYER O (white pieces) -------------------\n\n'),
    askForPiece('white', Board, 1, R1, C1),
    askForPiece('white', Board, 2, R2, C2),
    askForPiece('white', Board, 3, R3, C3),
    %printSelectedPieces(R1, C1, R2, C2, R3, C3),
    printBoard(Board).