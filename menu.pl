/*função que dá print ao menu principal e questiona pela modo de jogo. */
mainMenu :-
    cls,
    printMainMenu,
    askMenuOption,
    read(Input),
    manageInput(Input).

/*Caso o input seja 1 ativa-se o modo de jogo jogador contra jogador.*/
manageInput(1) :-
    startGame('P','P'),
    mainMenu.

/*Caso o input seja 2 ativa-se o modo de jogo jogador contra computador.*/
manageInput(2) :-
    startGame('P','C'),
    mainMenu.

/*Caso o input seja 3 ativa-se o modo de jogo computador contra computador.*/
manageInput(3) :-
    startGame('C','C'),
    mainMenu.

/*Caso o input seja 0 sai-se do jogo.*/
manageInput(0) :-
    write('\nExiting...\n\n').

/*Caso o input não seja nenhum dos anteriores pede-se um novo input.*/
manageInput(_Other) :-
    write('\nERROR: that option does not exist.\n\n'),
    askMenuOption,
    read(Input),
    manageInput(Input).
                     

/*Função que mostra o que vai ser representado como menu principal.*/
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

/*Função que questiona a opção a escolher do menu principal.*/
askMenuOption :-
    write('> Insert your option ').