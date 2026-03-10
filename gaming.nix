{ config, pkgs, ... }: # Dit zorgt dat 'pkgs' (de pakketlijst) beschikbaar is

{
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
	heroic       # Voor Epic en GOG
	lutris       # Voor Ubisoft en algemene installers
	bottles      # Alternatief voor geïsoleerde launchers
	mangohud     # Om je FPS te zien in deze games
	protonup-qt
	discord
  ];
}
