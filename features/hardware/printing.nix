{
  flake.nixosModules.printing = { config, pkgs, ... }: {
    services.printing.enable = true;
  };
}
