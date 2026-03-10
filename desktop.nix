{ config, pkgs, ... }:

{
  # 1. Hyprland inschakelen
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # 2. Portal instellen (nodig voor Omarchy scripts/screensharing)
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # 3. Omarchy/Hyprland specifieke settings
  # Je kunt hier ook systeem-brede variabelen zetten die Omarchy nodig heeft
  environment.sessionVariables = {
    # Als je een NVIDIA kaart hebt, zijn deze vaak nodig:
    # LIBVA_DRIVER_NAME = "nvidia";
    # GBM_BACKEND = "nvidia-drm";
    # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    
    # Voor Wayland ondersteuning in apps:
    NIXOS_OZONE_WL = "1";
  };
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
}
