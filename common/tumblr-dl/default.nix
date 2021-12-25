{ bundlerApp }:

bundlerApp {
  pname = "tumblr-dl";
  gemdir = ./.;
  exes = [ "tumblr-dl" ];
}
