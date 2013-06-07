define(['backbone', 'pep', 'highlight', 'views/modal'], function(Backbone, pep, hljs, ModalView){
  
  var MainView = Backbone.View.extend({
    el: 'body',
    events: {
      'click .cdn-modal-show': 'showCDNDialog'
    },

    initialize: function(){
      this.$circle      = this.$el.find('.circle');
      this.$codeBlocks  = this.$el.find('pre code');
      this.pepifyCircles();
      this.highlightCode();
    },

    pepifyCircles: function(){
      var self = this;
      this.$circle.pep();
      this.$circle.eq(0).addClass('shown translateRight');
      this.$circle.eq(1).addClass('shown translateLeft');
      setTimeout(function(){ self.$circle.addClass('no-animation') });  
    },

    highlightCode: function(){
      this.$codeBlocks.each(function(i, e) { hljs.highlightBlock(e)} );
    },

    showCDNDialog: function(e){
      e.preventDefault();
      new ModalView();
    }

  });

  var v = new MainView();
  v.render();

})