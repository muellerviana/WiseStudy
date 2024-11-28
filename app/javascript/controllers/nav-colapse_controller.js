import { Controller } from "@hotwired/stimulus";

  export default class extends Controller {
    static targets = ["toggleable"];

    connect() {
      window.addEventListener("toggle:visibility", this.toggleClass.bind(this));

      document.addEventListener("click", this.hideMenuOnOutsideClick.bind(this)); //escuta os cliques no documento que são fora do menu
    }

    disconnect() {
      window.removeEventListener("toggle:visibility", this.toggleClass.bind(this));

      document.removeEventListener("click", this.hideMenuOnOutsideClick.bind(this));
    }

    toggleClass() {
      if (this.toggleableTarget.classList.contains("hidden")) {
        console.log("Exibindo menu.");
        this.toggleableTarget.classList.remove("hidden");
      } else {
        console.log("Escondendo menu.");
        this.toggleableTarget.classList.add("hidden");
      }
    }

    hideMenuOnOutsideClick(event) {
      console.log("Menu estado inicial:", this.toggleableTarget.classList.contains("hidden")); //verificar se o menu já está escondido

      console.log("Clique foi no menu?", this.toggleableTarget.contains(event.target));

      console.log("Clique foi no botão?", this.element.contains(event.target));
    
      if (this.toggleableTarget.classList.contains("hidden")) {
        console.log("Menu já escondido. Ignorando clique.");
        return;
      }
    
      if (this.toggleableTarget.contains(event.target) || this.element.contains(event.target)) {
        console.log("Clique dentro do menu ou botão. Ignorando clique.");
        return;
      }
    
      console.log("Clique fora do menu. Escondendo.");
      this.toggleableTarget.classList.add("hidden");
    }
  }    