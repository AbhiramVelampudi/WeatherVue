<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta charset="UTF-8">

    <meta name="viewport"
      content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />

    <link rel="stylesheet" type="text/css" href="https://api.tomtom.com/maps-sdk-for-web/cdn/5.x/5.36.1/maps/maps.css">
    <script src="https://api.tomtom.com/maps-sdk-for-web/cdn/5.x/5.36.1/maps/maps-web.min.js"></script>
    <script src="https://api.tomtom.com/maps-sdk-for-web/cdn/5.x/5.36.1/services/services-web.min.js"></script>
    <script src="currentWeatherData.js"></script>

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
  <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
  <script src="https://unpkg.com/leaflet-openweathermap@1.1.0/dist/leaflet-openweathermap.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Weather App</title>
    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap"
      rel="stylesheet"
    />
    <!-- Stylesheet -->
    <link rel="stylesheet" href="css/wether.css" />
    <meta charset="utf-8">
    <title>WeatherVue: Your Forecast Portal</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&family=Open+Sans:wght@400;500;600&display=swap" rel="stylesheet">   

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
    </div>
    <!-- Spinner End -->




    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5">
        <a href="index.html" class="navbar-brand d-flex align-items-center">
            <h1 class="m-0">WeatherVue</h1>
        </a>
        <button type="button" class="navbar-toggler me-0" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="/WeatherAPISDPProject" class="nav-item nav-link">Home</a>
                <a href="about" class="nav-item nav-link">About</a>
                <a href="service" class="nav-item nav-link">Services</a>
                <a href="regweather" class="nav-item nav-link ">Weather</a>
                <a href="news" class="nav-item nav-link">News</a>
                <a href="wmap" class="nav-item nav-link active">Weather Map</a>
                
                <a href="contact" class="nav-item nav-link">Contact</a>
                <a href="/" class="nav-item nav-link">LogOut</a>
            </div>
            
        </div>
    </nav>
    <!-- Navbar End -->
    <style>
      body, html {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
  }

  #container {
    display: flex;
    height: 100vh;
  }

  #left {
    flex: 0 0 300px;
    background-color: #34495e;
    color: #ecf0f1;
    padding: 20px;
    box-shadow: 2px 0px 5px rgba(58, 55, 55, 0.1);
  }

  #right {
    flex: 1;
    position: relative;
    overflow: hidden;
  }

  #map {
    width: 100%;
    height: 100%;
  }

  #controls {
    margin-bottom: 20px;
  }

  input.text {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #bdc3c7;
    border-radius: 5px;
  }

  select, input[type="radio"] {
    margin-bottom: 10px;
  }

  input[type="button"] {
    background-color: #3498db;
    color: #ecf0f1;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  input[type="button"]:hover {
    background-color: #2980b9;
  }

  .clear {
    clear: both;
  }
    </style>
    
    <div id="container">
        <div id="left">
          <div id="controls">
            
            <label for="location">Location:</label>
            <input class="text" id="location" type="text" />
            <label for="weather-layer">Weather Layer:</label>
            <select onchange="updateLayer(this)">
              <option value="">None</option>
              <option value="clouds_new">Clouds</option>
              <option value="precipitation_new">Precipitation</option>
              <option value="pressure_new">Pressure</option>
              <option value="wind_new">Wind</option>
              <option value="temp_new">Temperature</option>
            </select>
            <label>Units:</label>
            <input type="radio" name="units" value="metric" onchange="updateUnits(this)">℃</input>
            <input type="radio" name="units" value="imperial" checked onchange="updateUnits(this)">℉</input>
            <br />
            <input type="button" value="Search" onclick="findLocation()" />
          </div>
        </div>
        <div id="right">
          <div id="map" class="map"></div>
        </div>
      </div>
  
     <script>
      const application = {
    name: 'OpenWeatherMap API',
    version: '1.0'
  }
  
  const tomTom = {
    key: '17gHInMoaAm0oCQq5GQnT88fHd6XmBr1',
    mapPadding: 40,
    map: null,
    popup: null,
    searchZoom: 11
  };
  
  const openWeatherMap = {
    appid: '2e67b40ed3f37bf3bb050ed201480aa5',
    tileUrl: 'https://tile.openweathermap.org/map/{layer}/{z}/{x}/{y}.png?appid={appid}',
    layer: '',
    layerName: 'owm_layer',
    sourceName: 'owm_source',
    attribution:  'OpenWeatherMap.org',
    units: 'imperial',
    directions: [
     'N', 'NNE', 'NE', 'ENE', 'E', 'ESE', 'SE', 'SSE',
     'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW'
    ],
    maxDegree: 360
  };
  
  const ids = {
    html: {
      map: 'map',
      location: 'location',
      imperial: 'imperial',
      metric: 'metric'
    }
  };
  
  init();
  
  function appendHeading(element, text) {
    const h3 = document.createElement('H3');
    h3.appendChild(document.createTextNode(text));
    element.appendChild(h3);
  }
  
  function appendIcon(element, icon) {
    const img = document.createElement('IMG');
    img.src = 'http://openweathermap.org/img/wn/' + icon + '.png';
    element.appendChild(img);
  }
  
  function appendLine(element, text, withoutBreak) {
    element.appendChild(document.createTextNode(text));
    if (!withoutBreak)
      element.appendChild(document.createElement('BR'));
  }
  
  function centerAndZoom(response) {
    const location = getLocation(response);
    if (location != null)
      tomTom.map.flyTo({ center: location.position, zoom: tomTom.searchZoom });
  }
  
  function clearLayer() {
    if (tomTom.map.getLayer(openWeatherMap.layerName))
      tomTom.map.removeLayer(openWeatherMap.layerName);
  
    if (tomTom.map.getSource(openWeatherMap.sourceName))
      tomTom.map.removeSource(openWeatherMap.sourceName);
  }
  
  function displayPopup(response, location) {
    if (!tomTom.map.loaded())
      return;
  
    clearPopup();
  
    if (response.hasOwnProperty('cod') && response.hasOwnProperty('message')) {
      alert('Error: ' + response.message);
      return;
    }
  
    tomTom.popup = new tt.Popup({ maxWidth: 'none' })
      .setLngLat(location)
      .setDOMContent(formatText(response))
      .addTo(tomTom.map);
  }
  
  function clearPopup() {
    if (tomTom.popup == null)
      return;
  
    tomTom.popup.remove();
    tomTom.popup = null;
  }
  
  function findLocation() {
    if (!tomTom.map.loaded()) {
      alert('Please try again later, map is still loading.');
      return;
    }
  
    clearPopup();
  
    const queryText = getValue(ids.html.location);
  
    tt.services.fuzzySearch({ key: tomTom.key, query: queryText })
      .go()
      .then(centerAndZoom)
      .catch(function(error) {
         alert('Could not find location (' + queryText + '). ' + error.message);
    });
  }
  
  function formatText(response) {
    const weather = response.weather[0];
    const tempUnits = openWeatherMap.units == 'imperial' ? '℉' : '℃';
    const temp = Math.round(response.main.temp);
  
    const outerDiv = document.createElement('DIV');
    outerDiv.classList.add('popup');
    
    appendIcon(outerDiv, weather.icon);
    appendHeading(outerDiv, getName(response));
  
    const innerDiv = document.createElement('DIV');
    outerDiv.appendChild(innerDiv);
  
    appendLine(innerDiv, weather.description);
    appendLine(innerDiv, 'Temperature: ' + temp + ' ' + tempUnits);
    appendLine(innerDiv, 'Humidity: ' + response.main.humidity + '%');
    appendLine(innerDiv, 'Wind Speed: ' + formatWind(response.wind), true);
    return outerDiv;
  }
  
  function formatWind(wind) {
    const units = openWeatherMap.units == 'imperial' ? 'mph' : 'km/h';
    const speed = Math.round(wind.speed) + ' ' + units;
    const direction = getDirection(wind.deg);
    return direction == null ? speed : direction + ' ' + speed;
  }
  
  function getCurrentWeatherData(clickEvent) {
    currentWeatherData( {
      appid: openWeatherMap.appid,
      lat: clickEvent.lngLat.lat,
      lon: clickEvent.lngLat.lng,
      units: openWeatherMap.units
    })
    .go()
    .then(function(response) {
      displayPopup(response, clickEvent.lngLat);
    })
    .catch(function(error) {
      clearPopup();
  
      const message = error.hasOwnProperty('message') ? error.message : error;
      alert('Error: ' + message);
    });
  }
  
  function getDirection(degrees) {
    const increment = openWeatherMap.maxDegree / openWeatherMap.directions.length;
    return degrees >= 0 && degrees < openWeatherMap.maxDegree ?
      openWeatherMap.directions[Math.floor(degrees / increment)] : null;
  }
  
  function getLocation(response) {
     if (response.results.length > 0)
       return response.results[0];
  
    alert('Could not find location.');
    return null;
  }
  
  function getName(response) {
    const name = response.hasOwnProperty('name') ? response.name : '';
    return name == null || name == '' ?
      'lat=' + response.coord.lat + ', lon=' + response.coord.lon : name;
  }
  
  function getValue(elementId) {
    return document.getElementById(elementId).value;
  }
  
  function init() {
    tt.setProductInfo(application.name, application.version);
  
    tomTom.map = tt.map({ key: tomTom.key, container: ids.html.map })
      .on('click', getCurrentWeatherData);
  }
  
  function updateLayer(element) {
    openWeatherMap.layer = element.options[element.selectedIndex].value;
  
    if (!tomTom.map.loaded())
      return;
  
    clearLayer();
    clearPopup();
  
    const tileUrl = openWeatherMap.tileUrl
      .replace('{layer}', openWeatherMap.layer)
      .replace('{appid}', openWeatherMap.appid);
  
    tomTom.map.addSource(openWeatherMap.sourceName, {
      type: 'raster',
      tiles: [ tileUrl ],
      tileSize: 256,
      minZoom: 0,
      maxZoom: 12,
      attribution: openWeatherMap.attribution
    });
  
    tomTom.map.addLayer({
      'id': openWeatherMap.layerName,
      'type': 'raster',
      'source': openWeatherMap.sourceName,
      'layout': { 'visibility': 'visible' }
    });
  }
  
  function updateUnits(element) {
    openWeatherMap.units = element.value;
  
    if (tomTom.map.loaded())
      clearPopup();
  }
  // hukum
  function CurrentWeatherDataOptions(options) {
    this.options = options;
  
    if (!options.hasOwnProperty('url'))
      options.url = 'https://api.openweathermap.org/data/2.5/weather';
  }
  
  CurrentWeatherDataOptions.prototype.go = function() {
    const options = this.options;
  
    return new Promise(function(fulfill, reject) {
      if (!formatLocationUrl(options)) {
        reject('currentWeatherData call is invalid.');
        return;
      }
  
      fetchResponse(options, fulfill, reject);
    });
  
    function addOptionalParameter(options, name) {
      if (options.hasOwnProperty(name))
        addParameter(options, name);
    }
  
    function addParameter(options, name, value) {
      options.url += options.hasParameters ? '&' : '?';
      options.url += name + '=' + encodeURIComponent(value || options[name]);
      options.hasParameters = true;
    }
  
    function fetchResponse(options, fulfill, reject) {
      fetch(options.url, {
        method: 'GET',
        mode: 'cors',
        credentials: 'same-origin'
      })
      .then(function(response) {
        parseResponse(response, fulfill, reject);
      })
      .catch(function(error) {
        reject(error);
      });
    }
  
    function formatLocationUrl(options) {
      if (!hasOwnProperties(options, [ 'appid', 'lat', 'lon' ]))
        return false;
  
      addParameter(options, 'lat', options.lat);
      addParameter(options, 'lon', options.lon);
      addOptionalParameter(options, 'units');
      addParameter(options, 'appid');
      return true;
    }
  
    function hasOwnProperties(options, properties) {
      if (options == null)
        return false;
  
      for(const property of properties)
        if (!options.hasOwnProperty(property))
          return false;
  
      return true;
    }
  
    function parseResponse(response, fulfill, reject) {
      response
        .json()
        .then(function(obj) {
          if (!obj.hasOwnProperty('error'))
            fulfill(obj);
          else
            reject(obj.error.description);
        })
        .catch(function(error) {
          reject(error);
        });
    }
  }
  
  function currentWeatherData(options) {
    return new CurrentWeatherDataOptions(options);
  }
  
     </script>>



    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/parallax/parallax.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="js/key.js"></script>
</body>

</html>