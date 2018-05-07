function scroll(){
  var objDiv = document.querySelector("#message_area");
  objDiv.scrollTop = objDiv.scrollHeight;
}

function initMessages(room){
  scroll();
  App.messages = App.cable.subscriptions.create({channel: "MessagesChannel", room: room}, {
    connected: function() {
    },

    disconnected: function() {
    },

    received: function(data) {
      // Called when there's incoming data on the websocket for this channel
      document.querySelector("#message_area").innerHTML += data.message;
      document.querySelector('#textarea').value = '';
      scroll();
    }
  });
}
