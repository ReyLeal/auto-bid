window.onload = function() {
  console.log("document is loaded");
}
makeAjaxRequest()
function makeAjaxRequest() {
  var httpRequest = new XMLHttpRequest();
  httpRequest.onreadystatechange = function() {
    if (httpRequest.readyState === XMLHttpRequest.DONE) {
      parseResponse(httpRequest);
    }
  }
  httpRequest.open('GET', 'http://www.carqueryapi.com/api/0.3/?cmd=getMakes&year=2010', true);
  httpRequest.send(null);
}
function parseResponse(httpRequest) {
  var jsonResponse = JSON.parse(httpRequest.responseText);
  console.log(jsonResponse)
}
