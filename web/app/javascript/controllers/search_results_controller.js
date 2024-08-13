import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static outlets = ['search-field']
  static targets = ['container']

  select(event) {
    event.preventDefault()

    const item = {
      text: event.target.innerText,
      value: event.target.querySelector('input').value
    }

    this.searchFieldOutlet.display(item)
    this.containerTarget.innerText = ''
  }
}
