$(document).ready(function() {

  

  $(".chicken").on('click', function(){
    var data = $(this).find("span")[1].textContent
    debugger
  $.ajax({
    url: '/users/update',
    method: 'put',
    data: {value: data}
    }).done(function(response){
    })
  })
});
