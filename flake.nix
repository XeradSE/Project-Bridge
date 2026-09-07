{
  description = "Environnement de dev Node.js (Ionic / React TypeScript)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        nodejs_26
        ionic-cli
        android-studio
      ];

      shellHook = ''
        export CAPACITOR_ANDROID_STUDIO_PATH="${pkgs.android-studio}/bin/android-studio"
      '';
    };
  };
}
