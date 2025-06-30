# Nix Config For Multi-Host / Multi-Computer Setup.
My personal config for my laptop, although it (should) have the ability to have mutliple users
and multiple hosts, it currently does not, Just glaceon (my school laptop) and jackson
(my personal account).

This config uses [CommoNix](https://github.com/McArthur-Alford/commonix) to help organise
everything nicely.

It is split up to four main parts, hosts, users, modules, and settings

## Hosts
Defines per host configuration and as such has .nix files and no .home.nix files.
Things like hardware, locale and setting up users are defined here.

## Users
Defined per user configuration and as such has .home.nix files and no .nix files.
Things like git configs, editors and browsers are defined here.

## Modules
This is any package or configuration that could be imported by a user / host file.
They should be self contained and not need outside imports (that they do not import themself).
Everything from desktop environments, code editors to greeters.

## Settings
Defines settings for both users and hosts for CommoNix, sets things like nixPath, users, and
themes.

## Themeing
Themeing is handled primary by stylix and by specfiying a theme in settings/users as well as a
kebab version for stylix base16 and / or an icon package. To have no themeing no theme option or
null works.
