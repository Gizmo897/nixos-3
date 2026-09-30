{
  flake.nixosModules.audio = { config, pkgs, ... }: {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    
    # Outils pour gérer le son et les médias
    environment.systemPackages = with pkgs; [
      playerctl
      pavucontrol
    ];
    
  };
}
