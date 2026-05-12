{
  lib,
  config,
  inputs,
  withSystem,
flakeRoot,
  ...,
}:

{
  cLibs = import ./cLibs {
    inherit 
    flakeRoot;
  }
}
