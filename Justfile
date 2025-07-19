hostname := "macbook12"

default:
    @just --list

build:
    nix build .#darwinConfigurations.{{hostname}}.system --extra-experimental-features 'nix-command flakes'

apply:
    sudo ./result/sw/bin/darwin-rebuild switch --flake .#{{hostname}}

clean:
    sudo ./result/sw/bin/darwin-uninstaller
