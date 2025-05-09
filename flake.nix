 {
   description = "Personal Flake Templates";
 
  inputs = {
    official-templates.url = "github:NixOS/templates";
    poetry.url = "github:nix-community/poetry2nix";
    # Example additional template repo
    # other-templates.url = "github:some-other/templates";
  };
 
   outputs = { self, official-templates, poetry, ... }: {
 
     templates = official-templates.templates // {
       anki = {
         path = ./anki;
         description = "Anki Setup for Latex";
       };
       python-sci = {
         path = ./python-sci;
         description = "Scientific Python";
       };
       fortran = {
         path = ./fortran;
         description = "Use fortran within python with f2py";
       };
       octave = {
         path = ./octave;
         description = "Use octave and fortran within python with Oct2Py and f2py";
       };
       latex-synctex = {
         path = ./latex-synctex-template;
         description = "Reproducible LaTeX with synctex";
       };
       latex-full = {
         path = ./latex-full-template;
         description = "Reproducible LaTeX with every feature";
       };
       latex = {
         path = ./latex;
         description = "Feature Full LaTeX Template";
       };
       
     }
    // {python = (builtins.getAttr "app" poetry.templates);};
    # // other-templates.templates;
 
   };
 }
