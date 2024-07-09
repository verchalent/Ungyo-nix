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
    masApps = { }; # Move to seperate file when used
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
        name = "wireshark"; # Network packat analysis
        greedy = true;
      }
    ];
    brews = [ 
      "awscli"
      "fzf"
      "trippy"
      "zoxide"
      ]; 
  };
}
