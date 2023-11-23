import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    gardens: Array
  }

  connect() {

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addGardensToMap()

  }

  #addGardensToMap() {
    this.gardensValue.forEach((garden) => {
      new mapboxgl.Garden()
        .setLngLat([ garden.lng, garden.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToGardens() {
    const bounds = new mapboxgl.LngLatBounds()
    this.gardensValue.forEach(garden => bounds.extend([ garden.lng, garden.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
