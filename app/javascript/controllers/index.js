// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import FlatpickrController from "./flatpickr_controller";
application.register("flatpickr", FlatpickrController);
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)
