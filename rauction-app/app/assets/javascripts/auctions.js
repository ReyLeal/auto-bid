window.onload = function() {
  console.log("document is loaded");
}
//
// $('input#auction_year').onchange('input', function() {
//   console.log($('input#auction_year')["0"].value);
//   console.log($(this).val());
// });


var input = document.querySelector('#auction_year');

input.addEventListener('input', function()
{
    console.log('input changed to: ', input.value);
});

getMake()
console.log("document is loaded");

function getMake(year){
  makeAjaxRequest()
  function makeAjaxRequest() {
    var httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = function() {
      if (httpRequest.readyState === XMLHttpRequest.DONE) {
        parseMake(httpRequest);
      }
    }
    httpRequest.open('GET', 'http://www.carqueryapi.com/api/0.3/?cmd=getMakes&year=' + year , true);
    httpRequest.send(null);
  }
  function parseMake(httpRequest) {
    var jsonResponse = JSON.parse(httpRequest.responseText);
    // console.log(jsonResponse['Makes'][0]['make_display']);
    jsonResponse['Makes'].forEach(function(eachCar) {
      console.log(eachCar['make_display']);
    })
  }
}
getModel()
function getModel(make){
  makeAjaxRequest()
  function makeAjaxRequest() {
    var httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = function() {
      if (httpRequest.readyState === XMLHttpRequest.DONE) {
        parseMake(httpRequest);
      }
    }
    httpRequest.open('GET', 'http://www.carqueryapi.com/api/0.3/?cmd=getModels&make=' + make + '&year=' + year, true);
    httpRequest.send(null);
  }
  function parseModel(httpRequest) {
    var jsonResponse = JSON.parse(httpRequest.responseText);
    // console.log(jsonResponse['Makes'][0]['make_display']);
    jsonResponse['Models'].forEach(function(eachCar) {
      console.log(eachCar['model_name']);
    })
  }
}
