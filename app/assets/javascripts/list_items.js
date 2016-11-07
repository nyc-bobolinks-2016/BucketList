$(document).ready(function() {
  $(".bucket_list").on('click',function(){
      var item_id = event.target.id
      var route = "/list_items/" + item_id
      var checked = $(this)[0].checked
      var data = {checked: checked}
      $.ajax({
        url: route,
        method: 'put',
        data:data
      }).done(function(response){
      })
  })
});
