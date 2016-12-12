// EVERYTHING BELOW IS A JS FUNCTION TO APPEND THE CARQUERY API INTO A FORM.
$(document).on('turbolinks:load', function() {
  $.ajax({
    type:"GET",
    url:"/auctions/current_dealer"
  }).done(function(data){
    console.log(data);
    if(data["current_dealer"] !== true) {
      $("#auc-delete-button ").css("display", "none");
      console.log(data);
    }
  });
  console.log("document is loaded");
  carYear = ""
  $('select#auction_year').on('change', function() {
    var inputYear = $('select#auction_year')[0].value
    carYear = inputYear
    makeAjaxRequest(inputYear);
  });
  // ABOVE WE MADE A GLOBAL VARIABLE FOR CARYEAR TO USE IT BELOW IN AN OUT OF SCOPE FUNCTION.
  function makeAjaxRequest(year) {
    $.ajax(
      type: 'GET',
      datatype: 'jsonp',
      url: 'https://www.carqueryapi.com/api/0.3/?cmd=getMakes&year=' + year
    ).done(function(data) {
      parseMake(data);
    });
  }
  // BELOW WE ARE DOING THE PARSEMAKE FUNCTION TO PARSE THE RESPONSE FROM THE MAKEAJAXREQUEST FUNCTION.
  function parseMake(carMakes) {
    var optionsHtml = "";
    var displayName;
    carMakes['Makes'].forEach(function(eachCar) {
      displayName = eachCar.make_display
      optionsHtml += ("<option value='" + displayName + "'>" + displayName + "</option>");
    });
    $('select#auction_make').empty().append(optionsHtml);
  }
  $('select#auction_make').on('change', function() {
    var inputMake = $('select#auction_make')[0].value
    makeAjaxRequestForMakes(inputMake, carYear);
  })
  // ABOVE WE ARE USING THE CARYEAR GLOBAL VARIABLE TO PASS IN THE SELECTED YEAR AS A PARAMITER.
  function makeAjaxRequestForMakes(make, year) {
    $.get('https://www.carqueryapi.com/api/0.3/?cmd=getModels&make=' + make + '&year=' + year, function(data){
      parseModel(data);
    });
  }
  // BELOW WE ARE USING THE PARSEMAKE FUNCTION AGAIN TO PARSE THE RESPONSE OF THE ABOVE JSON OBJECT CONTAININT THE LIST OF MAKES FOR THE GIVEN MODEL.
  function parseModel(carModels) {
    var optionsHtml = "";
    var modelName;
    carModels['Models'].forEach(function(eachCar) {
      modelName = eachCar.model_name
      optionsHtml += ("<option value='" + modelName + "'>" + modelName + "</option>");
    });
    $('select#auction_model').empty().append(optionsHtml);
  }
});
// EVERYTHING BELOW IS A JS FUNCTION TO CREATE A SLIDE EFFECT ON OUR LOGIN/LOGOUT/REGISTER BUTTONS.

$(document).on('click', '.panel-heading span.clickable', function (e) {
  var $this = $(this);
  if (!$this.hasClass('panel-collapsed')) {
    $this.parents('.panel').find('.panel-body').slideUp();
    $this.addClass('panel-collapsed');
    $this.find('i').removeClass('glyphicon-minus').addClass('glyphicon-plus');
  } else {
    $this.parents('.panel').find('.panel-body').slideDown();
    $this.removeClass('panel-collapsed');
    $this.find('i').removeClass('glyphicon-plus').addClass('glyphicon-minus');
  }
});
$(document).on('click', '.panel div.clickable', function (e) {
  var $this = $(this);
  if (!$this.hasClass('panel-collapsed')) {
    $this.parents('.panel').find('.panel-body').slideUp();
    $this.addClass('panel-collapsed');
    $this.find('i').removeClass('glyphicon-minus').addClass('glyphicon-plus');
  } else {
    $this.parents('.panel').find('.panel-body').slideDown();
    $this.removeClass('panel-collapsed');
    $this.find('i').removeClass('glyphicon-plus').addClass('glyphicon-minus');
  }
});
$(document).ready(function () {
  $('.panel-heading span.clickable').click();
  $('.panel div.clickable').click();
});

// BELOW WE ARE CREATING VALIDATION FOR THE FORM USED TO CREATE A NEW AUCTION.
$('#new_auction').validate({
  debug: true,
  rules: {
    "auction[title]": {required: true},
    "auction[year]": {required: true},
    "auction[make]": {required: true},
    "auction[model]": {required: true},
    "auction[miles_from]": {required: true},
    "auction[color]": {required: true},
    "auction[features]": {required: true},
    "auction[max_price]": {required: true},
    "auction[address]": {required: true},
    "auction[expiration_date]": {required: true}

  }
});
