define(['backbone'], function(Backbone){

  var ModalView = Backbone.View.extend({
    events: {
      'click .close, i.o': 'remove',
    },

    initialize: function(){
      var self = this;

      $.get('/javascripts/templates/cdn.jst?' + new Date().getTime(), function(d){
        self.template = _.template( "<div class='modal'><i class='o'></i>"+ d +"</div>"); 
        self.$el      = $(self.template());
        self.render();
      });  
    },

    render: function(){
      var self = this;
      $('body').append(this.$el);
      setTimeout(function(){ self.$el.find('.dialog').addClass('shown') }, 100);
      this.delegateEvents();
    }

  });

  return ModalView;

})