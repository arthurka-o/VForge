import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "hiddenInput", "picker" ]

  connect() {
    this.hidePicker()
  }

  showPicker() {
    this.pickerTarget.style.display = 'block'
  }

  hidePicker() {
    this.pickerTarget.style.display = 'none'
  }

  switchPicker() {
    if (this.pickerTarget.style.display === 'none') {
      this.showPicker()
    } else {
      this.hidePicker()
    }
  }

  insertEmoji(event) {
    this.inputTarget.innerText = event.target.innerText
    this.hiddenInputTarget.value = event.target.innerText
    this.hidePicker()
  }
}