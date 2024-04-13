# credits to @uncenter for letting me nab this
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
