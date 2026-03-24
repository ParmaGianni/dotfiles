{
  flake.aspects.noctalia.config = {
    settings.sessionMenu = {
      countdownDuration = 10000;
      enableCountdown = true;
      largeButtonsLayout = "grid";
      largeButtonsStyle = true;
      position = "center";
      powerOptions = [
        {
          action = "lock";
          command = "";
          countdownEnabled = true;
          enabled = true;
          keybind = "1";
        }
        {
          action = "suspend";
          command = "";
          countdownEnabled = true;
          enabled = true;
          keybind = "2";
        }
        {
          action = "hibernate";
          command = "";
          countdownEnabled = true;
          enabled = true;
          keybind = "3";
        }
        {
          action = "reboot";
          command = "";
          countdownEnabled = true;
          enabled = true;
          keybind = "4";
        }
        {
          action = "logout";
          command = "";
          countdownEnabled = true;
          enabled = true;
          keybind = "5";
        }
        {
          action = "shutdown";
          command = "";
          countdownEnabled = true;
          enabled = true;
          keybind = "6";
        }
        {
          action = "rebootToUefi";
          command = "";
          countdownEnabled = true;
          enabled = true;
          keybind = "";
        }
      ];
      showHeader = true;
      showKeybinds = true;
    };
  };
}
