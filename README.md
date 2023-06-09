# ornl-beamer

A simple template for creating ORNL presentations. Based on the template created by Joe Osborn.

### Editing
You should add your main content to `target.tex`. This presentation template makes use of the `beamer` package so it can be edited just like a standard beamer presentation.

If you need to add new macros or include extra packages, edit `preamble.tex`.

### Compiling PDF

1. Download and install the full LATEX installation. If you use `nix` with flakes enabled, you can get a full installation by using:
   ```
   $ nix develop
   ```
   This will put you in a dev shell with everything you need to build and show the output.

2. Run the `Makefile` by running `make`. This will create a file called `target.pdf` in the `build` directory.

3. (Optional) Change the preview program in the `Makefile` by editing the `SHOW` variable. You can then type `make show` to open the output with your viewer of choice.
