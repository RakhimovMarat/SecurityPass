import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    console.log("connected", this.element);

    flatpickr(".visit_date", {
      altInput: true,
      "locale": {
        "firstDayOfWeek": 1 // start week on Monday
      }
    })
  }
}
