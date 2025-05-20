import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filtercheckbox"
export default class extends Controller {
  static targets = ["filterbtn"]

  connect() {
    console.log("Filter check connected")
  }

  enablefilter() {
    console.log("debugg")
    const element = this.filterbtnTarget
    element.disabled = !element.disabled
  }
}
