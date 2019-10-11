:: -------------------------------------
:: Written by Irmak Turan_170923

::ren *_120x90.jpg *_67x100.* renaming all file names
::* = wildcard files with header_*.hea 
:: https://stackoverflow.com/questions/9383032/rename-all-files-in-a-directory-with-a-windows-batch-script

::To run the python scrip!!!!

::C:\Python27\python.exe Y:\ituran\NYCdaylight\Exports\CODE\NYC_Exports.py

@REM DIVA Climate-Based Metric Batch File
SET RAYPATH=.;C:\DIVA\Radiance\lib;C:\DIVA\Radiance\bin_64;C:\DIVA\DaysimBinaries;
SET PATH=.;C:\DIVA\Radiance\lib;C:\DIVA\Radiance\bin_64;C:\DIVA\DaysimBinaries;

:: 1. Create the WEA file 
set WEA=USA_NY_New.York-LaGuardia.wea
if not exist %WEA% epw2wea  Y:\ituran\NYCdaylight\Scripts\USA_NY_New.York-LaGuardia.AP.725030_TMY3.epw %WEA%

D:
CD D:\ituran\NYCdaylight\105_1 

::::::::::::::::::::::::::: SET THIS :::::::::::::::::::::::::::
SET header=D:\ituran\NYCdaylight\105_1\1015131_8\1015131_8.hea
SET logFILE=log_1015131_8.txt
SET logDIR=D:\ituran\NYCdaylight\105_1\1015131_8

::::::::::::::::::::::::::: SET THIS :::::::::::::::::::::::::::

echo START %DATE% %TIME% >> %logDIR%\%logFILE%

:: 1. Import Radiance File
radfiles2daysim %header% -m -g

echo START_gendc %DATE% %TIME% >> %logDIR%\%logFILE%

:: 2. Calculation Daylight Coefficients File (*.dc)
gen_dc %header% -dif
gen_dc %header% -dir
gen_dc %header% -paste

echo START_dsillum %DATE% %TIME% >> %logDIR%\%logFILE%

CD D:\ituran\NYCdaylight\105_1 C:\DIVA\DaysimBinaries
:: 3. Generate Illuminance File (*.ill)
ds_illum %header%

:: 4. Generate Dynamic Controls and Daylighting Outputs
:: gen_directsunlight %header%
ds_el_lighting.exe %header%

echo STOP %DATE% %TIME% >> %logDIR%\%logFILE%

::PAUSE



