import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    toggleDiv() {
        setTimeout(() => {
          const event = new CustomEvent("toggle:visibility", { bubbles: true });
          window.dispatchEvent(event);
        }, 0);
      }
    }      