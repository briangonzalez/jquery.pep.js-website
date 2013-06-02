define(['backbone', 'pep', 'highlight'], function(Backbone, pep, hljs){
  
  var MainView = Backbone.View.extend({
    el: 'body',
    events: {
      'click .icon-cdn': 'showCDNDialog'
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
      prompt(
        "Copy this URL to use in your projects. We'll have a cdnjs link up soon.",
        $(e.target).attr('href')
      )
    }

  });

  var v = new MainView();
  v.render();

})