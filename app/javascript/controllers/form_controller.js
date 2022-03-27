import { Controller } from "@hotwired/stimulus"
import { MDCRipple } from "@material/ripple"
import { MDCTextField } from '@material/textfield'

export default class extends Controller {
  connect() {
    MDCRipple.attachTo((this.element.querySelector("button")))

    const textField = new MDCTextField(document.querySelector('.mdc-text-field'))
  }
}
