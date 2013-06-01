requirejs.config({
    "baseUrl": "/javascripts",
    "paths": {
      "jquery":       "lib/jquery-2.0.1",
      "underscore":   "lib/underscore",
      "backbone":     "lib/backbone",
      "highlight":    "lib/highlight.pack",
      "pep":          "pep/src/jquery.pep"
    },
  shim: {
    "jquery": {
      exports: "$"
    },

    "underscore": {
      exports: "_"
    },

    "backbone": {
      deps: ["jquery", "underscore"],
      exports: "Backbone"
    },

    "highlight": {
      exports: "hljs"
    }

  }
});

// Load the main app module to start the app
requirejs(["main"]);
