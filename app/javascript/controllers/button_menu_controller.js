import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
toggleDiv() {
    const event = new CustomEvent("toggle:visibility", { bubbles: true });
    window.dispatchEvent(event); // Dispatch the event globally
}
}
