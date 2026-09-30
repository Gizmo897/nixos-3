{
  flake.nixosModules.nvidia = { config, pkgs, ... }: {
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    
    hardware.nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = true; 
    };
    
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1"; 
    };

    # Outil pour la luminosité de l'écran
    environment.systemPackages = with pkgs; [
      brightnessctl
    ]; # <-- Vérifie bien la présence de ce point-virgule !
  };
}
