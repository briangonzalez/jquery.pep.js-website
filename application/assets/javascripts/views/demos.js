define(['backbone'], function(Backbone){

  var DemoView = Backbone.View.extend({
    events: {
      'click .icon-fullscreen': 'full'
    },

    initialize: function(){
      require([this.$el.data('codepen-path') + ".js"])
    },

    full: function(){
      this.$el.toggleClass('fullscreen');
    }

  });


  $('section.demo[data-demo]').each(function(){
    var v = new DemoView({ el: $(this) });
    v.render();  
  })


})