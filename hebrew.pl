% This program helps the user to transliterate 
% from french to hebrew
% Please note that this transliteration is not standard
% but suits my own use

:- module(hebrew, [
                transliterate_word/3,
                s/2
                ]).

% Define transliteration rules
% Please do not forget to use ' ' instead of " " or ` `
transliterate('A') --> [א],!.      % Aleph
transliterate(b) --> [ב],!.        % Bet
transliterate(g) --> [ג],!.        % Gimel
transliterate(d) --> [ד],!.        % Dalet
transliterate(h) --> [ה],!.        % He
transliterate(w) --> [ו],!.        % Vav
transliterate(z) --> [ז],!.        % Zayin
transliterate(x) --> [ח],!.        % Het
transliterate('T') --> [ט],!.      % Tet
transliterate(y) --> [י],!.        % Yod
transliterate(k) --> [כ],!.        % Kaf
transliterate(l) --> [ל],!.        % Lamed
transliterate(m) --> [מ],!.        % Mem
transliterate(n) --> [נ],!.        % Nun
transliterate(s) --> [ס],!.        % Samekh
transliterate('H') --> [ע],!.      % Ayin
transliterate(p) --> [פ],!.        % Pe
transliterate('Z') --> [צ],!.      % Tsade
transliterate(q) --> [ק],!.        % Qof
transliterate(r) --> [ר],!.        % Resh
transliterate(c) --> [שׁ],!.        % Shin
transliterate('C') --> [שׂ],!.      % Sin
transliterate(t) --> [ת],!.        % Tav

transliterate(R) --> transliterate_diacritic(R), !.
transliterate(R) --> [R].          % Keep every other character

% Diacritics
transliterate_diacritic('.') --> [ּ],!.       % Dagesh
transliterate_diacritic(a) --> [ ַ],!.        % Patah
transliterate_diacritic(à) --> [ָ],!.         % Qamats
transliterate_diacritic(u) --> [ ֻ],!.        % Qubbuts
transliterate_diacritic(è) --> [ ֶ],!.        % Ségol
transliterate_diacritic(é) --> [ֵ],!.         % Tsere
transliterate_diacritic(i) --> [ ִ],!.        % Hiriq
transliterate_diacritic(o) --> [ ֹ],!.        % holam
transliterate_diacritic(ê) --> [ֱ],!.         % Hateph Segol
transliterate_diacritic(ä) --> [ֳ],!.         % Hateph Qamats
transliterate_diacritic(â) --> [ֲ],!.         % Hateph Patah
transliterate_diacritic(e) --> [ְ],!.         % Shewa
transliterate_diacritic('V') --> [֫],!.       % Ole 

% Final letters
transliterate_final(m) --> [ם].    % Final Mem
transliterate_final(n) --> [ן].    % Final Nun
transliterate_final(k) --> [ך].    % Final Kaf
transliterate_final(p) --> [ף].    % Final Pe
transliterate_final('Z') --> [ץ].  % Final Tsade

% Transliterate a full sentence
transliterate_word([]) --> [].
transliterate_word([H]) --> transliterate_final(H), !.
transliterate_word([Final, Diacritic]) --> transliterate_final(Final), transliterate_diacritic(Diacritic),!.
transliterate_word([H|T]) --> transliterate(H), transliterate_word(T).

s(L, R) :- transliterate_word(L, LR, []), atomic_list_concat(LR, R).
