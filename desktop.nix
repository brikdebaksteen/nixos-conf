{ config, pkgs, ... }:

{
  # 1. Hyprland inschakelen
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # 2. Portal instellen
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # 3. SDDM met Autologin (omzeilt het zwarte scherm)
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.autoLogin = {
    enable = true;
    user = "brik";
  };

  # 4. Omarchy/Hyprland specifieke settings
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
