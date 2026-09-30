{
  flake.nixosModules.containers = { config, pkgs, ... }: {
    # Podman et conteneurs
    virtualisation.containers.enable = true;
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    # Paquets liés à la gestion des conteneurs
    environment.systemPackages = with pkgs; [
      distrobox
      boxbuddy
      podman-compose
    ];
  };
}
