import { Controller } from "@hotwired/stimulus";

  export default class extends Controller {
    static targets = ["toggleable"];
    foiEscondido = false;

    connect() {
      window.addEventListener("toggle:visibility", this.toggleClass.bind(this));

      document.addEventListener("click", this.hideMenuOnOutsideClick.bind(this)); 
    }

    disconnect() {
      window.removeEventListener("toggle:visibility", this.toggleClass.bind(this));

      document.removeEventListener("click", this.hideMenuOnOutsideClick.bind(this));
    }

    toggleClass() {
      console.log('passando para função togclass')
      if (this.toggleableTarget.classList.contains("hidden") && this.foiEscondido == false) { //se está escondido e 
        console.log("Exibindo menu. by TC");
        this.toggleableTarget.classList.remove("hidden"); // mostra
        this.foiEscondido = false;
      } else if (this.foiEscondido = true) {
        this.foiEscondido = false    
      }
    }

    hideMenuOnOutsideClick(event) {
      console.log('passando para função hidemenu')
      console.log("clicou em qualquer lugar");
      if (!this.toggleableTarget.classList.contains("hidden")) { // se o menu esta a mostra 
        this.toggleableTarget.classList.add("hidden"); // esconda, portanto
        console.log("esconde pelo click");
        this.foiEscondido = true;
        return;
      }
    }
  }    