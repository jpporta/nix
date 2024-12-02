{ pkgs, lib, config, ...}: {

	options = {
		workapps.enable = lib.mkEnableOption "enables work desktop apps";
	};
	config = lib.mkIf config.workapps.enable {
				home.packages = with pkgs; [
						slack
						openvpn
				];
		};
}
