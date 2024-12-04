console.log("Reusable logic loaded!");

// Autosize textareas
import autosize from "autosize";

// Initialize autosize on textareas
document.addEventListener("turbo:load", () => {
  autosize(document.querySelectorAll("textarea"));
});

// Flash Message Auto-Dismiss & Close Button
document.addEventListener("turbo:load", () => {
  const alertElements = document.querySelectorAll(".alert-dismissible");
  alertElements.forEach((alert) => {
    const closeButton = alert.querySelector(".btn-close");

    // Dismiss on close button click
    if (closeButton) {
      closeButton.addEventListener("click", () => {
        alert.classList.add("fade-out");
        setTimeout(() => alert.remove(), 300);
      });
    }

    // Auto-dismiss after 3 seconds
    setTimeout(() => {
      alert.classList.add("fade-out");
      setTimeout(() => alert.remove(), 300);
    }, 3000);
  });
});

// Trigger SVG vine animation on DOMContentLoaded
document.addEventListener("DOMContentLoaded", initializeVineAnimation);

// Google Maps integration
document.addEventListener("turbo:load", () => {
  if (!document.querySelector('script[src*="maps.googleapis.com"]')) {
    const script = document.createElement("script");
    script.src = `https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap`;
    script.async = true;
    script.defer = true;
    document.head.appendChild(script);
  }
});

window.initMap = function () {
  const mapElement = document.getElementById("map");
  if (mapElement) {
    new google.maps.Map(mapElement, {
      center: { lat: -34.397, lng: 150.644 }, // Replace with your desired coordinates
      zoom: 8,
    });
  }
};

// Stimulus controllers
import "controllers";
import "./channels"
