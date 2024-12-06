{ pkgs, lib, config, ... }: {
  options = {
    git.enable = lib.mkEnableOption "enables git with configuration";
  };
  config = lib.mkIf config.git.enable {
    programs.gpg.enable = true;
    programs.git = {
      enable = true;
      userEmail = "jpedro.porta@gmail.com";
      userName = "jpporta";
      extraConfig = {
        init = { defaultBranch = "main"; };
        push = { autoSetupRemote = true; };
      };
      signing = {
        signByDefault = true;
        key = "8D14921A3738E07E";
      };
    };
    home.packages = with pkgs; [ lazygit pinentry ];
  };
}
