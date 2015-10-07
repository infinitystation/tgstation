/*
The /tg/ codebase currently requires you to have 7 z-levels of the same size dimensions.
z-level order is important, the order you put them in inside this file will determine what z level number they are assigned ingame.
Names of z-level do not matter, but order does greatly, for instances such as checking alive status of revheads on z1

current as of 2014/11/24
z1 = station
z2 = centcomm
z3 = derelict telecomms satellite
z4 = derelict station
z5 = mining
z6 = empty space
z7 = empty space
*/

#if !defined(MAP_FILE)

        #include "map_files\TerrorStation\MetaStation.v41GS.dmm"
        #include "map_files\TerrorStation\z2t.dmm"
        #include "map_files\TerrorStation\z3.dmm"
        #include "map_files\TerrorStation\z4.dmm"
        #include "map_files\TerrorStation\z5.dmm"
        #include "map_files\generic\z6.dmm"
        #include "map_files\generic\z7.dmm"
        //#include "map_files\TerrorStation\z8.dmm"  //Polar station
        //#include "map_files\TerrorStation\z8train.dmm" //Train
     	#include "map_files\TerrorStation\asteroid.dmm"
        #include "map_files\TerrorStation\z9.dmm" //prison
        #define MAP_FILE "MetaStation.v41GS.dmm"
        #define MAP_NAME "TerrorStation"

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring Terror's MetaStation.

#endif