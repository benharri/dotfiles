[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile


export PATH="$HOME/.cargo/bin:$PATH"
if [ -e /home/ben/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ben/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

. "$HOME/.cargo/env"
