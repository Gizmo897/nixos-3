{ self, inputs, ... }: {

  flake.nixosModules.myMachineConfiguration = { pkgs, lib, ... }: {
    # import any other modules from here
    imports = [
      self.nixosModules.nixos-hardware
      self.nixosModules.user-gizmo
      self.nixosModules.gaming
      self.nixosModules.containers
      self.nixosModules.printing
      self.nixosModules.audio
      self.nixosModules.nvidia
      self.nixosModules.niri
      self.nixosModules.gnome
      self.nixosModules.nix-settings
      self.nixosModules.local
    ];

    # Bootloader & Kernel
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # Réseau[cite: 5]
    networking.hostName = "nixos";
    networking.networkmanager.enable = true;
    
    # Version de l'état du système (ne pas modifier)[cite: 5]
    system.stateVersion = "25.11";
  };
}
