{
 flake.nixosModules.gnome = { config, pkgs, ... }: {
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Clavier X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };
 };
}
