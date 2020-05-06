
import { Controller } from "stimulus"
import axios from "axios"

export default class extends Controller {
  static targets = ['icon']

  initialize(){
    this.clicked = false;
  }

  heart(e){
    e.preventDefault()//關閉預設動作
    //要在這裡呼叫axios//api request
    const csrfToken = document.querySelector('[name=csrf-token]').content
    axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken

    let item_id = document.querySelector('#item_id').value
 
    axios.post(`/api/v1/items/${item_id}/favorite`)
    .then(resp => {
      if (resp.data.status === "favorited"){
        // console.log('yes')
        this.iconTarget.classList.remove('far');
        this.iconTarget.classList.add('fas');
      } else {
        // console.log('no')

        this.iconTarget.classList.remove('fas');
        this.iconTarget.classList.add('far');
      }
    })
    .catch(err => { //catch處理的是失敗或例外狀況
      console.log(err);
    })


  }
  
  connect() {
    console.log('Hello!');
  }
}
