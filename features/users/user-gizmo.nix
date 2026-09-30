{
  flake.nixosModules.user-gizmo = { config, pkgs, ... }: {
    users.users.gizmo = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.fish;
    };

    programs.fish.enable = true;

    # Tes paquets personnels
    environment.systemPackages = with pkgs; [
      vim 
      git 
      syncthing
      google-chrome
    ];
  };
}
