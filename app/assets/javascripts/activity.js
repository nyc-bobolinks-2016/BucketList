$(document).ready(function() {
  $(".thumb").on('click', function(){
    var data = $(this).find("span")[1].textContent
  $.ajax({
    url: '/users/update',
    method: 'put',
    data: {value: data}
  }).done(function(response){
})
})
});
