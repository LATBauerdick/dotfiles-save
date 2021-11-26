{ config, pkgs, ... }: {
  imports = [
    ./vm-shared.nix
  ];

  # Interface is this on Intel qemu
  networking.interfaces.ens3.useDHCP = true;

  # Shared folder to host
  #### fileSystems."/host" = {
  #  fsType = "fuse./run/current-system/sw/bin/vmhgfs-fuse";
  #  device = ".host:/";
  #  options = [
  #    "umask=22"
  #    "uid=1000"
  #    "gid=1000"
  #    "allow_other"
  #    "auto_unmount"
  #    "defaults"
  #  ];
  #};
}
