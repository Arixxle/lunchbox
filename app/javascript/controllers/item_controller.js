
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['icon']

  initialize(){
    this.clicked = false;
  }

  heart(e){
    e.preventDefault()//關閉預設動作
    console.log('Heart is clicked!')

    if (this.clicked){
      this.iconTarget.classList.remove('fas');
      this.iconTarget.classList.add('far');
      this.clicked = false;
    } else {
      this.iconTarget.classList.remove('far');
      this.iconTarget.classList.add('fas');
      this.clicked = true;
    }
  }
  
  connect() {
    console.log('Hello!');
  }
}
