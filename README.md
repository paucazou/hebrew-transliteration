# Hebrew transliteration
This Prolog program can be used to transliterate from french characters to hebrew. It uses a non-standard and non-complete set of characters. Non recognized characters are simply reproduced (see example below). Please consult 'hebrew.pl' file for more info.
# Usage
This program has been tested only with SWI-Prolog. Other Prolog implementations can fail.
Just call it from command line as follows:
``` ./theb.pl d.àwid                                   18:23 - 27 C°
דָּוִד 
```
# Tests
You can test the program by calling it from SWI-Prolog RPL:
```
$ swipl # or the command used by your OS / distro
?- [hebrew].
?- load_test_files("hebrew").
% Found 1 .plt test files, loaded 1
true.

?- run_tests.
[9/9] hebrew:diacritics ........................................................................ passed (0.000 sec)
% All 9 tests passed in 0.018 seconds (0.018 cpu)
true.
```
