# ADParametricSkinnedWing

This is a work in progress. I do not know how to use GitHub. :0

Creates an OpensCAD parametric way to make thin sheeted wing sections similar to 3DLabprint.com   Most OpensCAD code did not loft arbitrary airfoil profiles (dat files).  By using BOSL2 and Scad-utils libraries, I think this is possible now.  The code seems to work fine even when the two airfoil sections DO NOT HAVE the same number of files. Starts to fail with excessive tip washout twist angle.

Requires use of scad-utils library and BOSL2 libraries.

https://github.com/OskarLinde/scad-utils/blob/master/LICENSE

https://github.com/revarbat/BOSL2

![Image of sample wing from code](https://raw.githubusercontent.com/memsfactory/ADParametricSkinnedWing/master/Clipboard01.jpg)
