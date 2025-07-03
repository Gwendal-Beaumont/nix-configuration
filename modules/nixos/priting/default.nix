{ pkgs, ... }:

{
  config = {
    # Printing
    services.printing = {
      enable = true;
      drivers = with pkgs; [
        hplip
        foomatic-db-ppds
      ];
    };
    services.samba.enable = true;
  };
}
