:- consult('menu.pl').
:- consult('display.pl').
:- consult('logic.pl').
:- consult('input.pl').
:- consult('bot.pl').
:- use_module(library(random)).
:- use_module(library(system)).
:- use_module(library(lists)).

play :-
    mainMenu.
