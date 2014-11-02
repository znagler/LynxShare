console.log("reading file")
$( document ).ready(function() {
  console.log("doc ready")
  setEventListeners()
});

function setEventListeners(){
  $( "[data-search='searchBar']" ).keyup(function() {
  var sendData = {currentString:( $(this).val())};
  $('.link,.tag').remove()
  console.log("before ajax")
  $.ajax({
    url: '/search',
    type: 'post',
    data: sendData,
    dataType: "html"
  })
  .done(function(response) {
    $('#linkzone').html(response)
    })
  })
}

