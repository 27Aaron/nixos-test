{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    neofetch
    neovim
    just
    wget
    git
    lazygit
    pv

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    tcpdump # network sniffer
    lsof # list open files

    # system monitoring
    sysstat
    iotop
    iftop
    btop
    nmon
    sysbench

    # system tools
    psmisc # killall/pstree/prtstat/fuser/...
    pciutils # lspci
    usbutils # lsusb
    hdparm # for disk performance, command
    parted
  ];

  # replace default editor with neovim
  environment.variables.EDITOR = "nvim";
}
