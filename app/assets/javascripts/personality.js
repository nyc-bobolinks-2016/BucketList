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

  $('.button-collapse').sideNav({
      menuWidth: 300, // Default is 240
      edge: 'right', // Choose the horizontal origin
      closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
      draggable: true // Choose whether you can drag to open on touch screens
    }
  );


});
