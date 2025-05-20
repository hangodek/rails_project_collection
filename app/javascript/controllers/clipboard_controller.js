import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = ["clipboard_data"]

  connect() {
    console.log("Clipboard connected")
  }

  copy() {
    const element = this.clipboard_dataTarget
    const data = element.value
    console.log(data)
  }
}
