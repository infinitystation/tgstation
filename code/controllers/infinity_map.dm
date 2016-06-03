/client/proc/generate_map_icon()
	set category = "Server"
	set name = "Create map icon"

	var/zlevels_list = list(ZLEVEL_STATION, ZLEVEL_CENTCOM)

	if(!usr.client.holder)
		return

	var/confirm = alert("Уверены? Этого НЕ нужно делать на игровом сервере", "Map icon", "Да", "Нет")

	if(confirm == "Нет")
		return

	var/z_level
	if(confirm == "Да")
		var/max_x = 0
		var/max_y = 0
		z_level = input("Выберите уровень", "Выбор уровнЯ") as null|anything in zlevels_list
		world << "СОЗДАЕТСЯ ФОТО ИГРОВОГО УРОВНЯ [z_level]";
		var/i
		var/j
		for(i = 0, i < world.maxx, i += 64)
			max_x = (i+64>world.maxx) ? world.maxx : i+64
			for(j = 0, j < world.maxy, j += 64)
				max_y = (i+64>world.maxy) ? world.maxy : j+64
				generate_map_self(z_level, i, j, max_x, max_y, "[MAP_NAME]_[z_level]_([i],[j];[max_x],[max_y])")

	world << "ФОТО ИГРОВОГО УРОВНЯ [z_level] СОЗДАНО"

// Используется код миникарт
/proc/generate_map_self(z = 1, x1 = 1, y1 = 1, x2 = world.maxx, y2 = world.maxy, name)
	// Загрузка фона
	var/icon/minimap = new /icon('icons/minimap.dmi')
	// Установка размера иконки
	minimap.Scale(2048, 2048)

	// Счетчик, для избежания переполнения памяти
	var/counter = 512
	// Цикл по всем тайлам
	for(var/T in block(locate(x1, y1, z), locate(x2, y2, z)))
		generate_tile_self(T, minimap)

		// Баг BYOND'а. Чтобы избежать переполнения памяти, нужно через каждые 512 или менее тайлов, заново создавать иконку, заменяя ею старую.
		counter--
		if(counter <= 0)
			counter = 512
			var/icon/flatten = new /icon()
			flatten.Insert(minimap, "", SOUTH, 1, 0)
			del(minimap)
			minimap = flatten
			stoplag() // Нужно подождать, чтобы GC BYOND'а выполнил свою работу

		CHECK_TICK


	// Создаем иконку
	var/icon/final = new /icon()
	final.Insert(minimap, "", SOUTH, 1, 0)
	fcopy(final, "data/map_icons/[name].png")

// Используемая функция на 03.06.2016
/proc/generate_tile_self(turf/tile, icon/minimap)
	var/icon/tile_icon
	var/obj/obj
	var/list/obj_icons = list()
	world << "[tile.x], [tile.y]"
	// Don't use icons for space, just add objects in space if they exist.
	if(istype(tile, /turf/open/space))
		obj = locate(/obj/structure/lattice/catwalk) in tile
		if(obj)
			tile_icon = new /icon('icons/obj/smooth_structures/catwalk.dmi', "catwalk", SOUTH)
		obj = locate(/obj/structure/lattice) in tile
		if(obj)
			tile_icon = new /icon('icons/obj/smooth_structures/lattice.dmi', "lattice", SOUTH)
		obj = locate(/obj/structure/grille) in tile
		if(obj)
			tile_icon = new /icon('icons/obj/structures.dmi', "grille", SOUTH)
		obj = locate(/obj/structure/transit_tube) in tile
		if(obj)
			tile_icon = new /icon('icons/obj/atmospherics/pipes/transit_tube.dmi', obj.icon_state, obj.dir)
	else
		tile_icon = new /icon(tile.icon, tile.icon_state, tile.dir)
		obj_icons.Cut()

		obj = locate(/obj/structure) in tile
		if(obj)
			obj_icons += getFlatIcon(obj)
		obj = locate(/obj/machinery) in tile
		if(obj)
			obj_icons += new /icon(obj.icon, obj.icon_state, obj.dir, 1, 0)
		obj = locate(/obj/structure/window) in tile
		if(obj)
			obj_icons += new /icon('icons/obj/smooth_structures/window.dmi', "window", SOUTH)

		for(var/I in obj_icons)
			var/icon/obj_icon = I
			tile_icon.Blend(obj_icon, ICON_OVERLAY)

	if(tile_icon)
		// Scale the icon.
		tile_icon.Scale(32,32)
		// Add the tile to the minimap.
		minimap.Blend(tile_icon, ICON_OVERLAY, ((tile.x - 1) * 32), ((tile.y - 1) * 32))
		del(tile_icon)