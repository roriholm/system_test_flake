{
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    {
      networking.hostName = "my-nixos";
      fileSystems."/" = {
        device = "/dev/disk/by-label/nixos";
        fsType = "ext4";
      };

      boot.loader.grub = {
        enable = true;
        devices = [ "/dev/sda" ];
      };
    }
  ];
}
