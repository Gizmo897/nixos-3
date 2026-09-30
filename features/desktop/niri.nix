{ inputs, self, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.my-niri; # Correction: my-niri
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.my-niri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;

      settings = {
        # Clavier AZERTY natif pour Niri
        input = {
          keyboard = {
            xkb = { layout = "fr"; };
          };
        };

        spawn-at-startup = [
          [ "${self'.packages.myNoctalia}/bin/noctalia-shell" ] # Correction: self'
          [ "${pkgs.xwayland-satellite}/bin/xwayland-satellite" ]
        ];

        environment = {
          DISPLAY = ":0";
        };

        binds = {
          "Mod+Q".spawn = [ "${pkgs.kitty}/bin/kitty" ];
          "Mod+C".close-window = [];
          "Mod+E".spawn = [ "${pkgs.nautilus}/bin/nautilus" ];
          "Mod+G".spawn = [ "${pkgs.google-chrome}/bin/google-chrome-stable" ];
          "Mod+R".spawn = [ "${pkgs.rofi}/bin/rofi" "-show" "drun" ]; # Correction: liste d'arguments
          "Mod+M".quit = [];

          "Mod+Left".focus-column-left = [];
          "Mod+Right".focus-column-right = [];
          "Mod+Up".focus-window-up = [];
          "Mod+Down".focus-window-down = [];
          "Mod+Shift+Left".move-column-left = [];
          "Mod+Shift+Right".move-column-right = [];
          "Mod+Shift+Up".move-window-up = [];
          "Mod+Shift+Down".move-window-down = [];
          "Mod+V".consume-window-into-column = [];
          "Mod+H".expel-window-from-column = [];
        };
      };
    };
  };
}
