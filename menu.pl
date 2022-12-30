mainMenu :-
    cls,
    printMainMenu,
    askMenuOption,
    read(Input),
    manageInput(Input).

manageInput(1) :-
    startGame('P','P'),
    mainMenu.

manageInput(2) :-
    startGame('P','C'),
    mainMenu.

manageInput(3) :-
    startGame('C','C'),
    mainMenu.

manageInput(0) :-
    write('\nExiting...\n\n').

manageInput(_Other) :-
    write('\nERROR: that option does not exist.\n\n'),
    askMenuOption,
    read(Input),
    manageInput(Input).
                     


printMainMenu :-
    nl,nl,
    write(' _______________________________________________________________________ '),nl,
    write('|                                                                       |'),nl,
    write('|                                                                       |'),nl,
    write('|                  _______                                              |'),nl,
    write('|                 |__   __|                                             |'),nl,
    write('|                    | | __ _  __ _  ___ ___   ___ __ _                 |'),nl,
    write('|                    | |/ _` |/ _` |/ __/ _ \\ / __/ _` |                |'),nl,
    write('|                    | | (_| | (_| | (_| (_) | (_| (_| |                |'),nl,
    write('|                    |_|\\__,_|\\__,_|\\___\\___/ \\___\\__,_|                |'),nl,
    write('|                                                                       |'),nl,
    write('|               ---------------------------------------------           |'),nl,
    write('|                                                                       |'),nl,
    write('|                                                                       |'),nl,
    write('|                          1. Player vs Player                          |'),nl,
    write('|                                                                       |'),nl,
    write('|                          2. Player vs Computer                        |'),nl,
    write('|                                                                       |'),nl,
	write('|                          3. Computer vs Computer                      |'),nl,
    write('|                                                                       |'),nl,
    write('|                          0. Exit                                      |'),nl,
    write('|                                                                       |'),nl,
    write('|                                                                       |'),nl,
    write('|_______________________________________________________________________|'),nl,nl,nl.

askMenuOption :-
    write('> Insert your option ').