// Import the application instance
import { application } from "controllers/application";

// Import Stimulus
import { Application } from "@hotwired/stimulus";

// Initialize Stimulus
const stimulusApplication = Application.start();

// Dynamically import and register controllers
const context = require.context("controllers", true, /\.js$/);
context.keys().forEach((key) => {
  const controllerName = key.replace("./", "").replace(".js", "");
  const controller = context(key).default;
  if (controller) {
    stimulusApplication.register(controllerName, controller);
  }
});

// Eager load all controllers defined in the import map under controllers/**/*_controller
eagerLoadControllersFrom("controllers", application);

// Optionally enable lazy loading if you need it (comment out if not used)
// lazyLoadControllersFrom("controllers", application);
