% To run the tests, first load the module related to this one ;
% next, run load_test_files(something_including_something_unrelated_to_the_module).
:- use_module(hebrew).
:- begin_tests(hebrew).
test(transliterate_word, [true(A==[א, ב, ג, ד, ה, ו, ז, ח])]) :-
    transliterate_word(['A', b, g, d, h, w, z, x], A, []).
test(transliterate_word, [true(A==[פ, צ, ק, ר, שׁ, שׂ, ת])]) :-
    transliterate_word([p, 'Z', q, r, c, 'C', t], A, []).
test(transliterate_word, [true(A==[ט, י, כ, ל, מ, נ, ס, ע])]) :-
    transliterate_word(['T', y, k, l, m, n, s, 'H'], A, []).

test(final_letters, [true(A==[מ, ם])]) :-
    transliterate_word([m, m], A, []).
test(final_letters, [true(A==[נ, ן])]) :-
    transliterate_word([n, n], A, []).
test(final_letters, [true(A==[כ, ך])]) :-
    transliterate_word([k, k], A, []).
test(final_letters, [true(A==[פ, ף])]) :-
    transliterate_word([p, p], A, []).
test(final_letters, [true(A==[צ, ץ])]) :-
    transliterate_word(['Z', 'Z'], A, []).

test(diacritics, [true(A==[פ, 'ּ', פ, 'ַ', פ, 'ָ', פ, 'ֻ', פ, 'ֶ', פ, 'ֵ', פ, 'ִ', פ, 'ֹ', פ, 'ֱ', פ, 'ֳ', פ, 'ֲ', פ, 'ְ', פ, 'ְ', '֫'])]) :-
    transliterate_word([p, '.', p, a, p, à, p, u, p, è, p, é, p, i, p, o, p, ê, p, ä, p, â, p, e, p, e, 'V'],
                       A,
                       []).


:- end_tests(hebrew).
