import { Controller } from "@hotwired/stimulus";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="map"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  };

  connect() {
    console.log("Connected to geocoder");

    mapboxgl.accessToken = this.apiKeyValue;
    document.getElementById("geocoder").appendChild(geocoder.onAdd(map));
  }
}
