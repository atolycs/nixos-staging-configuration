args@{
  ...
}:
let
  libraryDirs = builtins.filter(x: x != "default.nix") (builtins.attrNames(builtins.readDir ./.));
  dynamicAttrs = builtins.listToAttrs (
    map (dir: {
      name = builtins.replaceStrings [".nix"] [""] (builtins.baseNameOf dir);
      value = builtins.trace "[nixos] Attaching Library: ${dir}" (import ././${dir} args);
    }) libraryDirs
  );
in 
dynamicAttrs
