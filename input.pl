/*Todos os predicados deste ficheiro analisam o input, relativamente às linhas e colunas inseridas pelo utilizador,
e se as mesmas estão dentro dos limites do tabuleiro. Caso não se satisfaca, pede novamente a informação.*/

manageRow(NewRow) :-
    readRow(Row),
    validateRow(Row, NewRow).

manageColumn(NewColumn) :-
    readColumn(Column),
    validateColumn(Column, NewColumn).

readRow(Row) :-
    write('  > Row    '),
    read(Row).

readColumn(Column) :-
    write('  > Column '),
    read(Column).

validateRow('A', NewRow) :-
    NewRow = 8.

validateRow('B', NewRow) :-
    NewRow = 7.

validateRow('C', NewRow) :-
    NewRow = 6.

validateRow('D', NewRow) :-
    NewRow = 5.

validateRow('E', NewRow) :-
    NewRow = 4.

validateRow('F', NewRow) :-
    NewRow = 3.

validateRow('G', NewRow) :-
    NewRow = 2.

validateRow('H', NewRow) :-
    NewRow = 1.

validateRow('I', NewRow) :-
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

validatePiece(Player, Row, Column, Board) :-
    getValueFromMatrix(Board, Row, Column, Value),
    write(Player),
    write(' -- '),
    write(Value),nl.

askForPiece(Player, Board) :-
    write('Piece 1 of 3:\n'),
    manageRow(NewRow),
    manageColumn(NewColumn),
    getValueFromMatrix(Board, NewRow, NewColumn, Value),
    write(Value),nl.

%esta com erros a ler os inputs da Row e da Column !!



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