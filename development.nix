{ config, pkgs, ... }: # Dit zorgt dat 'pkgs' (de pakketlijst) beschikbaar is

{
  environment.systemPackages = with pkgs; [
	vscode
	python3
	neovim
  ];
}
