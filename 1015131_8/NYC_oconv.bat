@REM Creating octree for NYC simulation 

SET RAYPATH=.;C:\DIVA\Radiance\lib;C:\DIVA\Radiance\bin_64;C:\DIVA\DaysimBinaries;
SET PATH=.;C:\DIVA\Radiance\lib;C:\DIVA\Radiance\bin_64;C:\DIVA\DaysimBinaries;

D:
for %%a in (.) do set current=%%~nxa
oconv materials.rad %current%.rad %current%_ground.rad > %current%.oct
::PAUSE