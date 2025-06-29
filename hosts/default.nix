{
  inputs,
  systemSettings,
  self,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nix-index-database.nixosModules.nix-index
    "${self}/modules/nix" # Configuration of nix itself!
    "${self}/modules/scripts" # Useful scripts to have on path
    "${self}/modules/programs/nh.nix" # nix helper
    "${self}/modules/programs/thunar.nix"
  ];

  time.timeZone = "Australia/Brisbane";

  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_AU.UTF-8";
      LC_IDENTIFICATION = "en_AU.UTF-8";
      LC_MEASUREMENT = "en_AU.UTF-8";
      LC_MONETARY = "en_AU.UTF-8";
      LC_NAME = "en_AU.UTF-8";
      LC_NUMERIC = "en_AU.UTF-8";
      LC_PAPER = "en_AU.UTF-8";
      LC_TELEPHONE = "en_AU.UTF-8";
      LC_TIME = "en_AU.UTF-8";
    };
  };

  documentation = {
    enable = true;
    nixos.enable = true;
    man.enable = true;
    info.enable = true;
    doc.enable = true;
  };

  fonts.packages = with pkgs; [
    source-code-pro
    font-awesome
    corefonts
    material-design-icons
    nerd-fonts.fira-code
    jetbrains-mono
    comic-mono
  ];

  environment = {
    systemPackages = with pkgs; [
      git
      vim
      neovim
      nil
      wget
      curl
    ];
    variables = {
      SYSTEMD_EDITOR = "vim";
      EDITOR = "vim";
      VISUAL = "vim";
    };
  };

  networking = {
    hostName = systemSettings.hostname;
  };
}
