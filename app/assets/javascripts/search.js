console.log("reading file")
$(document).on('ready page:load',(function() {
  console.log("doc ready")
  setEventListeners()
});


function setEventListeners(){

  setLinkSearch()
  setTagSearch()




}

function setLinkSearch(){
  $( "[data-search='searchBar']" ).keyup(function() {
  var sendData = {currentString:( $(this).val())};
  $('.link,.tag').remove()
  console.log("before ajax")
  $.ajax({
    url: '/link_search',
    type: 'post',
    data: sendData,
    dataType: "html"
  })
  .done(function(response) {
    $('#linkzone').html(response)
    })
  })

}



function setTagSearch(){
    $( "[data-search='tagSearchBar']" ).keyup(function() {
  var sendData = {currentString:( $(this).val())};
  $('.link,.tag').remove()
  console.log("before ajax")
  $.ajax({
    url: '/tag_search',
    type: 'post',
    data: sendData,
    dataType: "html"
  })
  .done(function(response) {
    $('#tagzone').html(response)
    })
  })

  }
