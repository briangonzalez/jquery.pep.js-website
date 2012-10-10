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

  // Scale our headers.
  $('h1').css({ whiteSpace:'nowrap'}).fitText(0.77)

  // Highlight our code.
  $('code').addClass('prettyprint');
  prettyPrint();

  // Add some cool icons to our h2's
  function htmlDecode(value){ return $('<div/>').html(value).text(); }
  $('h2').attr('aria-hidden', 'true').attr('data-icon', htmlDecode("&#8734;") )

});