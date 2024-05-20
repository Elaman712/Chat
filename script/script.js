function sendMessage() {
  var messageInput = document.getElementById('message-input');
  var message = messageInput.value.trim();
  
  if (message !== '') {
    message = parseEmojis(message);
    var chatMessages = document.getElementById('chat-messages');
    var messageElement = document.createElement('div');
    messageElement.textContent = message;
    chatMessages.appendChild(messageElement);
    
    messageInput.value = '';
  }
}

function insertEmoji(emoji) {
  var messageInput = document.getElementById('message-input');
  messageInput.value += emoji;
}

function parseEmojis(message) {
  message = message.replace(/:scull:/g, '☠️');
  message = message.replace(/:love:/g, '🥰');
  message = message.replace(/:belay:\)/g, '☠️'); // Добавляем смайлик "Улыбка"
  message = message.replace(/:\(/g, '💅🏾'); // Добавляем смайлик "Грусть"
  return message;
}

 