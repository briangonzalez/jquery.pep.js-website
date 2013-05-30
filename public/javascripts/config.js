requirejs.config({
    "baseUrl": "/javascripts",
    "paths": {
      "jquery":       "lib/jquery-2.0.1",
      "underscore":   "lib/underscore",
      "backbone":     "lib/backbone"
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
    }

  }
});

// Load the main app module to start the app
requirejs(["main"]);