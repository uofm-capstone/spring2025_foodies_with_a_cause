console.log("Webpack entry point loaded!");

// Import Rails and Turbo
import Rails from "@rails/ujs";
Rails.start();
import "@hotwired/turbo-rails";

console.log("Application JS loaded");

// Import Bootstrap and other libraries
import "bootstrap";
import autosize from "autosize";

// -------------------------------
// Save and Restore Scroll Position
// -------------------------------

function saveScrollPosition() {
  const messagesContainer = document.getElementById("messages");
  if (messagesContainer) sessionStorage.setItem("scrollPosition", messagesContainer.scrollTop);
}

document.addEventListener("turbo:before-visit", saveScrollPosition);
document.addEventListener("turbo:submit-start", saveScrollPosition);
document.addEventListener("turbo:load", () => {
  const messagesContainer = document.getElementById("messages");
  const savedPosition = sessionStorage.getItem("scrollPosition");
  if (messagesContainer && savedPosition !== null) {
    messagesContainer.scrollTop = parseInt(savedPosition, 10);
    sessionStorage.removeItem("scrollPosition");
  }
  autosize(document.querySelectorAll("textarea"));
});

// -------------------------------
// Scroll to Bottom of Chat Logic
// -------------------------------

function scrollToBottomInstantly() {
  const messagesContainer = document.getElementById("messages");
  if (messagesContainer) {
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
  }
}

// Scroll to the bottom when a new message is appended via Turbo Stream
document.addEventListener("turbo:before-stream-render", (event) => {
  if (event.detail.newStream.action === "append") {
    requestAnimationFrame(scrollToBottomInstantly);
  }
});

// Scroll to the bottom on initial page load and after Turbo navigation
document.addEventListener("DOMContentLoaded", scrollToBottomInstantly);
document.addEventListener("turbo:load", scrollToBottomInstantly);

// -------------------------------
// Submit Button Handling
// -------------------------------

document.addEventListener("turbo:submit-start", (event) => {
  const submitButton = event.target.querySelector("input[type='submit']");
  if (submitButton) {
    submitButton.disabled = true;
    submitButton.value = "Sending...";
  }
});

document.addEventListener("turbo:submit-end", (event) => {
  const submitButton = event.target.querySelector("input[type='submit']");
  const textarea = document.querySelector("#message_content");
  if (textarea) textarea.value = "";
  if (submitButton) {
    submitButton.disabled = false;
    submitButton.value = "Send";
  }
  // Scroll to the bottom after a successful form submission
  scrollToBottomInstantly();
});

// -------------------------------
// Additional Turbo Event Listeners
// -------------------------------

document.addEventListener("turbo:before-fetch-request", (event) => {
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
  event.detail.fetchOptions.headers["X-CSRF-Token"] = csrfToken;
});

console.log("Reusable logic loaded!");
