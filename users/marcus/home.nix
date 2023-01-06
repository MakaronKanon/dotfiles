{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "marcus";
  home.homeDirectory = "/home/marcus";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    alacritty
    tmux
    gimp
    spotify
    dropbox-cli
    obsidian
    wget
    xorg.xkbcomp

    xcape
    discord
    slack
    flameshot
    dunst
    bat
    zoxide
    polybar
    rofi

    rnix-lsp
    gopls
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;

    plugins = [
      pkgs.vimExtraPlugins.gruvbox-baby
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      pkgs.vimPlugins.nvim-lspconfig
    ];
  };

  programs.git = {
    enable = true;
    userName = "Marcus Jörgensson";
    userEmail = "marcusjorgensson@gmail.com";
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = ["git"];
    };
    initExtra = ''
      eval "$(zoxide init zsh)"
    '';
  };

  services.picom = {
    enable = true;
    opacityRules = [
      "95:class_g = 'Alacritty' && focused"
      "90:class_g = 'Alacritty' && !focused"
      "0:_NET_WM_STATE@[0]:32a = '_NET_WM_STATE_HIDDEN'"
    ];
    vSync = true;
    backend = "glx";

  };

  services.redshift = {
    enable = true;
    latitude = 57.70716;
    longitude = 11.96679;
  };

  home.file = {
    ".config/alacritty/alacritty.yaml".text = ''
      window:
        opacity: 1
    '';
  };

  home.file.".config/i3/config".source = ./config/i3/config;
  home.file.".config/xkb/symbols/vikingdvorak".source = ./config/xkb/symbols/vikingdvorak;
  home.file.".config/polybar/launch.sh".source = ./config/polybar/launch.sh;

  home.sessionVariables = {
    EDITOR = "nvim";
  };


  xdg.configFile.nvim = {
    source = ./config/nvim;
    recursive = true;
  };

}
