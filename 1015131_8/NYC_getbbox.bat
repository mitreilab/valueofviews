
for %%a in (.) do set ID=%%~nxa
getbbox %ID%.rad > bbox.txt
::pause
