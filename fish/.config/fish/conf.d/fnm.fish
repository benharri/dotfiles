# fnm
fish_add_path --path ~/.local/share/fnm
if command -q fnm
    fnm env | source
end
