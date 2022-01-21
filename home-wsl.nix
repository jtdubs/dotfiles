{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jtdubs";
  home.homeDirectory = "/home/jtdubs";

  # Packages to install
  home.packages = [
    # pkgs is the set of all packages in the default home.nix implementation
    pkgs.exa
    pkgs.git
    pkgs.neovim
    pkgs.tmux
    pkgs.noto-fonts
  ];

  # Config files
  home.file.".bashrc".source = ./home/.bashrc;
  home.file.".bash_login".source = ./home/.bash_login;
  home.file.".bash_aliases".source = ./home/.bash_aliases;
  home.file.".gitconfig".source = ./home/.gitconfig;
  home.file.".profile".source = ./home/.profile;
  home.file.".ssh/environment".source = ./home/.ssh/environment;
  home.file.".tmux.conf".source = ./home/.tmux.conf;
  home.file.".tmux.conf.local".source = ./home/.tmux.conf.local;
  home.file.".config/nvim/init.vim".source = ./home/.config/nvim/init.vim;
  home.file.".config/nvim/autoload/plug.vim".source = ./home/.config/nvim/autoload/plug.vim;
  home.file.".config/nvim/colors/custom-theme.vim".source = ./home/.config/nvim/colors/custom-theme.vim;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
