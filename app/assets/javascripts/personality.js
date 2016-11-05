$(document).ready(function() {
  console.log('show up?')
  $("#twitter_text").toggle();
  $("#twitter_box").on('click', function(){
    $("#twitter_text").toggle();
  })
});
