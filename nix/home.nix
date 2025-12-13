let
  username = "uwu";
in
{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = "/home/" + username;

  imports = [
    ./gpg/gpg.nix
  ];

  home.stateVersion = "26.05";

  home.file = {
    Downloads.source = config.lib.file.mkOutOfStoreSymlink (
      config.home.homeDirectory + "/Mass_Storage/Downloads"
    );
  };

  programs.git = {
    enable = true;
    signing = {
      format = "openpgp";
      signByDefault = true;
      key = "F3D0D8EBCBD04FA7";
    };
    settings = {
      user = {
        name = "nikolaizombie1";
        email = "fabio.matos999@gmail.com";
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
