{ pkgs, ... }: {
  users.users.justin.home = "/Users/justin";
  imports = [./brew.nix];
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [ bash zsh ];
#   loginShell = pkgs.zsh;
    systemPackages = [ 
      pkgs.coreutils
      pkgs.inlyne  #testing
      pkgs.sniffnet #testing
    ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;
  fonts.packages = [ 
  # For package names look at cask https://github.com/NixOS/nixpkgs/blob/master/pkgs/data/fonts/nerd-fonts/manifests/fonts.json
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.meslo-lg
    ];
#  services.nix-daemon.enable = true; # Depricated. Breaking build 02.2025

  system = {
  
    stateVersion = 4;

    defaults = {
      ActivityMonitor = {
        ShowCategory = 101; # Show All Processes, Hierarchally as default
      };
      
      alf = {
        globalstate = 0; # Disable the internal firewall - Changed 10.10.24 due to 15.0.1 dropping network non-stop
        loggingenabled = 1; # Enable logging of requests made to the firewall
        stealthenabled = 1; # Drop incoming icmp
      };
      
      dock = {
        autohide = true; # Autohide Dock  
        show-recents = false; # Turn off recents in Dock
        launchanim = false; # Turn off Animate opening applications from the Dock
        mouse-over-hilite-stack = true; # Enable highlight hover effect 
        orientation = "left"; # Set Position of the dock on screen
        tilesize = 48; # Size of the icons in the dock.
        mru-spaces = false; # Prevent automatic rearanging of spaces
      };
    
      finder = {
        _FXShowPosixPathInTitle = true; # Show the full POSIX filepath in the window title
        AppleShowAllExtensions = true; # Show all file extensions in Finder.
        FXPreferredViewStyle = "Nlsv"; # Change the default finder view. “icnv” = Icon view, “Nlsv” = List view, “clmv” = Column View, “Flwv” = Gallery View The default is icnv.
        ShowStatusBar = true; # Show status bar at bottom of finder windows with item/disk space stats.

      };
      
      trackpad = {
        Clicking = true; # Enable tapping the trackpad to click
        TrackpadThreeFingerDrag = false; # Enable/disable three-finger drag. Default is false.
      };

      NSGlobalDomain = {
        AppleShowAllExtensions = true; # Show all file extensions
        InitialKeyRepeat = 14; # speed up key repeat behavior
        KeyRepeat = 1;
        "com.apple.sound.beep.volume" = 0.000; # Mute alert volume
        "com.apple.swipescrolldirection" = false; # Disable Natural Scrolling direction
      };

      menuExtraClock.Show24Hour = true; # Set Clock to 24 Hour Mode
      loginwindow.GuestEnabled = false; # Disable guest account
    };
  };
}
