# system_test_flake

Experimenting with how to separate out the testable parts of deployable systems. Use `nix flake check` to validate the system configuration and the test. `configuration.nix` can be passed directly to `runNixOSTest` as a node, and `system.nix` adds the extra values required for a "real" system.
