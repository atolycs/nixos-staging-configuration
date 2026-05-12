{
  lib,
  config,
  inputs,
  withSystem,
  ...
}:
let
  flakeRoot = ./.;
in 

{
  cLibs = import ./cLibs {
    inherit 
      flakeRoot
    ;
  };
}
