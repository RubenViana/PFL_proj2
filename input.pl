/*Função que lê a linha e a valida.*/
manageRow(NewRow) :-
    readRow(Row),
    validateRow(Row, NewRow).

/*Função que lê a coluna e a valida.*/
manageColumn(NewColumn) :-
    readColumn(Column),
    validateColumn(Column, NewColumn).

/*Função que lê o movimento e o valida.*/
manageMove(NewMove) :-
    readMove(Move),
    validateMove(Move, NewMove).

/*Leitura do movimento*/
readMove(Move) :-
    write('  > Move   '),
    read(Move).

/*Validação dos movimentos que exitem.*/
validateMove(l, NewMove) :-
    NewMove = 'l'.

validateMove(r, NewMove) :-
    NewMove = 'r'.

validateMove(s, NewMove) :-
    NewMove = 's'.

/*Em caso de o movimento não ser válido é questionado novamente.*/
validateMove(_Move, NewMove) :-
    write('ERROR: That move is not valid! Try again!\n\n'),
    readMove(Input),
    validateMove(Input, NewMove).

/*Leitura da linha.*/
readRow(Row) :-
    write('  > Row    '),
    read(Row).

/*Leitura da coluna.*/
readColumn(Column) :-
    write('  > Column '),
    read(Column).

/*Validação das linhas que o tabuleiro tem.*/
validateRow(a, NewRow) :-
    NewRow = 8.

validateRow(b, NewRow) :-
    NewRow = 7.

validateRow(c, NewRow) :-
    NewRow = 6.

validateRow(d, NewRow) :-
    NewRow = 5.

validateRow(e, NewRow) :-
    NewRow = 4.

validateRow(f, NewRow) :-
    NewRow = 3.

validateRow(g, NewRow) :-
    NewRow = 2.

validateRow(h, NewRow) :-
    NewRow = 1.

validateRow(i, NewRow) :-
    NewRow = 0.

/*Em caso da linha não ser válida é questionado novamente.*/
validateRow(_Row, NewRow) :-
    write('ERROR: That row is not valid! Try again!\n\n'),
    readRow(Input),
    validateRow(Input, NewRow).

/*Validação das colunas que o tabuleiro tem*/
validateColumn(1, NewColumn) :-
    NewColumn = 0.

validateColumn(2, NewColumn) :-
    NewColumn = 1.

validateColumn(3, NewColumn) :-
    NewColumn = 2.

validateColumn(4, NewColumn) :-
    NewColumn = 3.

validateColumn(5, NewColumn) :-
    NewColumn = 4.

validateColumn(6, NewColumn) :-
    NewColumn = 5.

validateColumn(7, NewColumn) :-
    NewColumn = 6.

validateColumn(8, NewColumn) :-
    NewColumn = 7.

validateColumn(9, NewColumn) :-
    NewColumn = 8.

/*Em caso da colina não ser válida é questionado novamente.*/
validateColumn(_Column, NewColumn) :-
    write('ERROR: That column is not valid! Try again!\n\n'),
    readColumn(Input),
    validateColumn(Input, NewColumn).


/*Validação da peça.*/
validatePiece(Player, Row, Column, Board, N, R, C, P) :-
    getValueFromMatrix(Board, Row, Column, Value),
    (Value == Player, \+ member([Row, Column], P) -> R is Row, C is Column ; write('\nYou can only select your pieces once!\n'), write('Piece '), write(N), write(' of 3:\n'), manageRow(NewRow), manageColumn(NewColumn), validatePiece(Player, NewRow, NewColumn, Board, N, R, C, P)).

/*Pedido de seleção de uma peça.*/
askForPiece(Player, Board, N, P, NewP) :-
    write('\nPiece '), write(N), write(' of 3:\n'),
    manageRow(NewRow),
    manageColumn(NewColumn),
    validatePiece(Player, NewRow, NewColumn, Board, N, R, C, P),
    append(P, [[R,C]], NewP).

/*Pedido de movimento*/
askForMove(Move) :-
    write('\nChoose move (Diagonal Right [r] / Diagonal Left [l] / Reselect Pieces [s]): \n'),
    manageMove(NewMove),
    Move = NewMove.

/*Pedido de jogada.*/
askForPlay(Player, Board, Pieces, Move) :-
    printPlayerTurn(Player, P, Board),
    askForPiece(Player, Board, 1, P, P1),
    printPlayerTurn(Player, P1, Board),
    askForPiece(Player, Board, 2, P1, P2),
    printPlayerTurn(Player, P2, Board),
    askForPiece(Player, Board, 3, P2, P3),
    printPlayerTurn(Player, P3, Board),
    askForMove(M),
    (M == 's' -> askForPlay(Player, Board, Pieces, Move);
        Move = M,
        sort(P3, SortedPieces),
        (Player == 'black' -> reverse(SortedPieces, Pieces); Pieces = SortedPieces)
    ).




/*Comparação entre duas listas.*/
compare_lists(L1, L2, R) :-
    nth0(0, L1, E1),
    nth0(0, L2, E2),
    compare(R, E1, E2).


/*Substituição na lista pelo valor dado (peça ou não peça) em determinada posição*/
replaceInList([_H|T], 0, Value, [Value|T]).
replaceInList([H|T], Index, Value, [H|TNew]) :-
        Index > 0,
        Index1 is Index - 1,
        replaceInList(T, Index1, Value, TNew).

replaceInMatrix([H|T], 0, Column,Value, [HNew|T]) :-
        replaceInList(H, Column, Value, HNew).

replaceInMatrix([H|T], Row, Column, Value, [H|TNew]) :-
        Row > 0,
        Row1 is Row - 1,
        replaceInMatrix(T, Row1, Column, Value, TNew).

/*Obtenção do valor dado (peça ou não peça) do tabuleiro em determinada posição.*/
getValueFromList([H|_T], 0, Value) :-
        Value = H.

getValueFromList([_H|T], Index, Value) :-
        Index > 0,
        Index1 is Index - 1,
        getValueFromList(T, Index1, Value).

getValueFromMatrix([H|_T], 0, Column, Value) :-
        getValueFromList(H, Column, Value).

getValueFromMatrix([_H|T], Row, Column, Value) :-
        Row > 0,
        Row1 is Row - 1,
        getValueFromMatrix(T, Row1, Column, Value).