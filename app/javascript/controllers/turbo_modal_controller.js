import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  hideModal() {
    // console.log(this.element)
    // console.log(this.element.parentElement)
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
  }
}