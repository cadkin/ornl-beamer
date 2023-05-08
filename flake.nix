{
    description = "ORNL beamer template";

    inputs = {
        nixpkgs.url = github:NixOS/nixpkgs;
        utils.url = github:numtide/flake-utils;
    };

    outputs = attrs @ { self, nixpkgs, utils, ... }: utils.lib.eachDefaultSystem (system: rec {
        pkgs = import attrs.nixpkgs {
            inherit system;
        };

        packages = rec {
            default = ornl.ornl-beamer;

            ornl = {
                ornl-beamer = pkgs.stdenv.mkDerivation rec {
                    pname = "ornl-beamer";
                    version = "1.0-" + (builtins.substring 0 8 (if (self ? rev) then self.rev else "dirty"));

                    src = self;

                    buildInputs = [
                        pkgs.texlive.combined.scheme-full
                    ];

                    installPhase = ''
                        mkdir $out
                        cp target.pdf $out
                    '';

                    XDG_CACHE_HOME="/build/cache";

                    meta = {
                        description = "A simple beamer template for ORNL presentations";
                        homepage = "https://github.com/cadkin/ornl-beamer";
                        license = "MIT";
                        platforms = utils.lib.defaultSystems;
                    };
                };
            };
        };

        devShells = rec {
            default = ornl-beamer-dev;

            # Main developer shell.
            ornl-beamer-dev = pkgs.mkShell rec {
                name = "ornl-beamer-dev";

                packages = [
                    pkgs.gnumake
                    pkgs.zathura
                ] ++ self.outputs.packages.${system}.ornl.ornl-beamer.buildInputs;

                nativeBuildInputs = [
                    # NOP
                ];

                shellHook = ''
                    export PS1='\n\[\033[1;36m\][${name}:\W]\$\[\033[0m\] '
                '';
            };
        };
    });
}
