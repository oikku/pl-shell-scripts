:- use_module(library(http/json)).

read_json_to_dict('-', Output) :-
    json_read_dict(user_input, Output).
read_json_to_dict(File, Output) :-
    \+ File = '-',
    open(File, read, Out),
    json_read_dict(Out, Output),
    close(Out).

flatten_key_path(Dict, [Key|Child]) :-
    is_dict(Dict),
    Value = Dict.Key,
    flatten_key_path(Value, Child).
flatten_key_path(Dict, []) :-
    \+ is_dict(Dict).

execute :-
    current_prolog_flag(argv, [_, File]),
    read_json_to_dict(File, Json),
    !,
    findall(R, (
            flatten_key_path(Json, Path),
            atomics_to_string(Path, '.', R)
        ), Rs),
    lists:sort(Rs, Sorted),
    forall(member(M, Sorted), (write(M), nl)).
