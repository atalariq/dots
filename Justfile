hostname := "macbook12"

default:
    @just --list

darwin:
  nix build .#darwinConfigurations.{{hostname}}.system --extra-experimental-features 'nix-command flakes'
  sudo ./result/sw/bin/darwin-rebuild switch --flake .#{{hostname}}

darwin-debug:
  nix build .#darwinConfigurations.{{hostname}}.system --show-trace --verbose --extra-experimental-features 'nix-command flakes'
  sudo ./result/sw/bin/darwin-rebuild switch --flake .#{{hostname}} --show-trace --verbose

clean:
    sudo ./result/sw/bin/darwin-uninstaller

