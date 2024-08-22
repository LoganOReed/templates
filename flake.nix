 {
   description = "Personal Flake Templates";
 
  inputs = {
    official-templates.url = "github:NixOS/templates";
    # Example additional template repo
    # other-templates.url = "github:some-other/templates";
  };
 
   outputs = { self, official-templates, other-templates, ... }: {
 
     templates = {
       latex-synctex = {
         path = ./latex-synctex-template;
         description = "Reproducible LaTeX with synctex";
       };
     }
    // official-templates.templates;
    # // other-templates.templates;
 
   };
 }
