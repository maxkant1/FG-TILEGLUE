# GLUE: a tool for solving seams in FG terrain tiles

Flightgear Scenery and terrain developers know very well problems that can arise, for a lot of reasons, when trying to upgrade and substitute old terrain tiles with newer ones.
Generally tiles boundaries do not match and different heigths of triangles creates what is often called "seams".

This project aims to solve "seams" problem and actually it has solved, at least form me, problems  presented in the original LIEO apt tile (3104954 E09N40).

You will find herein the VB.NET code (please do not blame me, I'm sure that C programmers clever than me could port easily the code from VB.NET to C) of the program named GLUE.
GLUE is for now a console application driven by command lines args, just like programs in terragear toolchain, but in the near future could have a GUI interface.
Moreover you will find a quick manual, executable code of GLUE, some byproducts utility and the images of tile before and after GLUE.

GLUE started initially with few main goals: understand BTG file structure, test algorithms and demonstrate feasibility, but it has developed quickly and has produced first results.

At this stage the program is working but it needs deeper testing. I have tested it, at least for reading and writing tiles and airport BTG files, for 10 randomly selected tiles in the world scenery but, having 2500000 tiles, it represent only a 0,0004% succesful sample.

So please, feel free to try and experiment and please give me your feedback, or contact me in the FG Forum and send me your terrain tile, I'll try to fix it for you.

Have Fun

Massimo Cantone (aka maxkant1 in FG Forum)
