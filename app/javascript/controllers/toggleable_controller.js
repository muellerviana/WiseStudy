import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
 static targets = ["toggleable"]

 connect() {
   this.hide = this.hide.bind(this);
   window.addEventListener('hideAll', this.hide);
 }


 disconnect() {
   window.removeEventListener('hideAll', this.hide);
 }


 toggle(event) {
   this.toggleableTargets.forEach((toggleable) => {
     if (toggleable.classList.contains('hidden')) {
       window.dispatchEvent(new CustomEvent('hideAll'));
       toggleable.classList.remove('hidden');
     } else {
       toggleable.classList.add('hidden');
     }
   });

   if(!this.toggleableTargets[0].contains(event.target)) {
     event.stopPropagation();
   }
 }

 hide() {
   this.toggleableTargets.forEach((toggleable) => {
     toggleable.classList.add('hidden');
   });
 }
}