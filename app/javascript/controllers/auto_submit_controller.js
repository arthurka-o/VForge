import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "field" ]

  connect() {
    this.timeout = null
  }

  disconnect() {
    clearTimeout(this.timeout)
  }

  update(event) {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(this.submit(event), 500)
  }

  submit(event) {
    event.currentTarget.form.requestSubmit()
  }
}