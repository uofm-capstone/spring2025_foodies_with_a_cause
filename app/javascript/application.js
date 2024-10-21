import Rails from "@rails/ujs"
Rails.start(); // This is necessary to handle delete requests properly

import "@hotwired/turbo-rails"
import "controllers"

import "popper"
import "bootstrap"
import * as autosize from "autosize"

document.addEventListener("turbo:load", () => {
  const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
  const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
  const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
  const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
})

document.addEventListener("turbo:load", () => {
  autosize(document.querySelectorAll('textarea'))
})
