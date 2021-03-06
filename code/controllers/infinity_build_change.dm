GLOBAL_DATUM_INIT(nextbuild, /datum/server_build, new)
GLOBAL_DATUM_INIT(currentbuild, /datum/server_build, new)

/datum/controller/configuration
	var/list/buildlist
/*
/datum/controller/subsystem/ticker ���� ���� ~bear1ake
	var/buildchangechecked = 0				//build changing?
	var/buildchanger_ckey = ""				//who changing build?
*/
/datum/server_build
	var/name				// name of build
	var/friendlyname		// friendly name of build
	var/dmb_file			// dmb file of build
	var/folder				// folder of build
	var/update				// update folder of build

/datum/server_build/New(name)
	src.name = name

//TODO@inf-dev: ���������� ��� ����� ������� ~bear1ake
/datum/controller/configuration/proc/loadbuildlist(filename)
	log_config("Loading config file [filename]...")
	filename = "[directory]/[filename]"
	var/list/Lines = world.file2list(filename)

	var/datum/server_build/current_build = null
	for(var/t in Lines)
		if(!t)
			continue

		t = trim(t)
		if(length(t) == 0)
			continue
		else if(copytext(t, 1, 2) == "#")
			continue

		var/pos = findtext(t, " ")
		var/command = null
		var/data = null

		if(pos)
			command = lowertext(copytext(t, 1, pos))
			data = copytext(t, pos + 1)
		else
			command = lowertext(t)

		if(!command)
			continue

		if(!current_build && command != "build")
			continue

		switch(command)
			if("build")
				current_build = new (data)
			if("dmbfile")
				current_build.dmb_file = data
			if("friendlyname")
				current_build.friendlyname = data
			if("folder")
				current_build.folder = data
			if("update")
				current_build.update = data
			if("endbuild")
				LAZYINITLIST(buildlist)
				buildlist[current_build.name] = current_build
				GLOB.currentbuild = null
			else
				GLOB.world_game_log << "Unknown command in builds config: '[command]'"

/proc/loadbuildname()
	shell("sh ../dir.sh > ext.txt")
	var/ext
	var/list/Lines = world.file2list("ext.txt")
	if(Lines.len)
		if(Lines[1])
			ext = Lines[1]
	for(var/build in config.buildlist)
		var/datum/server_build/B = config.buildlist[build]

		if(ext == B.folder)
			GLOB.currentbuild = B
			break

/client/proc/adminchangebuild()
	set category = "Server"
	set name = "Change Build"

	if(!holder)
		return

	var/list/buildchoices = list()
	for(var/build in config.buildlist)
		var/datum/server_build/B = global.config.buildlist[build]
		var/buildname = B.friendlyname

		if(B == GLOB.currentbuild)
			continue

		buildchoices[buildname] = B

	var/chosenbuild = input("Choose a build to change to", "Change Build")  as null|anything in buildchoices

	if (!chosenbuild)
		return

	SSticker.buildchangechecked = 1
	SSticker.buildchanger_ckey = ckey
	var/datum/server_build/B = buildchoices[chosenbuild]
	GLOB.nextbuild = B

	message_admins("[key_name_admin(usr)] �����&#255;�(�) ���� �� [GLOB.nextbuild.name]([GLOB.nextbuild.friendlyname])")
	log_admin("[key_name(usr)] �����&#255;�(�) ���� �� [GLOB.nextbuild.name]([GLOB.nextbuild.friendlyname])")
	to_chat(world, "<span class='boldannounce'>���� ������� �� [GLOB.nextbuild.friendlyname] ��&#255; ���������� ������!</span>")

/proc/forcechangebuild(datum/server_build/B)
	if(!istype(B))
		return
	if(!B)
		return
	if(SSticker.update_waiting)
		return

	to_chat(world, "<span class='adminooc'><FONT size=5>��������! ���� �������� �� [B.friendlyname]! ������ �� ����� �������� ��������� �����!</FONT><br>����� ����� � ����� ������ ������������ ��������������� [SSticker.buildchanger_ckey]</span>.")
	playsound_global('sound/effects/alarm.ogg', repeat=0, channel=1, volume=100)
	sleep(100)

	log_game("Changing build to [B.name]([B.friendlyname])")
	. = shell("sudo sh ../change_build.sh [B.dmb_file] [B.folder] [world.port]")