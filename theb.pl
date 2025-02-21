#!/usr/bin/env swipl

:- initialization(main, main).  % This ensures main is called on startup
:- [hebrew].

main :-
    current_prolog_flag(argv, Args),
    process_args(Args).

process_args([Help]) :-
    (Help = '-h' ; Help = '--help'),
    write("Enter a list of hebrew words in latin characters to transliterate them in hebrew."), nl,
    write("Please consult hebrew.pl to see how characters are transliterated."), nl.
process_args(Args) :-
    %write('Words received: '), write(Args), nl,
    transliterate_args(Args).

transliterate_args([]) :- nl.
transliterate_args([H | T]) :-
    atom_chars(H, Chars),
    s(Chars, R), 
    write(R), write(" "),
    transliterate_args(T).
