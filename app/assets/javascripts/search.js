console.log("reading file")
$( document ).ready(function() {
  console.log("doc ready")
  setEventListeners()
});


function setEventListeners(){

  setLinkSearch()
  setTagSearch()
  setUserSearch()




}

function setLinkSearch(){
  $( "[data-search='linkSearchBar']" ).keyup(function() {
  var sendData = {currentString:( $(this).val())};
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


function setUserSearch(){
  $( "[data-search='userSearchBar']" ).keyup(function() {
  var sendData = {currentString:( $(this).val())};
  $.ajax({
    url: '/user_search',
    type: 'post',
    data: sendData,
    dataType: "html"
  })
  .done(function(response) {
    $('#userzone').html(response)
    })
  })

}


