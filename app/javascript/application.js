import Rails from "@rails/ujs";
Rails.start(); // Ensures delete requests work with data-method attributes

import "@hotwired/turbo-rails"; 
import "controllers";

import "popper";
import "bootstrap";
import * as autosize from "autosize";

// Initialize Bootstrap popovers and tooltips on each Turbo load
document.addEventListener("turbo:load", () => {
  const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]');
  [...popoverTriggerList].forEach(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl));
  
  const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
  [...tooltipTriggerList].forEach(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
});

// Automatically resize text areas
document.addEventListener("turbo:load", () => {
  autosize(document.querySelectorAll('textarea'));
});
