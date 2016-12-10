// BELOW IS A FUNCTION FOR ADDING "0 SECONDS AGO".... TYPE LOGIC WHEN A BID IS POSTED.
function timeSince(date) {
  var seconds = Math.floor((new Date() - date) / 1000);
  var interval = Math.floor(seconds / 31536000);
  if (interval > 1) {
    return interval + " years";
  }
  interval = Math.floor(seconds / 2592000);
  if (interval > 1) {
    return interval + " months";
  }
  interval = Math.floor(seconds / 86400);
  if (interval > 1) {
    return interval + " days";
  }
  interval = Math.floor(seconds / 3600);
  if (interval > 1) {
    return interval + " hours";
  }
  interval = Math.floor(seconds / 60);
  if (interval > 1) {
    return interval + " minutes";
  }
  return Math.floor(seconds) + " seconds";
}
// BELOW IS THE ACTION CABLE JAVASCRIPT USED TO APPEND THE DEALERS BID AMOUNT, DEALERS NAME
// DEALERS EMAIL DEALERS COMPANY, EXC...
App.bids = App.cable.subscriptions.create('BidsChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    $('#messages').prepend(this.renderBid(data));
    $('input#bid_bid_amount').val('');
    // USED THIS AJAX CALL TO ONLY DISPLAY THE DELETE BUTTON ON THE OCCASION THAT THE CURRENT DEALER WHO POSTED THE BID IS THE PERSON LOGGED IN.
    $.ajax({
      type:"GET",
      url:"/auctions/current_dealer"
    }).done(function(data){
      console.log(data);
      if(data["current_dealer"] !== true) {
        $("#auc-delete-button ").css("display", "none");
        console.log(data);
      } else {
        $('#auc-delete-button').prepend(this.renderButton(data));
      }
    });
  },
  renderBid: function(data) {
    var d = new Date();
    return "<tbody><td>$" + data.bid + "</td> <td>" + data.company + "</td><td>" + data.dealer +
    "</td><td>" + data.email + "</td><td>" + timeSince(d) + "</td><td id='auc-delete-button'>" + "</td></tbody>";
  },
  renderButton: function(data) {
    return "<td>" + data.delete+  "</td>" ;
  }
});
