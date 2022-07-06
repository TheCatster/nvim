local g = vim.g
local fn = vim.fn

g.go_play_open_browser = 0
g.go_fmt_fail_silently = 1
g.go_fmt_command = "goimports"
g.go_bin_path = fn.expand("~/.local/share/go/bin")
