**How it works.**

GLUE uses the following workflow to fix gaps between two adiacent scenery tiles:

1) Read the btg file and transform vertices coordinates from [ECEF (Earth fixed Earth centered) x y z](http://en.wikipedia.org/wiki/ECEF) to [geodetic lat lon elevation (lambda, phi, h)](http://en.wikipedia.org/wiki/Geographic_coordinate_conversion). This step is necessary because it is easier to found geometric objects (triangles) involved in the fixing process working in geodetic coordinates.

2) Calculate and saves boundary file(s) as user specified. Boundary files contain the cross section at the border coordinate of the tile at the left, right, top or bottom boundary of the tile to be fixed.
The boundary files are in binary format and contain the (ascending ordered geodetic) coordinates and elevation of border vertices.
I've discussed with friends FG developers if we really need boundary files. The answer is no, GLUE can perform directly the border section task working on btg tile files, but for now, for testing purposes, boundary files are useful. Next releases of GLUE can modify this issue.

3) Now GLUE can perform gaps correction. GLUE loops over all top level objects of [BTG file structure](), when it finds individual triangles, GLUE scans to find boundary ones (triangles that have two vertex on boundary). 
In real numbers coordinate "on boundary" means very close, actually tests have shown that 1/10000 degree distance is a good choice.
Then it correct vertices elevation to cope with boundary files, inserts new vertices if needed and linearly interpolate for each added vertices normals, (colors if any) and texture components to create new triangles if needed, in the same FG class  of the original triangle.
Finally GLUE saves the new BTG file (geodetic coords).

4) Then GLUE reprojects vertices coordinates from geodetic to ECEF and save the glued BTG file that can be gzipped and placed to substitute the original tile.

Maxkant1
