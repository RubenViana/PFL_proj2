/*Carregar o que é preciso para o jogo funcionar.*/
:- consult('menu.pl').
:- consult('display.pl').
:- consult('logic.pl').
:- consult('input.pl').
:- consult('bot.pl').
:- use_module(library(random)).
:- use_module(library(system)).
:- use_module(library(lists)).

/*Iniciação do jogo geral e chamada do menu principal*/
play :-
    mainMenu.
