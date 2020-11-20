import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 5, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mcdon24/ckhp214i22e1l19nufgbm1elf'
    });

    const marker = JSON.parse(mapElement.dataset.marker);
    new mapboxgl.Marker()
      .setLngLat([ marker[0].lng, marker[0].lat ])
      .addTo(map);

    fitMapToMarkers(map, marker)
  };
};

export { initMapbox };
