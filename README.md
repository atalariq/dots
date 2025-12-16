
> Atalariq's dotfiles powered with `nix` + `nix-darwin` (MacOS) + `home-manager`

# Dots

Dotfiles are hidden configuration files in Unix-based systems (like macOS and Linux) that begin with a dot (e.g., `.bashrc`, `.vimrc`, `.gitconfig`). They store user-specific settings for various applications, shells, and tools, allowing for customization and consistency across different systems. By managing dotfiles, users can easily replicate their preferred environment on new machines or across multiple devices. 

Nix is a powerful, declarative, and reproducible package manager and build system for Unix-like systems

## Why use Nix?

Because my current setup (old MBP laptop with MacOS Monterey 12.7.6) doesn't get Homebrew's support anymore, so I must find the alternative. In that journey, I found two candidate: MacPorts and Nix. In the beginning, I use ...

> NOTES (2025-12-17): Recently, Newer Nix version (25.11+) [doesn't support Monterey anymore](https://discourse.nixos.org/t/macos-12-7-6-cant-install-nix-info-mkfifoat-symbol-not-found/72271/5)... So, version 25.05 are the latest version for my Old Mac (`macbook12`). I also drop the yabai, et al. 

## Installation

1. Install Nix (I use Lix)

Make sure to use the Nix Official Upstream

```sh
curl -sSf -L https://install.lix.systems/lix | sh -s -- install
```

After that, you should be able to run:

```sh
nix --version
```

2. Clone this repository

```sh
git clone https://github.com/atalariq/dots
cd dots
```

3. Build nix-darwin configuration

> Change the hostname!

```sh
nix build .#darwinConfigurations.{{hostname}}.system --extra-experimental-features 'nix-command flakes'
```

4. Apply it!

> Change the hostname!

```
sudo ./result/sw/bin/darwin-rebuild switch --flake .#{{hostname}}
```

5. Enjoy!


### Bootstrap Installer

```sh
curl -sSf -L https://install.lix.systems/lix | sh -s -- install
git clone https://github.com/atalariq/dots
cd dots
nix build .#darwinConfigurations.{{hostname}}.system --extra-experimental-features 'nix-command flakes'
sudo ./result/sw/bin/darwin-rebuild switch --flake .#{{hostname}}
```

### Uninstall

```
sudo ./result/sw/bin/darwin-uninstaller
cd ..
/nix/nix-installer uninstall
```

## References

- [Nix](https://nixos.org/)
- [nix-darwin](https://github.com/nix-darwin/nix-darwin) | [Manual](https://nix-darwin.github.io/nix-darwin/manual/index.html)
- [home-manager](https://github.com/nix-community/home-manager) | [Manual](https://nix-community.github.io/home-manager/)
- [MacOS' defaults](https://macos-defaults.com/) | [Repo](https://github.com/yannbertrand/macos-defaults)

Another guide/tutorial that useful about Nix:

- https://nix.dev/
- https://nixcloud.io/tour/
- https://zero-to-nix.com/

Honorable Mentions:

- [ryan4yin/nixos-and-flakes-book](https://github.com/ryan4yin/nixos-and-flakes-book)
- [ryan4yin/nix-darwin-kickstarter](https://github.com/ryan4yin/nix-darwin-kickstarter)
- [awesome-nix](https://github.com/nix-community/awesome-nix)
