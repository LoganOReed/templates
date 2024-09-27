 {
   description = "Personal Flake Templates";
 
  inputs = {
    official-templates.url = "github:NixOS/templates";
    # Example additional template repo
    # other-templates.url = "github:some-other/templates";
  };
 
   outputs = { self, official-templates, ... }: {
 
     templates = official-templates.templates // {
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
       python-sci = {
         path = ./python;
         description = "Basic Python Template";
       };
     };
    # // official-templates.templates;
    # // other-templates.templates;
 
   };
 }
