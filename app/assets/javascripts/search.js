console.log("reading file")
$( document ).ready(function() {
  console.log("doc ready")
  setEventListeners()
});


function setEventListeners(){

  setLinkSearch()
  setTagSearch()
  // setPeopleSearch()




}

function setLinkSearch(){
  $( "[data-search='searchBar']" ).keyup(function() {
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

//   function setPeopleSearch(){
//   $( "[data-search='searchBar']" ).keyup(function() {
//   var sendData = {currentString:( $(this).val())};
//   $('.people').remove()
//   console.log("before ajax")
//   $.ajax({
//     url: '/people_search',
//     type: 'post',
//     data: sendData,
//     dataType: "html"
//   })
//   .done(function(response) {
//     $('#peoplezone').html(response)
//     })
//   })

// }

