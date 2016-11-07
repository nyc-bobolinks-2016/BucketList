$(document).ready(function() {
  $('.data').toggle()
  $("#twitter_text").toggle();
  $("#twitter_box").on('click', function(){
    $("#twitter_text").toggle();
  });

  setTimeout(function(){
      $('body').addClass('loaded');
      $('.wait').toggle()
      $('.data').toggle()
  }, 3000);

});
