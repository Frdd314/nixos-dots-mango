{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    zsh-powerlevel10k
  ];

  programs.zsh = {
    enable = true;
    dotDir = "/home/frdd/.config/zsh/";
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
        file = "powerlevel10k.zsh-theme";
      }
    ];

    shellAliases = {
      btw = "echo i use bullshitOS btw";
      nixrebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos-btw";
      nixgarbage = "sudo nix-collect-garbage";
      nixoldgen = "sudo nix-collect-garbage -d";
      nixoptimise = "sudo nix-store --optimise";
      nixconf = "sudo -E nvim /etc/nixos/configuration.nix";
      nixhome = "sudo -E nvim /etc/nixos/home.nix";
      nixflake = "sudo -E nvim /etc/nixos/flake.nix";
      nixdir = "cd /etc/nixos";
    };

    initContent = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };

  home.file.".p10k.zsh".source = ./.p10k.zsh;
}
