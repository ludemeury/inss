import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      dateFormat: this.element.dataset.flatpickrDateFormat || "d-m-Y",
      defaultDate: this.parseDate(this.element.value)
    });
  }

  parseDate(value) {
    if (value) {
      const [year, month, day] = value.split("-");
      return `${day}-${month}-${year}`;
    }
    return null;
  }
}
