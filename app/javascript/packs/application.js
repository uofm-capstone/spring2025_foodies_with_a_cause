// packs/application.js
console.log("Webpack entry point loaded!");

// Import Rails and Turbo
import Rails from "@rails/ujs";
Rails.start();

import "@hotwired/turbo-rails";

// Import Bootstrap and other libraries
import "bootstrap";

// Import Stimulus controllers
import { Application } from "@hotwired/stimulus";
import "../controllers"; // Only runs the file for its side effects (auto-registration)


const application = Application.start();
controllers.forEach((controller) => application.register(controller.name, controller.module));


// Import your reusable logic file
import "../application"; // Reusable logic file (outside packs)
