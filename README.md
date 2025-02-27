# Hebrew transliteration
This Prolog program can be used to transliterate from french characters to hebrew. It uses a non-standard and non-complete set of characters. Non recognized characters are simply reproduced (see example below with commas and semi-comma). Please consult 'hebrew.pl' file for more info.
# Usage
This program has been tested only with SWI-Prolog. Other Prolog implementations may fail.
Just call it from command line as follows:
```
./theb.pl way.axäzéq d.àwid b.ibegàdàw, way.iqeràHém';' wegam k.àl-hàAânàciym, A.âcèr A.it.wo

וַיַּחֳזֵק דָּוִד בִּבְגָדָו, וַיִּקְרָעֵמ; וְגַם כָּל-הָאֲנָשִׁימ, אֲּשֶׁר אִּתּוֹ
```
# Tests
You can test the program with the following command:
```
swipl -g run_tests -t halt hebrew.plt                                     
[14/14] hebrew:diacritics ..................................................................................................... passed (0.000 sec)
% All 14 tests passed in 0.026 seconds (0.026 cpu)
```
