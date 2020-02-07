@REM Creating octree for NYC simulation 

SET RAYPATH=.;C:\DIVA\Radiance\lib;C:\DIVA\Radiance\bin_64;C:\DIVA\DaysimBinaries;
SET PATH=.;C:\DIVA\Radiance\lib;C:\DIVA\Radiance\bin_64;C:\DIVA\DaysimBinaries;

cd D:\ituran\NYCviews\RadScene

:: Input Octree
set octreefile=D:\ituran\NYCviews\RadScene\NYCmodel_all_wSkyandViews_200124.oct

:: Rays file (calculated separately) 
set rayFile=D:\ituran\NYCviews\BINS_1\1002320\1002320_rays.csv

:: Name of the results file
set resultsFile=D:\ituran\NYCviews\BINS_1\1002320\1002320_out.dat


:: oconv %skyfile% %geofile% > %octreefile%
rtrace -h -ooMls -ab 0 %octreefile% < %rayFile% > %resultsFile%

::PAUSE

:: ~ indicates the start of a new ray
:: o origin of ray 
:: t option to report the daughter rays. 
:: M material name
:: l effective length of ray
:: s surface name (of destination)
:: L first intersection distance 