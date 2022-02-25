{ pkgs, ... }:
{
  services.cron = {
    enable = true;
    systemCronJobs = [
      # Verify cron is working
      "* * * * *  msw date > /tmp/latest-cron.log"
      # Regularly fetch latest dotfiles from GitHub
      "0 * * * *  msw ${pkgs.git} --git-dir /home/msw/.dotfiles/.git fetch --all"
    ];
  };
}