import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['submit', 'query', 'text', 'value']

  display(item) {
    this.queryTarget.value = item.text
    this.textTarget.textContent = item.value
    this.valueTarget.value = item.value
  }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.submitTarget.click()
    }, 500)
  }
}
