#if !defined(MAP_FILE)

		#define TITLESCREEN "title" //Add an image in misc/fullscreen.dmi, and set this define to the icon_state, to set a custom titlescreen for your map

		#define MINETYPE "lavaland"

        #include "map_files\TerrorStation\MetaStation.dmm"   // Space Station 'Infinity'
        #include "map_files\TerrorStation\z2t.dmm"		 	 // Central Command
        #include "map_files\TerrorStation\z3.dmm" 			 // White Ship
      	#include "map_files\TerrorStation\z4.dmm"  			 // Clear Space
 		#include "map_files\TerrorStation\lavaland_t.dmm" 	 // Planetoid 'Inferno'
      //#include "map_files\TerrorStation\z5.dmm" 			 // Asteroid
        #include "map_files\TerrorStation\z6.dmm" 			 // Clear Space
        #include "map_files\TerrorStation\z9.dmm" 			 // Prison
      //#include "map_files\monorail_ivent\monorail.dmm"	 // Monorail Maks750rus

//We have: Lavaland, TerrorStation, 2 Clear Space zones, Prison, White Ship with Clear Space
//Все карты из папки TerrorStation редактирует Terror4000rus.

        #define MAP_PATH "map_files/TerrorStation"
        #define MAP_FILE "MetaStation.dmm"
        #define MAP_NAME "Terror MetaStation"

        #define MAP_TRANSITION_CONFIG	list(MAIN_STATION = CROSSLINKED, CENTCOMM = SELFLOOPING, ABANDONED_SATELLITE = CROSSLINKED, DERELICT = CROSSLINKED, MINING = SELFLOOPING, EMPTY_AREA_1 = CROSSLINKED, EMPTY_AREA_2 = CROSSLINKED, ASTEROID = SELFLOOPING, BANPRISON = SELFLOOPING)

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring Terror MetaStation.

#endif