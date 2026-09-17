{inputs, config, pkgs, ...}: {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        # zsh-prompt-evolution: autosuggestions + syntax-highlighting come from
        # the antidote bundle below instead, so the plugin isn't loaded twice.
        autosuggestion.enable = false;
        syntaxHighlighting.enable = false;

        initContent = ''
        eval "$(zellij setup --generate-auto-start zsh)"

        zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

        # zsh-prompt-evolution: antidote replaces oh-my-zsh (mirrors amatarsu's
        # tested setup). Some omz plugins (chezmoi, podman) expect omz's
        # $ZSH_CACHE_DIR global to write generated completions into.
        export ZSH_CACHE_DIR="$HOME/.cache/zsh"
        mkdir -p "$ZSH_CACHE_DIR/completions"
        source "$(brew --prefix antidote)/share/antidote/antidote.zsh"
        antidote load "$HOME/.config/zsh/.zsh_plugins.txt"

        # was ENABLE_CORRECTION="true" under oh-my-zsh
        setopt correct

        # zsh-prompt-evolution: starship replaces powerlevel10k
        eval "$(starship init zsh)"
        ''; # Init Zellij, antidote plugins, starship prompt, case-insensitive tab completion

        shellAliases = {
            brewup = "brew update && brew upgrade && brew cleanup --prune=all";
            cat = "bat";
            cd = "z";
            explorer = "open";  
            find = "fd";
            la = "lsd -la";
            ll = "lsd -l";
            ls = "lsd";
            nixswitch = "darwin-rebuild switch --flake ~/src/Ungyo-nix/.#";
            nixup = "brewup; pushd ~/src/Ungyo-nix; ./modules/home-manager/scripts/nixup.sh; popd"; #update env based on latest config
            nixclean = "nix-store --gc"; # Clean local nix store
            powershell = "pwsh";
            ps = "procs";    
            ssh = "TERM=xterm-256color /usr/bin/ssh"; # fix for alacritty 
            vi = "hx"; # Alias Helix to open in place of vi
        };
    };
}