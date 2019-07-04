# Quick manual

GLUE is a console application written in VB.NET driven by args command line:

        <command> <parameter> ... <command> <parameter>

In the next paragraphs commands and workflow will be described.
 
## Commands:

        -i <input file>  define the path and the name of the input BTG file
        
        example: -i C:\TEST\3104954.btg
        
Please, note that, at this stage, GLUE can only read BTG uncompressed file format (no gzip) so uncompress before use.
        
        -o <outputfile> define the path and the name of the BTG output file
        
        example: -o C:\TEST\3104954mod.btg
        
        -oTB<side> <boundary geodetic coord>  trasform coordinates from ECEF xyz to geodetic lambda, phi, 
                                              elevation and then perform the output of the boundary file at 
                                              the given geodetic coordinates. (more info on boundary file 
                                              format in the following)
        
        Could be -oTBright -oTBleft - oTBtop -oTBbottom 

        example: -oTBleft 9.5 calculate and save Tile Boundary left at 9.5 degrees latitude.
        
The output file has the same name of input file and suffix TBL or TBR or TBT or TBB for Tile boundary left, right, top, or 
bottom and .dat extension.

       example:  -i C:\TEST\3104954.btg -oTBleft 9.5    outputs boundary file C:\TEST\3104954TBL.dat

Few words about boundary file format: Boundary files are binary files containing an header specifying the number of points of
the boundary, orientation (may be "lam" or "fi" respectively for horizontal or vertical orientation) and the geodetic coordinate
value of the boundary.
Boundary files can be easily converted into script file for visualization (ACAD scr script format) or ASCII format to be loaded
and graphically representedin Excel, using the utilities boundarytoscript or boundarytoASCII.
        
        -oGeod <outputfile> performs transformation of coordinates from ECEF to Geodetic and saves
        
        example: -oGeod C:\TEST\3104954geod.btg
        
        -oECEF <outputfile> performs transformation of coordinates from Geodetic to ECEF and saves
        
        example: -oECEF C:\TEST\3104954ECEF.btg
        
        -g<side> <boundary file> performs the glueing of the tile border to the specified tile boundary by 
                                 inserting new points and triangles and modifying point heights to match.
        
        Could be -gright -gleft -gtop -gbottom 

        example: -gright C:\TEST\3104953TBR.dat glue tile to left tile
        
        -oscr <filename> Output btg file in autocad script (scr format) for visualization.

## Workflow:

Let's suppose we want to eliminate seams at the top boundary of tile 3104954. We need to ungzip the btg file of tile 3104954
and of tile 3104962 and save the btg files in a work folder (you can easily check tiles name using [FG-maps](https://scenery.flightgear.org/map/)).
then you need to calculate and save the bottom boundary of tile 3104962:

-i C:\TEST\3104962.btg -oTBtop 41.00
        
( using [FG-maps](https://scenery.flightgear.org/map) you can find the coordinate of your border)

You now have the new 3104962TBB.dat boundary file in your work folder.

Then you have to perform the GLUE pass:

-i C:\TEST\3104954.btg -gtop C:\TEST\3104962TBB.dat -oGeod C:\TEST\3104954gluedgeod.btg

please, note that the output file is in geodetic coordinates, so you have to revert it to ECEF:

-i C:\TEST\3104954gluedgeod.btg -oECEF C:\TEST\3104954gluedgeodECEF.btg

now gzip your file obtaining 3104954gluedgeodECEF.btg.gz and rename the original tile under the terrain root as you please,
copy 3104954gluedgeodECEF.btg.gz and rename it with the original tile name and enjoy...
