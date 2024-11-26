import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["container"];

  connect() {
    // Check for initial Rails flash messages
    const notice = this.data.get("notice");
    const alert = this.data.get("alert");

    if (notice) this.showToast(notice, "notice");
    if (alert) this.showToast(alert, "alert");
  }

  showToast(message, type) {
    const toast = document.createElement("div");
    toast.className = `toast ${type} p-4 rounded shadow-lg text-white mb-2`;
    toast.innerText = message;

    // Tailwind styles
    toast.style.backgroundColor = type === "notice" ? "#38bdf8" : "#f87171"; // Blue for notice, Red for alert

    // Auto-remove after 3 seconds
    setTimeout(() => {
      toast.remove();
    }, 3000);

    this.containerTarget.appendChild(toast);
  }
}
