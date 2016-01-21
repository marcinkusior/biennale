









function ordering(){
var movable_divs = $('.ordering-movable');

$('.ordering-container button').click(function(event){
  event.preventDefault();
  var movable = $(this).parents('.ordering-movable')[0];
  var old_value = $(movable).attr('data-order');
  var new_value = parseInt(old_value) + parseInt($(this).data('ordering'));
  var movable_old = $(".ordering-movable[data-order="+ new_value +"]");

  if (new_value < 0 || new_value > movable_divs.length - 1){
    new_value = old_value 
  }else{
    $(movable).attr('data-order', new_value).css('order', new_value) ;
    $(movable_old).attr('data-order', old_value).css('order', old_value);
  }
})
}

// ordering update
function updateOrdering(path){
$('.update-ordering').click(function(event){
event.preventDefault();

  var object = getOrderParams();
  $.ajax({
    type: "POST",
    url: path,
    data: { object },
    success: function(object){
      alert('update successful')
    },
    error: function(){
      console.log('error')
    }
  })
})

// helpers
function getOrderParams(){
  var object = {ids: [], order: []};
  var params = $('.ordering-movable').each(function(idx, e){
    object['ids'].push($(e).attr('data-id'))
    object['order'].push($(e).attr('data-order'))
  })
  return object
  }
}


