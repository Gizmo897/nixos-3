{ lib, config, modulesPath, ... }:

{
  flake.nixosModules.nixos-hardware = { lib, config, modulesPath, ... }: {
    imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];
    
    # Ta configuration matérielle[cite: 7]
    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "uas" "usbhid" "sd_mod" ];
    boot.kernelModules = [ "kvm-amd" ];
    
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/7bbb00d5-948c-4db6-9af4-26c6ab9fcf7a";
      fsType = "ext4";
    };
    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/A417-4447";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
