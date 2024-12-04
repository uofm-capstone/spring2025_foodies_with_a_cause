import { createConsumer } from "@rails/actioncable";

const consumer = createConsumer();

consumer.subscriptions.create("NotificationChannel", {
  received(data) {
    const chatbox = document.querySelector("#chatbox");
    if (chatbox) {
      chatbox.innerHTML += data;
      chatbox.scrollTop = chatbox.scrollHeight; // Auto-scroll to the bottom
    } else {
      console.warn("Chatbox not found. Message broadcasted to another recipient.");
    }
  }
});
