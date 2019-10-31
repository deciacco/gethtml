*************************************************************************************
* Purpose......Determine if a file exists
* Author.......Deciacco.com
* Created......November 22, 2006
* About........
* Mod List.....
*************************************************************************************

* The Foxpro File() function will return a true if the
* file exists in the path. This encludes in the exe itself.
* Sometimes this is not wanted so this is the custom function.

lparameters tcFile
local laFiles[1]
return (adir(laFiles, tcFile) > 0)