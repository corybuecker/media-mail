import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  login(_event) {
    Turbo.visit('/logins/new')
  }
}
