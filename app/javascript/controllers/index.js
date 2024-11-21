// app/javascript/controllers/index.js
import { application } from "./application";

// Automatically register all controllers
const context = require.context("./", true, /_controller\.js$/);
const controllers = context.keys().map((key) => {
  const controllerName = key.replace("./", "").replace(/_controller\.js$/, "");
  const controllerModule = context(key).default;
  application.register(controllerName, controllerModule);
  return { name: controllerName, module: controllerModule };
});

export default controllers;
