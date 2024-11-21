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

// Function to initialize SVG vine animation
function initializeVineAnimation() {
  const hero = document.querySelector(".hero");
  const svg = document.querySelector(".vines-svg");
  const path = document.querySelector(".vine-path");

  if (hero && svg && path) {
    const heroWidth = hero.offsetWidth;
    const heroHeight = hero.offsetHeight;

    // Update the SVG viewBox to match hero dimensions
    svg.setAttribute("viewBox", `0 0 ${heroWidth} ${heroHeight}`);

    // Create a path to trace the border
    const pathData = `
      M0,0
      H${heroWidth}
      V${heroHeight}
      H0
      Z
    `;
    path.setAttribute("d", pathData);

    // Calculate the path length and apply stroke properties
    const pathLength = path.getTotalLength();
    path.style.strokeDasharray = pathLength;
    path.style.strokeDashoffset = pathLength;

    // Trigger the animation
    path.style.animation = "draw-border 5s linear forwards";

    console.log(
      `Hero SVG animation triggered. Dimensions: ${heroWidth}x${heroHeight}, Path length: ${pathLength}`
    );
  } else {
    console.warn("Hero SVG or path element not found.");
  }
}

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
