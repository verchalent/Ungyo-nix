{inputs, config, pkgs, ...}: {
  
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "uninstall";
    };
    global = {
      brewfile = true;
      };
    masApps = { 
      "Enchanted LLM" = 6474268307; # not working properly?
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
        ];
    casks = [ 
      {
        name = "alacritty"; # Terminal
        greedy = true;
      }    
      {
        name = "amazon-workspaces"; # Client for AWS DAAS
        greedy = true;
      }
      {
        name = "bartender"; # Cleanup the sys tray
        greedy = true;
      }
      {
        name = "firefox"; # web browsing goodness
        greedy = true;
      }
      {
        name = "geany"; # notepad++ replacement
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
        name = "microsoft-remote-desktop"; # RDP client
        greedy = true;
      }
      {
        name = "obsidian"; # 2nd Brain
        greedy = true;
      }
      {
        name = "podman-desktop"; # control pods
        greedy = true;
      }
      {
        name = "raycast" ; # Spotlight replacement
        greedy = true;
      }
      {
        name = "signal"; #Desktop client for Signal
        greedy = true;
      }
      {
        name = "spotify"; #Muzak
        greedy = true;
      }
      {
        name = "visual-studio-code"; # Make code pretty
        greedy = true;
      }
      {
        name = "whisky"; # MacOS implementation of Wine Bottles for running windows apps
        greedy = true;
      }
      {
        name = "wireshark"; # Network packat analysis
        greedy = true;
      }
    ];
    brews = [ 
      "awscli" # Breaks when done nix native
      "fzf" # Nix native is behind
    # "ollama" # ollama llm engine. Temp blocked until manual install removed
      "trippy" # Move to Nix native ?
      "zoxide" # Nix native is behind
      ]; 
  };
}
