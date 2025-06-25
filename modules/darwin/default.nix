{ pkgs, ... }: {
  users.users.justin.home = "/Users/justin";
  imports = [./brew.nix];
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [ bash zsh ];
    systemPackages = [ pkgs.coreutils];
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

  system = {
    primaryUser = "justin";

    stateVersion = 4;

    defaults = {
      ActivityMonitor = {
        ShowCategory = 101; # Show All Processes, Hierarchally as default
      };
      
      dock = {
        autohide = true; # Autohide Dock  
        launchanim = false; # Turn off Animate opening applications from the Dock
        mouse-over-hilite-stack = true; # Enable highlight hover effect 
        mru-spaces = false; # Prevent automatic rearanging of spaces
        orientation = "left"; # Set Position of the dock on screen
        persistent-apps = [
          {
            app = "/Applications/Alacritty.app";
          }
          {
            app = "/System/Applications/System Settings.app";
          }
          {
            app = "/System/Applications/Utilities/Activity Monitor.app";
          }
        ];
        show-recents = false; # Turn off recents in Dock
        tilesize = 48; # Size of the icons in the dock.
      };
    
      finder = {
        _FXShowPosixPathInTitle = true; # Show the full POSIX filepath in the window title
        _FXSortFoldersFirst = true; # Sort folders first in Finder
        AppleShowAllExtensions = true; # Show all file extensions in Finder.
        FXEnableExtensionChangeWarning = false; # Disable the warning when changing file extensions
        FXPreferredViewStyle = "Nlsv"; # Change the default finder view. “icnv” = Icon view, “Nlsv” = List view, “clmv” = Column View, “Flwv” = Gallery View The default is icnv.
        FXRemoveOldTrashItems = true; # Remove old trash items after 30 days
        QuitMenuItem = true; # Enable the Quit menu item in Finder
        ShowExternalHardDrivesOnDesktop = true; # Show external hard drives on the desktop
        ShowHardDrivesOnDesktop = false; # Don't show internal hard drives on the desktop
        ShowMountedServersOnDesktop = true; # Show mounted servers on the desktop
        ShowPathbar = true; # Show the path bar at the bottom of Finder windows
        ShowRemovableMediaOnDesktop = true; # Show removable media on the desktop
        ShowStatusBar = true; # Show status bar at bottom of finder windows with item/disk space stats.
      };

      NSGlobalDomain = {
        AppleShowAllExtensions = true; # Show all file extensions
        InitialKeyRepeat = 14; # speed up key repeat behavior
        KeyRepeat = 1;
        "com.apple.sound.beep.volume" = 0.000; # Mute alert volume
        "com.apple.swipescrolldirection" = false; # Disable Natural Scrolling direction
        NSDocumentSaveNewDocumentsToCloud = false; # Save new documents to local disk
      };

      spaces = {
        spans-displays = false; # Disable spanning displays
      };

      ### Laptop Settings
      /*
      keyboard = {
        enableKeyMapping = true;
        swapLeftCtrlAndFn = true; # Swap left control and fn keys
      };

      trackpad = {
        Clicking = true; # Enable tapping the trackpad to click
        TrackpadThreeFingerDrag = false; # Enable/disable three-finger drag. Default is false.
      };
      */
      
      menuExtraClock.Show24Hour = true; # Set Clock to 24 Hour Mode
      loginwindow.GuestEnabled = false; # Disable guest account
    };
  };
}
