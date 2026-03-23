{
  flake.aspects.noctalia.settings.bar = {
    autoHideDelay = 500;
    autoShowDelay = 150;
    backgroundOpacity = 0.93;
    barType = "floating";
    capsuleColorKey = "none";
    capsuleOpacity = 1;
    density = "default";
    displayMode = "always_visible";
    floating = true;
    frameRadius = 12;
    frameThickness = 8;
    hideOnOverview = false;
    marginHorizontal = 4;
    marginVertical = 4;
    monitors = [];
    outerCorners = true;
    position = "right";
    screenOverrides = [];
    showCapsule = true;
    showOutline = false;
    useSeparateOpacity = false;
    widgets = {
      center = [
        {
          characterCount = 2;
          colorizeIcons = false;
          emptyColor = "secondary";
          enableScrollWheel = true;
          focusedColor = "primary";
          followFocusedScreen = false;
          groupedBorderOpacity = 1;
          hideUnoccupied = false;
          iconScale = 0.8;
          id = "Workspace";
          labelMode = "index";
          occupiedColor = "secondary";
          pillSize = 0.6;
          showApplications = false;
          showBadge = true;
          showLabelsOnlyWhenOccupied = true;
          unfocusedIconsOpacity = 1;
        }
      ];
      left = [
        {
          colorizeDistroLogo = false;
          colorizeSystemIcon = "tertiary";
          customIconPath = "";
          enableColorization = true;
          icon = "snowflake";
          id = "ControlCenter";
          useDistroLogo = true;
        }
        {
          icon = "rocket";
          iconColor = "none";
          id = "Launcher";
        }
        {
          clockColor = "none";
          customFont = "";
          formatHorizontal = "HH:mm ddd, MMM dd";
          formatVertical = "MM dd --- HH mm";
          id = "Clock";
          tooltipFormat = "HH:mm ddd, yyyy-MM-dd";
          useCustomFont = false;
        }
        {
          compactMode = true;
          diskPath = "/";
          iconColor = "none";
          id = "SystemMonitor";
          showCpuFreq = false;
          showCpuTemp = true;
          showCpuUsage = true;
          showDiskAvailable = false;
          showDiskUsage = false;
          showDiskUsageAsPercent = false;
          showGpuTemp = false;
          showLoadAverage = false;
          showMemoryAsPercent = false;
          showMemoryUsage = true;
          showNetworkStats = false;
          showSwapUsage = false;
          textColor = "none";
          useMonospaceFont = true;
          usePadding = false;
        }
      ];
      right = [
        {
          blacklist = [];
          chevronColor = "none";
          colorizeIcons = false;
          drawerEnabled = true;
          hidePassive = false;
          id = "Tray";
          pinned = [];
        }
        {
          hideWhenZero = false;
          hideWhenZeroUnread = false;
          iconColor = "none";
          id = "NotificationHistory";
          showUnreadBadge = true;
          unreadBadgeColor = "primary";
        }
        {
          deviceNativePath = "__default__";
          displayMode = "icon-always";
          hideIfIdle = false;
          hideIfNotDetected = false;
          id = "Battery";
          showNoctaliaPerformance = false;
          showPowerProfiles = false;
        }
        {
          displayMode = "onhover";
          iconColor = "none";
          id = "Volume";
          middleClickCommand = "pwvucontrol || pavucontrol";
          textColor = "none";
        }
        {
          applyToAllMonitors = false;
          displayMode = "onhover";
          iconColor = "none";
          id = "Brightness";
          textColor = "none";
        }
      ];
    };
  };
}
