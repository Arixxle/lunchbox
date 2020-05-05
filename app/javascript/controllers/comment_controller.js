
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content", "submit"]
  connect(){
    console.log('connected!');
  }
  check(){
    if (this.contentTarget.value.length >= 2){
      console.log('OK');
      this.submitTarget.disabled = false;
    } else {
      this.submitTarget.disabled = true;
    }
  }
}
