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
        jdk21
      ];

      shellHook = ''
        export CAPACITOR_ANDROID_STUDIO_PATH="${pkgs.android-studio}/bin/android-studio"
        export _JAVA_AWT_WM_NONREPARENTING=1
        export JAVA_HOME="${pkgs.jdk21}/lib/openjdk"
      '';
    };
  };
}
