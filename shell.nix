{ pkgs ? import <nixpkgs> { } }:

let
  apa-csl   = pkgs.fetchurl {
    sha256 = "sha256-XI1+bpbyyxwOC/3z1s+DWtM64y58WrZ0A8hvSXt4eUw=";
    url    = "https://github.com/citation-style-language/styles/raw/38bc5feb0f3ac7b3cf12281168aac8e53bba5085/apa.csl";
  };
  eisvogel  = pkgs.fetchurl {
    sha256 = "sha256-HWw3xpBnRJfnxe/YxCFpRgYYrV8oephCFCmakIgDgIc=";
    url    = "https://github.com/Wandmalfarbe/pandoc-latex-template/raw/04e329698d01c3a25aa72ad81d98483284669316/eisvogel.tex";
  };
  texlive'  = pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-small adjustbox babel-german background bidi
      catchfile collectbox csquotes everypage filehook footmisc footnotebackref framed
      fvextra hardwrap letltxmacro ly1 mdframed mweights needspace pagecolor
      sourcecodepro sourcesanspro titling ucharcat ulem unicode-math upquote
      xecjk xetex xurl zref;
  };
in
pkgs.mkShell {
  buildInputs = with pkgs; [ gnumake pandoc texlive' ];
  shellHook   = ''
    ln -sfn ${apa-csl} apa.csl
    ln -sfn ${eisvogel} eisvogel.tex
  '';
}
