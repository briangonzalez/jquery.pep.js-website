define(['backbone'], function(Backbone){

  var DemoView = Backbone.View.extend({
    events: {
      'click .icon-fullscreen': 'full'
    },

    initialize: function(){
      var path = this.$el.data('codepen-path');

      if ( path )
        require([this.$el.data('codepen-path') + ".js"])
    },

    full: function(){
      console.log('f')
      this.$el.toggleClass('fullscreen');
    }

  });


  $('section.demo[data-demo]').each(function(){
    var v = new DemoView({ el: $(this) });
    v.render();  
  })


})