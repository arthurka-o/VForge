// app/javascript/controllers/auto_submit_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "field" ]

  connect() {
    this.timeout = null
  }

  disconnect() {
    clearTimeout(this.timeout)
  }

  update() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(this.submit.bind(this), 500)
  }

  submit() {
    this.fieldTarget.form.requestSubmit()
  }
}