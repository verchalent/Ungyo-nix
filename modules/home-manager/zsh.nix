{inputs, config, pkgs, ...}: {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        initContent = ''
        eval "$(zellij setup --generate-auto-start zsh)"
        [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
        ''; # Init Zellij and Powerlevel10k in new zsh shell
       plugins = [
         {
           name = "powerlevel10k";
           src = pkgs.zsh-powerlevel10k;
           file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
         }
       ];

        localVariables = {
            POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD = true;
            ZSH_THEME = "powerlevel10k/powerlevel10k";
        };

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