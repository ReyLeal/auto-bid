
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
App.bids = App.cable.subscriptions.create('BidsChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    return $('#messages').prepend(this.renderBid(data));
  },

  renderBid: function(data) {
    var d = new Date();
    return "<tbody><td>$" + data.bid + "</td> <td>" + data.company + "</td><td>" + data.dealer + "</td><td>" + data.email + "</td><td>" + timeSince(d) + "</td></tbody>"
  }

});
