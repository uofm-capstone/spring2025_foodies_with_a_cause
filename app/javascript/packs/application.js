console.log("Webpack entry point loaded!");

// Import Rails and Turbo
import Rails from "@rails/ujs";
Rails.start();
import "@hotwired/turbo-rails";

console.log("Application JS loaded");

// Import Bootstrap and other libraries
import "bootstrap";
import autosize from "autosize";

// Scrolling functions
function saveScrollPosition() {
  const messagesContainer = document.getElementById("messages");
  if (messagesContainer) {
    sessionStorage.setItem("scrollPosition", messagesContainer.scrollTop);
  }
}

function restoreScrollPosition() {
  const messagesContainer = document.getElementById("messages");
  const savedPosition = sessionStorage.getItem("scrollPosition");
  if (messagesContainer && savedPosition !== null) {
    messagesContainer.scrollTop = parseInt(savedPosition, 10);
    sessionStorage.removeItem("scrollPosition");
  }
}

window.scrollToBottomInstantly = function () {
  const messagesContainer = document.getElementById("messages");
  if (messagesContainer) {
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
  }
};


// timestamps

function updateMessageTimestamps() {
  const timestamps = document.querySelectorAll(".message-timestamp");

  timestamps.forEach((element) => {
    const timestamp = element.getAttribute("data-timestamp");
    if (timestamp) {
      const date = new Date(timestamp);

      // Format the date to the user's local timezone
      const options = {
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
        hour: "2-digit",
        minute: "2-digit",
        hour12: true,
      };

      element.textContent = date.toLocaleString(undefined, options);
    } else {
      console.error("Invalid timestamp:", element);
    }
  });
}

// Call this function on page load
document.addEventListener("turbo:load", () => {
  updateMessageTimestamps();
});


// Extra event listeners
document.addEventListener("turbo:before-visit", saveScrollPosition);
document.addEventListener("turbo:submit-start", saveScrollPosition);

document.addEventListener("turbo:load", () => {
  console.log("turbo:load event fired");
  restoreScrollPosition();
  autosize(document.querySelectorAll("textarea"));
  scrollToBottomInstantly();
});

document.addEventListener("turbo:before-stream-render", () => {
  requestAnimationFrame(() => {
    setTimeout(() => {
      console.log("Turbo Stream rendered. Scrolling to bottom.");
      scrollToBottomInstantly();
    }, 100);
  });
});

document.addEventListener("turbo:before-stream-render", () => {
  console.log("Event listener triggered");

  requestAnimationFrame(() => {
    console.log("requestAnimationFrame executed");

    const messagesContainer = document.getElementById("messages");
    console.log("messagesContainer:", messagesContainer);

    if (messagesContainer) {
      const newMessage = messagesContainer.lastElementChild;
      console.log("newMessage:", newMessage);

      if (newMessage) {
        newMessage.classList.add("new-message-highlight");
        console.log("Highlight class added");

        setTimeout(() => {
          newMessage.classList.remove("new-message-highlight");
          console.log("Highlight class removed");
        }, 1000);
      }
    }
  });
});




// Submit button handling
document.addEventListener("turbo:submit-start", (event) => {
  const submitButton = event.target.querySelector("input[type='submit']");
  if (submitButton) {
    submitButton.disabled = true;
    submitButton.value = "Processing...";
  }
});

document.addEventListener("turbo:submit-end", (event) => {
  const submitButton = event.target.querySelector("input[type='submit']");
  const textarea = document.querySelector("#message_content");
  if (textarea) textarea.value = "";
  if (submitButton) {
    submitButton.disabled = false;
    submitButton.value = "Submit";
  }
  scrollToBottomInstantly();
});

// CSRF token handling
document.addEventListener("turbo:before-fetch-request", (event) => {
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
  event.detail.fetchOptions.headers["X-CSRF-Token"] = csrfToken;
});

console.log("Reusable logic loaded!");
