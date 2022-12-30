/*Todos os predicados deste ficheiro analisam o input, relativamente às linhas e colunas inseridas pelo utilizador,
e se as mesmas estão dentro dos limites do tabuleiro. Caso não se satisfaca, pede novamente a informação.*/

manageRow(NewRow) :-
    readRow(Row),
    validateRow(Row, NewRow).

manageColumn(NewColumn) :-
    readColumn(Column),
    validateColumn(Column, NewColumn).

manageMove(NewMove) :-
    readMove(Move),
    validateMove(Move, NewMove).

readMove(Move) :-
    write('  > Move   '),
    read(Move).

validateMove(l, NewMove) :-
    NewMove = 'l'.

validateMove(r, NewMove) :-
    NewMove = 'r'.

validateMove(s, NewMove) :-
    NewMove = 's'.

validateMove(_Move, NewMove) :-
    write('ERROR: That move is not valid!\n\n'),
    readMove(Input),
    validateMove(Input, NewMove).

readRow(Row) :-
    write('  > Row    '),
    read(Row).

readColumn(Column) :-
    write('  > Column '),
    read(Column).

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

validateRow(_Row, NewRow) :-
    write('ERROR: That row is not valid!\n\n'),
    readRow(Input),
    validateRow(Input, NewRow).

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

validateColumn(_Column, NewColumn) :-
    write('ERROR: That column is not valid!\n\n'),
    readColumn(Input),
    validateColumn(Input, NewColumn).

validatePiece(Player, Row, Column, Board, N, R, C, P) :-
    getValueFromMatrix(Board, Row, Column, Value),
    (Value == Player, \+ member([Row, Column], P) -> R is Row, C is Column ; write('\nYou can only select your pieces once!\n'), write('Piece '), write(N), write(' of 3:\n'), manageRow(NewRow), manageColumn(NewColumn), validatePiece(Player, NewRow, NewColumn, Board, N, R, C)).


askForPiece(Player, Board, N, P, NewP) :-
    write('\nPiece '), write(N), write(' of 3:\n'),
    manageRow(NewRow),
    manageColumn(NewColumn),
    validatePiece(Player, NewRow, NewColumn, Board, N, R, C, P),
    append(P, [[R,C]], NewP).

askForMove(Move) :-
    write('\nChoose move (Diagonal Right [r] / Diagonal Left [l] / Reselect Pieces [s]): \n'),
    manageMove(NewMove),
    Move = NewMove.

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





compare_lists(L1, L2, R) :-
    nth0(0, L1, E1),
    nth0(0, L2, E2),
    compare(R, E1, E2).



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