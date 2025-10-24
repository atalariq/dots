hostname := "macbook12"

default:
  @just --list

darwin:
  nix build .#darwinConfigurations.{{hostname}}.system --extra-experimental-features 'nix-command flakes'
  sudo ./result/sw/bin/darwin-rebuild switch --flake .#{{hostname}}

darwin-update:
  nix flake update
  nix build .#darwinConfigurations.{{hostname}}.system --extra-experimental-features 'nix-command flakes'
  sudo ./result/sw/bin/darwin-rebuild switch --flake .#{{hostname}}

darwin-debug:
  nix build .#darwinConfigurations.{{hostname}}.system --show-trace --verbose --extra-experimental-features 'nix-command flakes'
  sudo ./result/sw/bin/darwin-rebuild switch --flake .#{{hostname}} --show-trace --verbose

uninstall:
  sudo ./result/sw/bin/darwin-uninstaller

# WARN: This will delete all the previous generations (FOREVER) and only keep the current generation. It also will make your next run download some dependencies again.
clean:
  nix-collect-garbage -d

