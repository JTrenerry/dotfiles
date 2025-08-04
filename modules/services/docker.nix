_: {
  virtualisation.docker = {
    enable = true;
    # Configure Docker to use a registry mirror
    daemon.settings = {
      registry-mirrors = ["https://docker.xuanyuan.me"];
    };
  };
}
