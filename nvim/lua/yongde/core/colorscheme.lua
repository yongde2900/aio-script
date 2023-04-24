-- nightfly
-- tokyonight
-- tokyonight-(moon, day, storm, night)

local status, _ = pcall(vim.cmd, "colorscheme tokyonight-moon")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
