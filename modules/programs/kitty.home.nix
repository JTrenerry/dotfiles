{ ... }:

{
  programs = {
    kitty = {
      enable = true;
      settings = {
        clipboard_control = "write-clipboard no-ask read-clipboard no-ask";
      };
    };
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };
}
