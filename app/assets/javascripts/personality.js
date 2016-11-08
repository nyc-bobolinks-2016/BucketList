$(document).ready(function() {
  $(".wait").toggle();
  $("#twitter_text").toggle();
  $("#twitter_box").on('click', function(){
    $("#twitter_text").toggle();
  });

  $('.big-five-container').on('click', '.big-five', function(event){
    $(this).find('.sub-big-five').toggle()
  });

  $("#new_personality").submit(function(event){
      $(".wait").toggle()
  });

});
