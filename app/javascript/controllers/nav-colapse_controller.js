import { Controller } from "@hotwired/stimulus";

  export default class extends Controller {
    static targets = ["toggleable"];

    connect() {
      window.addEventListener("toggle:visibility", this.toggleClass.bind(this));
    }

    disconnect() {
      window.removeEventListener("toggle:visibility", this.toggleClass.bind(this));
    }

    toggleClass() {
      this.toggleableTarget.classList.toggle("hidden");
    }
  }