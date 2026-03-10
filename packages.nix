{ pkgs, ... }:

{
  # Systeem-brede pakketten
  environment.systemPackages = with pkgs; [
    librewolf
    hyprland
    libreoffice
    git
    curl
    wget
    vim
    zsh
    docker
    ani-cli
    lobster
    obsidian
    exfat
    exfatprogs
    gh
    btop
    lazygit
    kitty
    # Voeg hier je nieuwe aanraders toe:
    fzf
    eza
    zoxide
  ];

  # Gebruiker-specifieke pakketten (optioneel, maar netjes)
  users.users.brik.packages = with pkgs; [
    # Pakketten die je alleen voor brik wilt, kun je hier herhalen of verplaatsen
  ];
}
