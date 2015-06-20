/mob/living/silicon/robot/say_quote(var/text)
	var/ending = copytext(text, length(text))

	if(ending == "?")
		return "спрашивает, \"<span class = 'robot'>[text]</span>\"";
	else if(copytext(text, length(text) - 1) == "!!")
		return "восклицает, \"<span class = 'robot'><span class = 'yell'>[text]</span></span>\"";
	else if(ending == "!")
		return "объ&#255;вл&#255;ет, \"<span class = 'robot'>[text]</span>\"";

	return "констатирует, \"<span class = 'robot'>[text]</span>\"";

/mob/living/silicon/robot/IsVocal()
	return !config.silent_borg
