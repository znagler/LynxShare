console.log("reading file")
$( document ).ready(function() {
  console.log("doc ready")

$( "[data-search='searchBar']" ).keyup(function() {
  $('.link,.tag').show()
  var sendData = {currentString:( $(this).val())};
  if ($(this).val() != "") $('.link,.tag').hide()
  console.log("before ajax")
  $.ajax({
    url: '/search',
    type: 'post',
    dataType: 'json',
    data: sendData
  })
  .done(function(response) {
    console.log("success");
    console.log(response);
  for (i = 1; i <= 10; i++) {
    console.log(response["item"+i]);
  }
  })


});


});

