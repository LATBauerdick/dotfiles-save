# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./devenv.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  boot.loader.grub.storePath = "/nix/store";

  boot.kernel.sysctl = {
    # Note that inotify watches consume 1kB on 64-bit machines.
    "fs.inotify.max_user_watches"   =  204800;   # default:  8192
  #  "fs.inotify.max_user_instances" =    1024;   # default:   128
  #  "fs.inotify.max_queued_events"  =   32768;   # default: 16384
  };



  services.openssh.enable = true;
  # open firewall ports for mosh
  networking.firewall.allowedUDPPortRanges = [
    { from = 60001; to = 60009; }
  ];

  networking.firewall.allowedTCPPorts = [ 8385 ];
  
  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

#  boot.initrd.luks.devices.crypted.device = "/dev/disk/by-uuid/f2814c9b-4891-4977-93c2-ca8d1c44effb";
#  fileSystems."/data".device = "/dev/mapper/crypted";

  fileSystems."/data" =
  { #device = "/dev/disk/by-uuid/9834bc72-2720-4ac1-86e6-2c737db330a0";
    #fsType = "ext4";
    options = [ "nofail" ];
  };
  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Define a user accounts. Don't forget to set a password with ‘passwd’.
  programs.zsh.enable = true;
  users.extraUsers =
  {
    root =
    {
      password = "nixos";
      openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDYAViDcLkA+y6U+Gl9gxzGRGiZVu1B5QaIciRAPbumoH3yGLGzXrrRqRctV1rhf6aX+LISeVQtPbeCSZR054Z2BRZ0VwbPg53hlZ+xnMGLf8pukgWcSryqKw/Tn/58BQTjul4Em7Xc2Mjl+2wNGTh/tFD4ZMgvqB8lR1n/c6dDdRBJRoxyc8Yao2cXhAATtasDZ/YwK/CY97C1OhUxgI9ByTbn2fCsvTDjOHgmRSEGg8fcnHxNgboOsHHygFoI22cbZBe7+NrScXmK0xPVEAmyfIFXsjwx0V5pI5XNB+C19up2x8TXlE/npX5GDuQRgibXUrW163ItsEoVgxLsrOmnLXjGKUTmpCzQ2e6VV8vHIq4gupy2nqO9dMPNM4lP39ZTU5j8NptWXgHIKcMCclj6QYV6sVSKOokjiEp7maN7tQ24ZfxRJjsxUO5HvRuzrgLiKeRdfSiaREdszWT/gPW5tT4FDDmbGwMoKWOMb8BMrwYtnTlUTsPl00Y+cET4mgz7POFEqCzLRat+76Cd2qMVAqWkjv37R08pDMpViKlR6wb8YXPHfgIfyYGmXyDnQwH1AB/jQsSBOprx3e/BD/pGfwrXftQb+hhdg0mWr0WEikf9+SgIm/w1NdWcypHPXCSOQa6wfWjl2Zb8dtlBrd4QkD+hXgn3by9AKHM/INXnWw== iPad" ];
    };
    bauerdic =
    {
       extraGroups = [ "wheel" "networkmanager" ];
       uid = 6170;
       shell = "/run/current-system/sw/bin/zsh";
       isNormalUser = true;
       openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDYAViDcLkA+y6U+Gl9gxzGRGiZVu1B5QaIciRAPbumoH3yGLGzXrrRqRctV1rhf6aX+LISeVQtPbeCSZR054Z2BRZ0VwbPg53hlZ+xnMGLf8pukgWcSryqKw/Tn/58BQTjul4Em7Xc2Mjl+2wNGTh/tFD4ZMgvqB8lR1n/c6dDdRBJRoxyc8Yao2cXhAATtasDZ/YwK/CY97C1OhUxgI9ByTbn2fCsvTDjOHgmRSEGg8fcnHxNgboOsHHygFoI22cbZBe7+NrScXmK0xPVEAmyfIFXsjwx0V5pI5XNB+C19up2x8TXlE/npX5GDuQRgibXUrW163ItsEoVgxLsrOmnLXjGKUTmpCzQ2e6VV8vHIq4gupy2nqO9dMPNM4lP39ZTU5j8NptWXgHIKcMCclj6QYV6sVSKOokjiEp7maN7tQ24ZfxRJjsxUO5HvRuzrgLiKeRdfSiaREdszWT/gPW5tT4FDDmbGwMoKWOMb8BMrwYtnTlUTsPl00Y+cET4mgz7POFEqCzLRat+76Cd2qMVAqWkjv37R08pDMpViKlR6wb8YXPHfgIfyYGmXyDnQwH1AB/jQsSBOprx3e/BD/pGfwrXftQb+hhdg0mWr0WEikf9+SgIm/w1NdWcypHPXCSOQa6wfWjl2Zb8dtlBrd4QkD+hXgn3by9AKHM/INXnWw== iPad"
       ];
    };
  };

  security = {
    sudo.extraRules = [
      { users = [ "bauerdic" ];
        commands = [ { command = "ALL"; options = [ "NOPASSWD" "SETENV" ]; } ];
      }
    ];
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  services.syncthing = {
    enable = true;
    dataDir = "/home/bauerdic/.config/syncthing";
    user = "bauerdic";
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?

}
