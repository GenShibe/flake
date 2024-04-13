# adapted from https://github.com/uncenter/flake
{pkgs, ...}: {
  home.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "CommitMono"
        "CascadiaCode"
      ];
    })
  ];
}
