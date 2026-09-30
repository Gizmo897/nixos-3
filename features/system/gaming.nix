{
  flake.nixosModules.gaming = { config, pkgs, ... }: {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  
    # Optimisation pour le jeu
    programs.gamemode.enable = true;
  };
}
