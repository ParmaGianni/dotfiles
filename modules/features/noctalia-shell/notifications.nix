{
  flake.aspects.noctalia.config = {
    settings.notifications = {
      backgroundOpacity = 1;
      clearDismissed = true;
      criticalUrgencyDuration = 15;
      density = "default";
      enableBatteryToast = true;
      enableKeyboardLayoutToast = true;
      enableMarkdown = false;
      enableMediaToast = false;
      enabled = true;
      location = "top_right";
      lowUrgencyDuration = 3;
      monitors = [];
      normalUrgencyDuration = 8;
      overlayLayer = true;
      respectExpireTimeout = false;
      saveToHistory = {
        critical = true;
        low = true;
        normal = true;
      };
      sounds = {
        criticalSoundFile = "";
        enabled = false;
        excludedApps = "discord,firefox,chrome,chromium,edge";
        lowSoundFile = "";
        normalSoundFile = "";
        separateSounds = false;
        volume = 0.5;
      };
    };
  };
}
