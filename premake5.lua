project "GLFW"
	kind "StaticLib"
	language "C"

	targetdir  ("bin/" .. outputDir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputDir .. "/%{prj.name}")

	files 
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/*.h",
		"src/*.c"
	}

	filter "system:windows"
		buildoptions {"-std=c11", "-lgdi32"}
		systemversion "latest"

		defines
		{
			"_GLFW_WIN32", 
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter {"system:windows", "configurations:Release"}
		buildoptions "/MT"
		