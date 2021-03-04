import consumer from "./consumer"


const appRoom = consumer.subscriptions.create("RoomChannel", {

  received(data) {
    const messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', data['message']);
  },

  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});

window.addEventListener("keypress", function(e) {
  
  if (e.key === "Enter") {;
    appRoom.speak(e.target.value);
    e.target.value = '';
    e.preventDefault();
  }
  
})