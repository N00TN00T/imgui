-- PREMAKE FOR IMGUI

project "imgui"
    kind "StaticLib"
    language "C++"
    
	targetdir ("bin/" .. output_dir .. "/%{prj.name}")
  objdir ("bin-int/" .. output_dir .. "/%{prj.name}")

	files
  {
    "imconfig.h",
    "imgui.h",
    "imgui.cpp",
    "imgui_draw.cpp",
    "imgui_internal.h",
    "imgui_widgets.cpp",
    "imstb_rectpack.h",
    "imstb_textedit.h",
    "imstb_truetype.h",
    "imgui_demo.cpp",
    "imgui_impl_opengl3.h",
    "imgui_impl_opengl3.cpp",
    "imgui_impl_glfw.h",
    "imgui_impl_glfw.cpp"
  }
  
  includedirs 
  { 
    "../imgui",
    "../glfw/include",
    "../glad/include"
  }
  
  defines "IMGUI_IMPL_OPENGL_LOADER_GLAD"
  
	filter "system:windows"
    systemversion "latest"
    cppdialect "C++17"
    staticruntime "on"
    
    defines "IM_PLATFORM_WINDOWS"

  filter "system:linux"
    systemversion "latest"
    cppdialect "C++17"
    staticruntime "on"
    pic "on"

  filter "system:macosx"
    systemversion "latest"
    cppdialect "C++17"
    staticruntime "on"

  filter "configurations:Debug*"
    defines "WZ_CONFIG_DEBUG"
    runtime "Debug"
    symbols "On"
    optimize "Off"

  filter "configurations:Release*"
    defines "WZ_CONFIG_RELEASE"
    runtime "Release"
    symbols "On"
    optimize "On"

  filter "configurations:Dist*"
    defines { "WZ_CONFIG_DIST", "WZ_DISABLE_ASSERTS" }
    runtime "Release"
    symbols "Off"
    optimize "Speed"
