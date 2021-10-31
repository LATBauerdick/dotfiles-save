{ config, pkgs, ... }: {
  imports = [
    ./shared.nix
    ./networking.nix
    ./wireguard.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.devices = [ "/dev/sda" ];

  networking.useDHCP = false;
  networking.interfaces.ens3.useDHCP = true;
  # 8385 for syncthing WebGUI port forward, 838x for my reverse tunnel
  networking.firewall.allowedTCPPorts = [ 8385 8386 8387 8388 8389 8888 8080 32401 ];
  # open firewall ports for mosh, wireguard
  networking.firewall.allowedUDPPortRanges = [
    { from = 60001; to = 61000; }
  ];

#  on Hetzner this is how to mount providet volumes
#   fileSystems."/mnt/latb-data" =
#    { device = "/dev/disk/by-id/scsi-0HC_Volume_11897569";
#      fsType = "ext4";
#    };


  users.users.root.initialHashedPassword = "";
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDYAViDcLkA+y6U+Gl9gxzGRGiZVu1B5QaIciRAPbumoH3yGLGzXrrRqRctV1rhf6aX+LISeVQtPbeCSZR054Z2BRZ0VwbPg53hlZ+xnMGLf8pukgWcSryqKw/Tn/58BQTjul4Em7Xc2Mjl+2wNGTh/tFD4ZMgvqB8lR1n/c6dDdRBJRoxyc8Yao2cXhAATtasDZ/YwK/CY97C1OhUxgI9ByTbn2fCsvTDjOHgmRSEGg8fcnHxNgboOsHHygFoI22cbZBe7+NrScXmK0xPVEAmyfIFXsjwx0V5pI5XNB+C19up2x8TXlE/npX5GDuQRgibXUrW163ItsEoVgxLsrOmnLXjGKUTmpCzQ2e6VV8vHIq4gupy2nqO9dMPNM4lP39ZTU5j8NptWXgHIKcMCclj6QYV6sVSKOokjiEp7maN7tQ24ZfxRJjsxUO5HvRuzrgLiKeRdfSiaREdszWT/gPW5tT4FDDmbGwMoKWOMb8BMrwYtnTlUTsPl00Y+cET4mgz7POFEqCzLRat+76Cd2qMVAqWkjv37R08pDMpViKlR6wb8YXPHfgIfyYGmXyDnQwH1AB/jQsSBOprx3e/BD/pGfwrXftQb+hhdg0mWr0WEikf9+SgIm/w1NdWcypHPXCSOQa6wfWjl2Zb8dtlBrd4QkD+hXgn3by9AKHM/INXnWw=="
  ];

  services.openssh.permitRootLogin = "prohibit-password";
  services.openssh.gatewayPorts = "yes";

  programs.zsh.enable = true;
  programs.mosh.enable = true;

# needed for syncthing
  boot.kernel.sysctl = {
    # Note that inotify watches consume 1kB on 64-bit machines.
    "fs.inotify.max_user_watches"   =  204800;   # default:  8192
  #  "fs.inotify.max_user_instances" =    1024;   # default:   128
  #  "fs.inotify.max_queued_events"  =   32768;   # default: 16384
  };

  services.syncthing = {
    enable = true;
    dataDir = "/home/bauerdic/";
    user = "bauerdic";
  };

  nix.trustedUsers = [ "root" "bauerdic" ];
}
