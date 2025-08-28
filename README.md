# Nix Config for Multi-Host / Multi-Computer Setup

This Nix configuration is designed to handle multiple users and multiple hosts.

It uses [CommoNix](https://github.com/McArthur-Alford/commonix) to organise everything neatly.

It is split into four main parts: hosts, users, modules, and settings.

## Hosts
Hosts define per-host configuration and therefore have `.nix` files but no `.home.nix` files.  
This includes things like hardware, locale, and user setup.

## Users
Users are defined per-user and have `.home.nix` files but no `.nix` files.  
This includes things like Git configuration, editors, and browsers.

## Modules
Modules are any package or configuration that can be imported by a user or host file.  
They should be self-contained and not require outside imports (unless the module itself imports them).  

Modules can include everything from desktop environments and code editors to greeters.

## Settings
Settings define configurations for both users and hosts for CommoNix.  
This includes things like `nixPath`, users, and themes.

## Theming
Theming is primarily handled by Stylix and by specifying a theme in `settings/users`, as well as a kebab version for Stylix base16 and/or an icon package.  

To have no theming, use `null` or omit the theme option. This will just not import stylix and
you can use your own themeing or no themeing

# Using This for Your Own Setup

## Concept

The main idea behind this layout is to keep everything "bundled."  

For example, when defining the desktop environment in `settings/users`, you only need the name of the module, e.g., `niri`.  

From there, it will find both `niri.home.nix` and `niri.nix` and import them. If your desktop module depends on something else, it should import it itself.  

Each file is designed to be self-contained and work independently, assuming its imports are available.

### Example Structure

```
.
├── hosts
│   ├── glaceon
│   │   └── users
│   └── mimikyu
├── modules
│   ├── bootloader
│   ├── desktop
│   ├── greeter
│   ├── kernel
│   ├── nix
│   ├── programs
│   │   └── neovim
│   │       ├── dev
│   │       └── plugins
│   ├── protocol
│   ├── scripts
│   ├── services
│   ├── shell
│   ├── terminal
│   └── themes
├── settings
│   ├── hosts
│   └── users
└── users
    └── jackson
        └── glaceon  
```

## Creating a New Host

### `settings/hosts/`

1. Create a new `.nix` file in `settings/hosts` matching the desired hostname.  
2. Set options such as:

```nix
{
  hostname = "glaceon";         # Hostname of your computer
  system = "x86_64-linux";      # System architecture
  kernel = "latest";             # Kernel version (usually latest)
  users = [ "jackson" ];         # Users to add
  stateVersion = "24.05";        # Current state version in your dotfiles
  trustedUsers = [ "jackson" ];  # Trusted users
  nixPath = "/home/jackson/Documents/Code/nix"; # Path to Nix config (default is /etc/nixos)
  misc = {};                     # Additional options (optional)
}
````

### `hosts/`

All hosts should have `hosts/default.nix` defining common packages, such as a backup editor, Git, and locales.

Per-host configurations go in folders named after the host, e.g., `glaceon`.

This folder contains host-specific settings like services and hardware configurations.
It also has a `users` folder for per-user, per-host Nix configuration (e.g., groups, scripts, or packages).

## Creating a New User

### `settings/users/`

1. Create a `.nix` file in `settings/users` matching the username.
2. Set options such as:

```nix
{
  user = "jackson";               # Username
  theme = "rose-pine-moon";       # Stylix theme
  gui = {
    default = {                    # Default desktop and protocol
      desktop = "niri";            # Module in /modules/desktop/niri
      protocol = "wayland";        # Module in /modules/protocol/wayland
    };
    # Additional GUI setups can be defined here
  };
  misc = {                        # Miscellaneous user config
    kebab = "rose-pine-moon";
    icon = "rose-pine-icon-theme";
  };
}
```

### `users/`

All files here should be `.home.nix` files, managed by Home Manager.

`users/default.home.nix` defines the baseline configuration for all users:

```nix
programs.home-manager.enable = true;

home.username = "${userSettings.user}";
home.homeDirectory = "/home/${userSettings.user}";
home.stateVersion = systemSettings.stateVersion;
```

Each user should have their own folder with at least a `default.home.nix` file.

This file imports modules the user should have on any computer, e.g., Firefox, text editors, or Git configuration.

There can also be per-host folders for the user to define host-specific packages and configurations.

## Creating a New Module

A module is simply a `.nix` or `.home.nix` file that performs a single task (e.g., configures or installs one package).

Modules are organised into subfolders for clarity, e.g., `desktop`, `protocol`, `kernel`.

Plan ahead to keep your configuration modular and maintainable.
