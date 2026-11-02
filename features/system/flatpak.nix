{
  flake.nixosModules.flatpak = { pkgs, ... }: {
    # Active le service Flatpak
    services.flatpak.enable = true;

    # Indispensable sous Niri/Wayland pour les boîtes de dialogue de fichiers et le partage d'écran
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = "*";
    };

    # Ajoute automatiquement le dépôt Flathub au démarrage si absent
    systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
        flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
      '';
    };
  };
}
