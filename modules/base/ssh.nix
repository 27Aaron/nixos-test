{
  lib,
  ...
}:
{
  users.users.root = {
    hashedPassword = "$7$CU..../....mTYw28fnKaMzRRszVZhR21$tYH1/Z7DDGft7oGc67h61EBTXZ6JXbuzHJNIYmvYhV1";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKHjMAQUXfyMv8TG1NfqjmQJG3gqZkh25KAvAMvxVrWS Aaron@MacBook-Pro"
    ];
  };

  users.users.aaron = {
    hashedPassword = "$7$CU..../....mTYw28fnKaMzRRszVZhR21$tYH1/Z7DDGft7oGc67h61EBTXZ6JXbuzHJNIYmvYhV1";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKHjMAQUXfyMv8TG1NfqjmQJG3gqZkh25KAvAMvxVrWS Aaron@MacBook-Pro"
    ];
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    ports = [ 233 ];
    settings = {
      # root user is used for remote deployment, so we need to allow it
      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = false; # disable password login
    };
    openFirewall = true;
  };

  networking.firewall.enable = false;
}
