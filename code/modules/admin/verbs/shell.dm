/mob/verb/shell_test()
	set name = "Shell test"
	shell("ls > out.txt")
	usr << file2text("out.txt")

/mob/verb/shell_test2()
	set name = "Shell test"
	shell("sh out.sh > out.txt")
	usr << file2text("out.txt")