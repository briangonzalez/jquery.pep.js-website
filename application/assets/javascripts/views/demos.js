define(['backbone'], function(Backbone){

  var DemoView = Backbone.View.extend({
    events: {},

    initialize: function(){
      require([this.$el.data('codepen-path') + ".js"])
    }
  });


  $('section.demo[data-demo]').each(function(){
    var v = new DemoView({ el: $(this) });
    v.render();  
  })


})