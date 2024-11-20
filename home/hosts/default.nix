{ config, lib, ... }:

with lib;

{
  options.colours = {
    # Colours
    base = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Main and accessory panels";
    };
    surface = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Panels that are not directly related to the focal context";
    };
    overlay = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Panels that are more temporary in nature";
    };
    muted = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Ignored Content";
    };
    subtle = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Secondary content";
    };
    text = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Primary content";
    };
    red = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Red";
    };
    orange = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Orange";
    };
    yellow = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Yellow";
    };
    green = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Green";
    };
    aqua = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Aqua";
    };
    blue = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Blue";
    };
    purple = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "purple";
    };
    highL = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Highlight Low";
    };
    highM = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Highlight Med";
    };
    highH = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Highlight High";
    };


    # Kebab cased
    kebab = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Stylix theme etc.";
    };

    spicetify = mkOption {
      type = types.str;
      default = "";
      description = "Spicetify theme";
    };

    spicetify-theme = mkOption {
      type = types.str;
      default = "";
      description = "Spicetify theme";
    };

    # Icon Package
    icon-package = mkOption {
      type = types.str;
      default = "";
      description = "The icon package to use";
    };
    # Rofi theme
    rofi = mkOption {
      type = types.str;
      default = "";
      description = "Theme for Rofi, should be a path or a named theme";
    };
  };
}
