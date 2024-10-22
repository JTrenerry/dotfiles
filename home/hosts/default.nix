{ config, lib, ... }:

with lib;

{
  options.colours = {
    # Colours
    col1 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 1";
    };
    col2 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 2";
    };
    col3 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 3";
    };
    col4 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 4";
    };
    col5 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 5";
    };
    col6 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 6";
    };
    col7 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 7";
    };
    col8 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 8";
    };
    col9 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 9";
    };
    col10 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 10";
    };
    col11 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 11";
    };
    col12 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 12";
    };
    col13 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 13";
    };
    col14 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 14";
    };
    col15 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 15";
    };
    col16 = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Color 16";
    };
    # Stylix
    kebab = mkOption {
      type = types.str;
      default = "";  # Default set to ""
      description = "Stylix theme.";
    };
  };
}
