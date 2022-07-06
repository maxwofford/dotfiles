{ ... }:
{
  services.fail2ban = {
    enable = true;
    maxretry = 5;
    ignoreIP = [
      "100.64.0.0/10" # Tailscale IP range (https://tailscale.com/kb/1015/100.x-addresses/)
    ];
  };
}