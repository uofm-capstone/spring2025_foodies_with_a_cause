import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers";

const application = Application.start();
const context = require.context(".", true, /\.js$/); // Auto-load all controllers
application.load(definitionsFromContext(context));
