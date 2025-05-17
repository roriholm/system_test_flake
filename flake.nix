{
  description = "NixOS configuration with test";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem (import ./system.nix);

    checks.x86_64-linux.test = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in pkgs.testers.runNixOSTest {
      name = "configuration-test";
      nodes.machine = { config, pkgs, ... }: {
        imports = [ ./configuration.nix ];
      };

      testScript = ''
        machine.start()
        machine.wait_for_unit("multi-user.target")
      '';
    };
  };
}
