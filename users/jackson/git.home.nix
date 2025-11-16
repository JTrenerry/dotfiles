{
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          email = [ "105094182+JTrenerry@users.noreply.github.com" ];
          name = "JTrenerry";

        };
      };
    };

    lazygit = {
      enable = true;
      settings = {
        gui = {
          # showFileTree = false;

          theme = {
            activeBorderColor = [
              "blue"
              "bold"
            ];
            selectedLineBgColor = [ "white" ];
          };
        };
        git = {
          log.order = "default";

          fetchAll = false;
        };
      };
    };
  };

  home.shellAliases = {
    lg = "lazygit";

    gfu = "git fetch upstream";
    gfo = "git fetch origin";
  };
}
