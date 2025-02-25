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

% Diacritics
transliterate('.') --> [ּ],!.       % Dagesh
transliterate(a) --> [ ַ],!.        % Patah
transliterate(à) --> [ָ],!.         % Qamats
transliterate(u) --> [ ֻ],!.        % Qubbuts
transliterate(è) --> [ ֶ],!.        % Ségol
transliterate(é) --> [ֵ],!.         % Tsere
transliterate(i) --> [ ִ],!.        % Hiriq
transliterate(o) --> [ ֹ],!.        % holam
transliterate(ê) --> [ֱ],!.         % Hateph Segol
transliterate(ä) --> [ֳ],!.         % Hateph Qamats
transliterate(â) --> [ֲ],!.         % Hateph Patah
transliterate(e) --> [ְ],!.         % Shewa
transliterate('V') --> [֫],!.       % Ole 

transliterate(R) --> [R].          % Keep every other character

% Final letters
transliterate_final(m) --> [ם].    % Final Mem
transliterate_final(n) --> [ן].    % Final Nun
transliterate_final(k) --> [ך].    % Final Kaf
transliterate_final(p) --> [ף].    % Final Pe
transliterate_final('Z') --> [ץ].  % Final Tsade

% Transliterate a full sentence
transliterate_word([]) --> [].
transliterate_word([H]) --> transliterate_final(H), !.
transliterate_word([H|T]) --> transliterate(H), transliterate_word(T).

s(L, R) :- transliterate_word(L, LR, []), atomic_list_concat(LR, R).
