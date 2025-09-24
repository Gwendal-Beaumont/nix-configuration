{ inputs, config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    languagePacks = [
      "en-GB"
      "fr"
    ];

    policies = {
      "AutofillAddressEnabled" = false;
      "AutofillCreditCardEnabled" = false;
      "DisableFormHistory" = true;
      "DisablePocket" = true;
      "DisableProfileImport" = true;
      "OfferToSaveLoginsDefault" = false;
      "PasswordManagerEnabled" = false;
      "SanitizeOnShutdown" = {
        "Cache" = true;
        "Cookies" = false;
        "FormData" = true;
        "History" = false;
        "Sessions" = false;
        "SiteSettings" = false;
        "Locked" = false;
      };
      "SearchEngines" = {
        "Add" = [
          {
            "Name" = "Nixpkgs (unstable)";
            "URLTemplate" = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
            "Method" = "GET";
            "IconURL" = "https://nixos.org/favicon.ico";
            "Alias" = "@nix";
            "Description" = "Search in nixpkgs (unstable)";
          }
        ];
      };
    };
  };
}
