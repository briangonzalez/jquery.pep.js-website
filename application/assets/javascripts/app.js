$(document).ready(function(){

  // Hold SHIFT for 1s to activate/deactivate grid.
  var timeout = null;
  $(document).keyup(function (e) {
    if (e.keyCode == 16) 
      clearTimeout(timeout); 
  }).keydown(function (e) {
    if (e.shiftKey) 
      timeout = setTimeout( function(){$('.container').toggleClass('show-grid')}, 300);
  });

  // Highlight our code.
  $('code').addClass('prettyprint');
  prettyPrint();

});