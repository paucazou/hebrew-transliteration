% This program helps the user to transliterate 
% from french to hebrew
% Please note that this transliteration is not standard
% but suits my own use

% Define transliteration rules
transliterate(a) --> [א].        % Aleph
transliterate(b) --> [ב].        % Bet
transliterate(g) --> [ג].        % Gimel
transliterate(d) --> [ד].        % Dalet
transliterate(h) --> [ה].        % He
transliterate(w) --> [ו].        % Vav
transliterate(z) --> [ז].        % Zayin
transliterate(x) --> [ח].        % Het
transliterate('!') --> [ט].      % Tet
transliterate(y) --> [י].        % Yod
transliterate(k) --> [כ].        % Kaf
transliterate(l) --> [ל].        % Lamed
transliterate(m) --> [מ].        % Mem
transliterate(n) --> [נ].        % Nun
transliterate(s) --> [ס].        % Samekh
transliterate('§') --> [ע].      % Ayin
transliterate(p) --> [פ].        % Pe
transliterate('%') --> [צ].      % Tsade
transliterate(q) --> [ק].        % Qof
transliterate(r) --> [ר].        % Resh
transliterate('>') --> [שׁ].% Shin
transliterate('<') --> [שׂ].% Sin
transliterate(t) --> [ת].  % Tav

% Diacritics
transliterate(dagesh) --> [ּ]. % Dagesh
transliterate(patah) --> [ ַ]. % Patah
transliterate(qamats) --> [ָ]. % Qamats
transliterate(u) --> [ ֻ]. % Qubbuts
transliterate(è) --> [ ֶ]. % Ségol
transliterate(é) --> [ֵ].  % Tsere
transliterate(i) --> [ ִ]. % Hiriq
transliterate(holam) --> [ ֹ]. % holam
transliterate(hateph_patah) --> [ֱ].  % Hateph Patah
transliterate(hateph_segol) --> [ֲ].  % Hateph Segol
transliterate(hateph_qamats) --> [ֳ].  % Hateph Qamats
transliterate(shewa) --> [ְ].  % Shewa
transliterate(meteg) --> [֞].  % Meteg
transliterate(ole) --> [֫].  % Ole 

transliterate(R) --> [R].  % Keep every other character

% Final letters
% Please do not forget to use ' ' instead of " " or ` `
transliterate_final(m, ' ') --> [ם].  % Final Mem
transliterate_final(n, ' ') --> [ן].  % Final Nun
transliterate_final(k, ' ') --> [ך].  % Final Kaf
transliterate_final(p, ' ') --> [ף].  % Final Pe
transliterate_final(ts, ' ') --> [ץ]. % Final Tsade

% Transliterate a full sentence
transliterate_sentence([]) --> [].
transliterate_sentence([H]) --> transliterate_final(H, ' '), !.
transliterate_sentence([H,' '|T]) --> transliterate_final(H, ' '), transliterate_sentence(T),!.
transliterate_sentence([H|T]) --> transliterate(H), transliterate_sentence(T).

s(L, R) :- transliterate_sentence(L, LR, []), atomic_list_concat(LR, R).
