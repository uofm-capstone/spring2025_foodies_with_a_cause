// import { Controller } from "@hotwired/stimulus";
// import consumer from "../channels/consumer";

// export default class extends Controller {
//   static targets = ["messages"];

//   connect() {
//     const currentUserId = this.element.dataset.currentUserId;
//     const receiverId = this.element.dataset.receiverId;
//     const channelName = `chat_channel_${[currentUserId, receiverId].sort().join("_")}`;

//     this.subscription = consumer.subscriptions.create(
//       { channel: "ChatChannel", current_user_id: currentUserId, receiver_id: receiverId },
//       {
//         received: (data) => {
//           this.appendMessage(data);
//         }
//       }
//     );

//     console.log(`Subscribed to ${channelName}`);
//   }

//   disconnect() {
//     this.subscription.unsubscribe();
//     console.log("Unsubscribed from chat channel");
//   }

//   appendMessage(data) {
//     const messageHTML = `
//       <div class="message-container ${data.sender_id == this.element.dataset.currentUserId ? 'sender' : 'receiver'}">
//         <div class="message ${data.sender_id == this.element.dataset.currentUserId ? 'sent' : 'received'}">
//           <p>${data.content}</p>
//           <small>${data.created_at}</small>
//         </div>
//       </div>
//     `;

//     this.messagesTarget.insertAdjacentHTML("beforeend", messageHTML);
//     this.scrollToBottom();
//   }

//   scrollToBottom() {
//     this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight;
//   }
// }
