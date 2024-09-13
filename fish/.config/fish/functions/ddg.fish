function ddg
    lynx "https://lite.duckduckgo.com/lite/?q=$(string escape --style=url $argv)"
end
