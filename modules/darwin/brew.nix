{inputs, config, pkgs, ...}: {
  
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };
    global = {
      brewfile = true;
      };
    masApps = {
      Keynote = 409183694; # added to force updates
      iMovie = 408981434; # added to force updates
      Pages = 409201541; # added to force updates
      GarageBand = 682658836; # added to force updates
      Numbers = 409203825; # added to force updates
    }; # Mac Store apps via Brew MAS - https://mynixos.com/nix-darwin/option/homebrew.masApps
    taps = [
        "homebrew/bundle"
        "homebrew/services"
        "fujiapple852/trippy"
        {
          name = "konradsz/igrep";
          clone_target = "https://github.com/konradsz/igrep.git";
          force_auto_update = true;
        }
        ];
    casks = [ 
      {
        name = "alacritty"; # Terminal
        greedy = true;
      }  
      {
        name = "alt-tab"; # Enhanced Cmd + Tab behavior akin to Windows
        greedy = true;
      }  
      {
        name = "bartender"; # Cleanup the sys tray
        greedy = true;
      }
      {
        name = "brave-browser"; # Brave browser
        greedy = true;
      }
      {
        name = "disk-inventory-x";
        greedy = true;
      }
      {
        name = "insta360-link-controller";
        greedy = true;
      }
      {
        name = "firefox"; # Firefox browser
        greedy = true;
      }
      {
        name = "font-fira-code"; # Nerd Font for terminal
        greedy = true;
      }
      {
        name = "iterm2"; # Terminal replacement
        greedy = true;
      }
      {
        name = "keepingyouawake"; # Prevents sleep
        greedy = true;
      }
      {
        name = "lulu"; #  Firewall 
        greedy = true;
      }
      {
        name = "microsoft-edge"; # Edge for use with M365 items 
        greedy = true;
      }
      {
        name = "windows-app"; # RDP client
        greedy = true;
      }
      {
        name = "raycast" ; # Spotlight replacement
        greedy = true;
      }
      {name = "vcam"; # Virtual Camera
        greedy = true;
      }
      {
        name = "visual-studio-code"; # Make code pretty
        greedy = true;
      }
    ];
    brews = [ 
      "awscli" # Breaks when done nix native
      "fzf" # Nix native is behind
      "oh-my-posh" # Terminal prompt config for nu
      "igrep"
      "netdata"
      "trippy" # Move to Nix native ?
      "uv" # Python Package Manager
      "zoxide" # Nix native is behind
      ]; 
  };
}
