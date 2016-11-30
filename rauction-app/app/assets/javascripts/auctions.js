$(document).on('turbolinks:load', function() {
  // console.log("document is loaded");
  carYear = ""

  $('select#auction_year').on('change', function() {
    var inputYear = $('select#auction_year')["0"].value
    makeAjaxRequest(inputYear);
    carYear = inputYear
  });

  function makeAjaxRequest(year) {
    $.get('http://www.carqueryapi.com/api/0.3/?cmd=getMakes&year=' + year,  function(data) {
      parseMake(data);
    });
  }

  function parseMake(carMakes) {
    var optionsHtml = "";
    var displayName;
    carMakes['Makes'].forEach(function(eachCar) {
      displayName = eachCar.make_display
      optionsHtml += ("<option value='" + displayName + "'>" + displayName + "</option>");
    });
    $('#auction_make').empty().append(optionsHtml);
  }


  $('select#auction_make').on('input', function() {
    var inputMake = $('select#auction_make')[0].value
    console.log(inputMake)
    console.log(carYear)
    makeAjaxRequestForMakes(inputMake, carYear);
  })

  function makeAjaxRequestForMakes(make, year) {
    $.get('http://www.carqueryapi.com/api/0.3/?cmd=getModels&make=' + make + '&year=' + year, function(data){
      parseModel(data);
      console.log(data)
    });
  }
  function parseModel(carModels) {
    var optionsHtml = "";
    var modelName;
    carModels['Models'].forEach(function(eachCar) {
      modelName = eachCar.model_name
      optionsHtml += ("<option value='" + modelName + "'>" + modelName + "</option>");
    });
    $('#auction_model').empty().append(optionsHtml);
  }

});

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
