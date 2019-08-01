REM SAMPLE BATCH FILE
REM
REM Calculating boundary files for adjacent tiles
echo on 
C:\GLUE\glue.exe -i C:\SAMPLE\DATA\3104946.btg -oTBtop 40,875
C:\GLUE\glue.exe -i C:\SAMPLE\DATA\3104953.btg -oTBright 9,5
C:\GLUE\glue.exe -i C:\SAMPLE\DATA\3104962.btg -oTBbottom 41,00
REM
REM Calculating boundary files for tile 3104954
REM
REM Uncomment following lines only if you need to view boundary cross sections in excel graph
REM C:\GLUE\glue.exe -i C:\SAMPLE\DATA\3104954.btg -oTBtop 41,00 -oTBleft 9,5 -oTBbottom 40,875
REM Trasforming boundary files from binary to ascii format 
REM C:\GLUE\BoundarytoASCII.exe C:\SAMPLE\DATA\3104946TBT.dat C:\SAMPLE\DATA\ASC\3104946TBT.asc
REM C:\GLUE\BoundarytoASCII.exe C:\SAMPLE\DATA\3104953TBR.dat C:\SAMPLE\DATA\ASC\3104953TBR.asc
REM C:\GLUE\BoundarytoASCII.exe C:\SAMPLE\DATA\3104954TBB.dat C:\SAMPLE\DATA\ASC\3104954TBB.asc
REM C:\GLUE\BoundarytoASCII.exe C:\SAMPLE\DATA\3104954TBL.dat C:\SAMPLE\DATA\ASC\3104954TBL.asc
REM C:\GLUE\BoundarytoASCII.exe C:\SAMPLE\DATA\3104954TBT.dat C:\SAMPLE\DATA\ASC\3104954TBT.asc
REM C:\GLUE\BoundarytoASCII.exe C:\SAMPLE\DATA\3104962TBB.dat C:\SAMPLE\DATA\ASC\3104962TBB.asc
REM GLUE pass
C:\GLUE\glue.exe -i C:\SAMPLE\DATA\3104954.btg -gtop C:\SAMPLE\DATA\3104962TBB.dat -gleft C:\SAMPLE\DATA\3104953TBR.dat -gbottom C:\SAMPLE\DATA\3104946TBT.dat -oECEF C:\SAMPLE\DATA\3104954glued.btg
REM Calculating boundary files for tile 3104954glued
REM Uncomment following lines only if you need to view boundary cross sections in excel graph 
REM C:\GLUE\glue.exe -i C:\SAMPLE\DATA\3104954glued.btg -oTBtop 41,00 -oTBleft 9,5 -oTBbottom 40,875
REM Trasforming tile 3104954glued  boundary files from binary to ascii format 
REM C:\GLUE\BoundarytoASCII.exe C:\SAMPLE\DATA\3104954gluedTBB.dat C:\SAMPLE\DATA\ASC\3104954gluedTBB.asc
REM C:\GLUE\BoundarytoASCII.exe C:\SAMPLE\DATA\3104954gluedTBL.dat C:\SAMPLE\DATA\ASC\3104954gluedTBL.asc
REM C:\GLUE\BoundarytoASCII.exe C:\SAMPLE\DATA\3104954gluedTBT.dat C:\SAMPLE\DATA\ASC\3104954gluedTBT.asc