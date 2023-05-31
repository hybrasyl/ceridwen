::: Batch file to create lua files from script name in textfile

@echo on
SET FileList=castables.txt

FOR /F "TOKENS=*" %%F IN (%FileList%) DO (

	ECHO ^0>"%%~F.lua"

)
GOTO EOF