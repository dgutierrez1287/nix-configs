{config, pkgs, ...}: {

    environment.systemPackages = with pkgs; [
		openconnect
        remmina # RDP over x11
	];

	services.squid = {
		enable = true;
		proxyPort = 3128;
		configText = ''
	acl localnet src 0.0.0.1-0.255.255.255  # RFC 1122 "this" network (LAN)
	acl localnet src 10.0.0.0/8             # RFC 1918 local private network (LAN)
	acl localnet src 100.64.0.0/10          # RFC 6598 shared address space (CGN)
	acl localnet src 169.254.0.0/16         # RFC 3927 link-local (directly plugged) machines
	acl localnet src 172.16.0.0/12          # RFC 1918 local private network (LAN)
	acl localnet src 192.168.0.0/16         # RFC 1918 local private network (LAN)
	acl localnet src fc00::/7               # RFC 4193 local private network range
	acl localnet src fe80::/10              # RFC 4291 link-local (directly plugged) machines
	acl SSL_ports port 443
	acl Safe_ports port 80          # http
	acl Safe_ports port 21          # ftp
	acl Safe_ports port 443         # https
	acl Safe_ports port 70          # gopher
	acl Safe_ports port 210         # wais
	acl Safe_ports port 1025-65535  # unregistered ports
	acl Safe_ports port 280         # http-mgmt
	acl Safe_ports port 488         # gss-http
	acl Safe_ports port 591         # filemaker
	acl Safe_ports port 777         # multiling http
	acl CONNECT method CONNECT
	http_access deny !Safe_ports
	http_access deny CONNECT !SSL_ports
	http_access allow localhost manager
	http_access deny manager
	http_access allow localhost
	http_access allow all
    http_port 3128
    cache_log       syslog
    access_log      stdio:/var/log/squid/access.log
    cache_store_log stdio:/var/log/squid/store.log
    pid_filename    /run/squid.pid
    cache_effective_user squid squid
	coredump_dir /var/spool/squid
	refresh_pattern ^ftp:           1440    20%     10080
	refresh_pattern ^gopher:        1440    0%      1440
	refresh_pattern -i (/cgi-bin/|\?) 0     0%      0
	refresh_pattern \/(Packages|Sources)(|\.bz2|\.gz|\.xz)$ 0 0% 0 refresh-ims
	refresh_pattern \/Release(|\.gpg)$ 0 0% 0 refresh-ims
	refresh_pattern \/InRelease$ 0 0% 0 refresh-ims
	refresh_pattern \/(Translation-.*)(|\.bz2|\.gz|\.xz)$ 0 0% 0 refresh-ims
	refresh_pattern .               0       20%     4320
	'';
	};

    networking.extraHosts = 
    ''
    10.223.88.73 dev-ngd-proxy
    10.223.88.71 dev-squid-proxy
      
    10.223.88.138 test-ngd-proxy

    10.223.88.234 impl-ngd-proxy-a
    10.223.88.202 impl-ngd-proxy-b 
    10.223.88.210 impl-ngd-proxy-c
    10.223.88.230 impl-squid-proxy

    10.223.89.10 prod-ngd-proxy-a
    10.223.89.23 prod-ngd-proxy-b
    10.223.89.40 prod-ngd-proxy-c
    10.223.89.4 prod-squid-proxy
    '';
}
