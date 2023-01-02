/*Começo do jogo e iniciação do loop.*/
startGame(PlayerWhites, PlayerBlacks) :-
    initialBoard(Board),
    gameLoop(PlayerWhites, PlayerBlacks, Board).

/*Loop do jogo.*/
gameLoop(P1, P2, Board) :-
    whitePlayerTurn(Board, NewBoard, P1),
    (
        (checkVictory('white', NewBoard), write('\nThanks for playing!\n'), printBoard(NewBoard));
        (checkVictoryEmpty('black', NewBoard), write('\nThanks for playing 1!\n'), printBoard(NewBoard));
        (blackPlayerTurn(NewBoard, NewNewBoard, P2),
            (
                (checkVictory('black', NewNewBoard), write('\nThanks for playing!\n'), printBoard(NewNewBoard));
                (checkVictoryEmpty('white', NewNewBoard), write('\nThanks for playing 1!\n'), printBoard(NewNewBoard));
                (gameLoop(P1, P2, NewNewBoard))
            )
        )
    ).    

/*Turno das peças brancas.*/
blackPlayerTurn(Board, NewBoard, 'P') :-
    cls,
    printBoard(Board),
    write('\n--------------------- PLAYER X ---------------------\n'),
    write('                   (Black Pieces)                   \n\n'),
    askForPlay('black', Board, Pieces, Move),
    checkMove('black', Board, Move, Pieces, NewBoard).

/*Turno das peças pretas.*/
whitePlayerTurn(Board, NewBoard, 'P') :-
    cls,
    printBoard(Board),
    write('\n--------------------- PLAYER O ---------------------\n'),
    write('                   (White Pieces)                   \n\n'),
    askForPlay('white', Board, Pieces, Move),
    checkMove('white', Board, Move, Pieces, NewBoard).

/*Visualizar se exitem movimentos das peças brancas possíveis.*/

/*Visualizar se exitem movimentos das peças pretas possíveis.*/

/*Visualizar se exitem peças brancas na board.*/  
checkVictoryEmpty('white', Board) :-
    memberArray('white', Board) == false, write('\nBlack Pieces won!\n').

/*Visualizar se exitem peças pretas na board.*/    
checkVictoryEmpty('black', Board) :-
    memberArray('black', Board) == false, write('\nWhite Pieces won!\n').

/*Visualizar depois do turno das peças brancas se existe alguma peça branca na linha I.*/ 
checkVictory('white', [H|T]) :-
    line_member('white', H), write('\nWhite Pieces won!\n').

/*Visualizar depois do turno das peças pretas se existe alguma peça preta na linha A.*/
checkVictory('black', [H|T]) :- 
    T == [] -> line_member('black', H); checkVictory('black', T), write('\nBlack Pieces won!\n').

/*Função que verifica se determinado elemento está presente na linha*/
line_member(X,[X|_]).
line_member(X,[_|TAIL]) :- line_member(X,TAIL).

/*Função que verifica se determinado elemento está presente no array*/
memberArray(X, Y) :- line_member(X, Y).
memberArray(X, [Y|Ys]) :- memberArray(X, Ys).

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
