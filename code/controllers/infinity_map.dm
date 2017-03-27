var/global/generating_map = 0

/client/proc/generate_map_icon()
	set category = "Server"
	set name = "Create map icon"

	if(generating_map)
		return

	if(!usr.client.holder)
		return

	if(!check_rights(R_DEBUG))
		return

	var/zlevels_list = list(ZLEVEL_STATION, ZLEVEL_CENTCOM)

	var/confirm = alert("Уверены? Этого НЕ нужно делать на игровом сервере", "Map icon", "Да", "Нет")

	if(confirm == "Нет")
		return

	var/z_level
	if(confirm == "Да")
		generating_map = 1
		var/max_x = 1
		var/max_y = 1
		z_level = input("Выберите уровень", "Выбор уровнЯ") as null|anything in zlevels_list
		var/i
		var/j
		for(i = 1, i < world.maxx, i += 64)
			max_x = (i+63>world.maxx) ? world.maxx : i+63
			max_y = 1
			for(j = 1, j < world.maxy, j += 64)
				max_y = (j+63>world.maxy) ? world.maxy : j+63
				generate_map_self(z_level, i, j, max_x, max_y, "[SSmapping.config.map_name]_[z_level]_([i],[j];[max_x],[max_y])")

	generating_map = 0

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
		var/turf/TB = T
		generate_tile_self(T, minimap, TB.x+1-x1, TB.y+1-y1)

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

// Функция рисования. Задано для спрайтов 32px и 64x64.
/proc/generate_tile_self(turf/tile, icon/minimap, c_x, c_y)
	var/icon/tile_icon
	var/obj/obj
	var/list/obj_icons = list()
	// Космос должен быть черным! Просто поставим объекты на фон.
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
		// Меняем размер
		tile_icon.Scale(32,32)
		// Вставляем маленькую иконку в большую
		minimap.Blend(tile_icon, ICON_OVERLAY, ((c_x - 1) * 32), ((c_y - 1) * 32))
		del(tile_icon)