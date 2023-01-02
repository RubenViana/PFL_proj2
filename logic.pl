/*Começo do jogo e iniciação do loop.*/
startGame(PlayerWhites, PlayerBlacks) :-
    initialBoard(Board),
    gameLoop(PlayerWhites, PlayerBlacks, Board).

/*Loop do jogo.*/
gameLoop(P1, P2, Board) :-
    whitePlayerTurn(Board, NewBoard, P1),
    (
        (checkVictory('white', NewBoard), write('\nThanks for playing!\n'), printWhiteWin(NewBoard));
        (checkVictoryEmpty('black', NewBoard), write('\nWhite Wins!\n'), printWhiteWin(NewBoard));
        (blackPlayerTurn(NewBoard, NewNewBoard, P2),
            (
                (checkVictory('black', NewNewBoard), write('\nThanks for playing!\n'), printBlackWin(NewNewBoard));
                (checkVictoryEmpty('white', NewNewBoard), write('\nBlack Wins!\n'), printBlackWin(NewNewBoard));
                (gameLoop(P1, P2, NewNewBoard))
            )
        )
    ).    

/*Turno das peças pretas.*/
blackPlayerTurn(Board, NewBoard, 'P') :-
    getNumberOfPieces('black', Board, 0, NP),
    (NP >= 3 -> NPieces = 3; NPieces = NP),
    askForPlay('black', NPieces, Board, Pieces, Move),
    checkMove('black', Board, Move, Pieces, NewBoard).

blackPlayerTurn(Board, NewBoard, 'C') :-
    getNumberOfPieces('black', Board, 0, NP),
    (NP >= 3 -> NPieces = 3; NPieces = NP),
    repeat,
        generatePlay('black', NPieces, Board, Pieces, Move),
        checkMove('black', Board, Move, Pieces, NewBoard), !.

/*Turno das peças brancas.*/
whitePlayerTurn(Board, NewBoard, 'P') :-
    getNumberOfPieces('white', Board, 0, NP),
    (NP >= 3 -> NPieces = 3; NPieces = NP),
    askForPlay('white', NPieces, Board, Pieces, Move),
    checkMove('white', Board, Move, Pieces, NewBoard).

whitePlayerTurn(Board, NewBoard, 'C') :-
    getNumberOfPieces('white', Board, 0, NP),
    (NP >= 3 -> NPieces = 3; NPieces = NP),
    repeat,
        generatePlay('white', NPieces, Board, Pieces, Move),
        checkMove('white', Board, Move, Pieces, NewBoard), !.

/*Visualizar se exitem movimentos das peças brancas possíveis.*/

/*Visualizar se exitem movimentos das peças pretas possíveis.*/

/*Visualizar se exitem peças brancas ou pretas na board.*/  
checkVictoryEmpty(Player, Board) :-
    getNumberOfPieces(Player, Board, 0, NP),
    NP == 0.

/*Visualizar depois do turno das peças brancas se existe alguma peça branca na linha I.*/ 
checkVictory('white', [H|_T]) :-
    line_member('white', H), write('\nWhite Pieces won!\n').

/*Visualizar depois do turno das peças pretas se existe alguma peça preta na linha A.*/
checkVictory('black', B) :-
    nth0(8, B, L),
    line_member('black', L), write('\nBlack Pieces won!\n').

/*Função que verifica se determinado elemento está presente na linha*/
line_member(X,[X|_]).
line_member(X,[_|TAIL]) :- line_member(X,TAIL).

/*Validação ou não validação do movimento da peça branca e execução deste.*/
checkPieceMove('white', 'l', Board, R, C, BoardTmp, V) :-
    NewRow is R - 1,
    (R =< 4 -> NewColumn is C - 1; NewColumn is C), 
    getValueFromMatrix(Board, NewRow, NewColumn, Value),
    (
        Value \= 'white' -> replaceInMatrix(Board, NewRow, NewColumn, 'white', Board1), replaceInMatrix(Board1, R, C, 'empty', BoardTmp), V = 'true'; BoardTmp = Board, V = 'false'
    ).

checkPieceMove('white', 'r', Board, R, C, BoardTmp, V) :-
    NewRow is R - 1,
    (R =< 4 -> NewColumn is C; NewColumn is C + 1),
    getValueFromMatrix(Board, NewRow, NewColumn, Value),
    (
        Value \= 'white' -> replaceInMatrix(Board, NewRow, NewColumn, 'white', Board1), replaceInMatrix(Board1, R, C, 'empty', BoardTmp), V = 'true'; BoardTmp = Board, V = 'false'
    ).

/*Validação ou não validação do movimento da peça preta e execução deste.*/
checkPieceMove('black', 'l', Board, R, C, BoardTmp, V) :-
    NewRow is R + 1,
    (R < 4 -> NewColumn is C + 1; NewColumn is C),
    getValueFromMatrix(Board, NewRow, NewColumn, Value),
    (
        Value \= 'black' -> replaceInMatrix(Board, NewRow, NewColumn, 'black', Board1), replaceInMatrix(Board1, R, C, 'empty', BoardTmp), V = 'true'; BoardTmp = Board, V = 'false'
    ).

checkPieceMove('black', 'r', Board, R, C, BoardTmp, V) :-
    NewRow is R + 1,
    (R < 4 -> NewColumn is C; NewColumn is C - 1),
    getValueFromMatrix(Board, NewRow, NewColumn, Value),
    (
        Value \= 'black' -> replaceInMatrix(Board, NewRow, NewColumn, 'black', Board1), replaceInMatrix(Board1, R, C, 'empty', BoardTmp), V = 'true'; BoardTmp = Board, V = 'false'
    ).

/*Validação ou não validação do movimento e execução da jogada.*/
checkMove(_Player, Board, _Move, [], NewBoard) :- NewBoard = Board, write('\nPlay Complete!\n').

checkMove(Player, Board, Move, [P|T], NewBoard) :-
    nth0(0, P, R),
    nth0(1, P, C),
    checkPieceMove(Player, Move, Board, R, C, TmpBoard, V),
    (V == 'true' -> checkMove(Player, TmpBoard, Move, T, NewBoard); write('\nInvalid Play!\n'), fail).
