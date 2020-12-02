{config, pkgs, ...}: 
{
  config.networking.nat = {
    enable = true;
    externalInterface = "ens3";
    internalInterfaces = [ "wg0" ];
  };

  config.networking.wireguard.interfaces.wg0 = {
    ips = [ "10.0.0.1/24" ];
    listenPort = 60990;
    privateKeyFile = "/etc/nixos/wg-priv";

# This allows the wireguard server to route your traffic to the internet
# you have to set the dnsserver IP of your router (or dnsserver of choice) in your clients

    postSetup = ''
      ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o ens3 -j MASQUERADE
    '';

    postShutdown = ''
      ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.0.0.0/24 -o ens3 -j MASQUERADE
    '';

    peers = [
      {
        publicKey = "cP3x2nSm3P5jvrTqjEroG5iKIRCi6k5jwvgLvAsi6Cg=";
        allowedIPs = [ "10.0.0.2/32" ];
        persistentKeepalive = 25;
      }
    ];
  };
}

