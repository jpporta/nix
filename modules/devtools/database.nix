{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ dbeaver-bin redis ];
}
