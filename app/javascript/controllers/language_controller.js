import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["localeSelect"]; 

  changeLocale(event) {
    const selectedUrl = event.target.value;
    if (selectedUrl) {
      window.location.href = selectedUrl; // Redirect to the selected URL
    }
  }
}
