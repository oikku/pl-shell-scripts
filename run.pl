#!/usr/bin/env swipl
:- initialization go.

go :-
    catch(
        run, 
        E, 
        (print_message(error, E), fail)
    ),
    halt(0).
go :- 
    print_message(error, 'Execution failed!!!'),
    halt(1).

run :-
    current_prolog_flag(argv, [File|_]),
    consult(File),
    '__execute'.
