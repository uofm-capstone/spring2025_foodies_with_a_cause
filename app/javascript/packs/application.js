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