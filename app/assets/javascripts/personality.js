$(document).ready(function() {
  $(".wait").toggle();
  $("#twitter_text").toggle();
  $("#twitter_box").on('click', function(){
    $("#twitter_text").toggle();
  });

  $("#new_personality").submit(function(event){
      $(".wait").toggle()
    });

  });
