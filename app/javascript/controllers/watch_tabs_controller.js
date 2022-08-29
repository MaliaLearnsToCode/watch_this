import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="watch-tabs"
export default class extends Controller {
  static targets = [ 'watch' ]

  connect() {
    console.log(this.watchTargets);
  }

  showWatches(event) {
    const targetBrand = event.target.dataset['filter'];
    console.log(`${targetBrand} clicked`)
    this.watchTargets.forEach(watch => {
      watch.dataset['brand'] === targetBrand || targetBrand === 'all'
        ? watch.classList.remove('d-none')
        : watch.classList.add('d-none')
    })
    console.log(this.watchTargets);
  }
}
