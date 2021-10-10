# Defined in /tmp/fish.sXa0jy/gall.fish @ line 2
function gall
  find ~/workspace -type d -name .git -print0 \
  | xargs -0 -n1 -I% git --git-dir=% --work-tree=%/.. $argv
end
