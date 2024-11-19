// application.js
console.log("JavaScript Loaded Successfully!"); // Confirm JS loading

import Rails from "@rails/ujs";
Rails.start();

import "@hotwired/turbo-rails"; // Ensure Turbo is correctly imported
import "bootstrap"; // Import Bootstrap

import "controllers"; // Load Stimulus controllers if any
import autosize from 'autosize';

// Initialize Bootstrap popovers and tooltips on each Turbo load
document.addEventListener("turbo:load", () => {
  // Initialize Bootstrap popovers
  const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]');
  [...popoverTriggerList].forEach(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl));

  // Initialize Bootstrap tooltips
  const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
  [...tooltipTriggerList].forEach(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

  // Autosize text areas
  autosize(document.querySelectorAll('textarea'));

  // Flash Message Auto-Dismiss & Close Button
  const alertElements = document.querySelectorAll('.alert-dismissible');
  alertElements.forEach(alert => {
    const closeButton = alert.querySelector('.btn-close');
    
    // Dismiss on close button click
    if (closeButton) {
      closeButton.addEventListener('click', () => {
        alert.classList.add('fade-out');
        setTimeout(() => alert.remove(), 300); // Fade out then remove
      });
    }

    // Auto-dismiss after 3 seconds
    setTimeout(() => {
      alert.classList.add('fade-out');
      setTimeout(() => alert.remove(), 300);
    }, 3000);
  });
});

document.addEventListener("turbo:load", () => {
  // Check if the Google Maps API script is already added
  if (!document.querySelector('script[src*="maps.googleapis.com"]')) {
    const script = document.createElement("script");
    script.src = `https://maps.googleapis.com/maps/api/js?key=AIzaSyA0dTtwwEAGoN92cz3JOxv63Zn1ef1Mwdw&callback=initMap`;
    script.async = true;
    script.defer = true;
    document.head.appendChild(script);
  }
});

// Initialize Google Map
window.initMap = function () {
  const mapElement = document.getElementById("map");
  if (mapElement) {
    const map = new google.maps.Map(mapElement, {
      center: { lat: -34.397, lng: 150.644 }, // Replace with your desired coordinates
      zoom: 8,
    });
  }
};