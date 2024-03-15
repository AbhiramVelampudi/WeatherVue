<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
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
                <a href="regweather" class="nav-item nav-link active ">Weather</a>
                <a href="news" class="nav-item nav-link">News</a>
                <a href="wmap" class="nav-item nav-link ">Weather Map</a>
                
                <a href="contact" class="nav-item nav-link">Contact</a>
                <a href="/" class="nav-item nav-link">LogOut</a>
            </div>
            
        </div>
    </nav>
    <!-- Navbar End -->
    <style>
        /* Your inline styles for font color */
        .search-container input,
        .search-container button,
        #result h2,
        .weather,
        .desc,
        #result h1,
        .temp-container .title,
        .temp-container .temp,
        .msg {
          color: white;
        }
                .rounded-chart {
  border-radius: 15px;
}


/* Add space between forecast items */
.forecast-container {
  display: flex;
  gap: 20px; /* Adjust the value as needed */
  flex-wrap: wrap;
}

.forecast-item {
  background-color: rgba(249, 249, 249, 0.7); /* Adjust the RGB values and opacity as needed */
  border-radius: 5px;
  padding: 15px; /* Adjust the padding */
  flex: 0 0 calc(20% - 20px); /* Adjust the width as needed */
  margin-bottom: 20px; /* Adjust the margin as needed */
}

#weatherChart {
  background-color: rgba(249, 249, 249, 0.7);  /* White background for the graph */
}
      </style>
    <div class="weather-container">
        <div class="wrapper">
          <div class="shape shape-1"></div>
          <div class="shape shape-2"></div>
          <div class="container">
            <div class="search-container">
              <input
                type="text"
                placeholder="Enter a city name"
                id="city"
                value="mumbai"
              />
              <button id="search-btn">Search</button>
            </div>
            <div id="result"></div>
          </div>
        </div>
      </div>
    
         <!-- Add a new div for displaying the 5-day forecast -->
<div id="forecast" class="forecast-container"></div> 
<script>
  const getForecast = () => {
    const cityValue = cityRef.value;

    // Fetch the 5-day forecast data
    const forecastUrl = `https://api.openweathermap.org/data/2.5/forecast?q=${cityValue}&appid=${key}&units=metric`;

    fetch(forecastUrl)
      .then((resp) => resp.json())
      .then((data) => {
        const forecastContainer = document.getElementById('forecast');
        forecastContainer.innerHTML = ''; // Clear the container before appending new data

        // Display the 5-day forecast
        for (let i = 0; i < data.list.length; i++) {
          const forecastData = data.list[i];
          const forecastDate = new Date(forecastData.dt * 1000); // Convert the Unix timestamp to a date

          const forecastElement = document.createElement('div');
          forecastElement.classList.add('forecast-item');

          forecastElement.innerHTML = `
            <h3>${forecastDate.toDateString()}</h3>
            <img src="https://openweathermap.org/img/w/${forecastData.weather[0].icon}.png">
            <h4>${forecastData.weather[0].main}</h4>
            <p>${forecastData.weather[0].description}</p>
            <div class="temp-container">
                <div>
                    <h5>Min</h5>
                    <h5>${forecastData.main.temp_min}&#176;</h5>
                </div>
                <div>
                    <h5>Max</h5>
                    <h5>${forecastData.main.temp_max}&#176;</h5>
                </div>
            </div>
          `;

          forecastContainer.appendChild(forecastElement);
        }
      })
      .catch(() => {
        const forecastContainer = document.getElementById('forecast');
        forecastContainer.innerHTML = `<h3 class="msg">Failed to fetch forecast data</h3>`;
      });
  };

  // Call the getForecast function when the search button is clicked
  searchBtn.addEventListener('click', () => {
    getWeather();
    getForecast();
  });

  window.addEventListener('load', () => {
    getWeather();
    getForecast();
  });

  const weatherChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: labels,
    datasets: [
      {
        label: 'Temperature (°C)',
        data: temperatures,
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        borderColor: 'rgba(75, 192, 192, 1)',
        borderWidth: 1,
      },
    ],
  },
  options: {
    scales: {
      y: {
        beginAtZero: true,
      },
    },
    plugins: {
      legend: {
        labels: {
          color: 'black', // Customize legend label color
        },
      },
    },
    elements: {
      point: {
        backgroundColor: 'rgba(75, 192, 192, 1)', // Customize point background color
      },
    },
    maintainAspectRatio: false, // Allow the chart to take the full width of its container
    responsive: true,
    layout: {
      padding: 10,
    },
    cornerRadius: 10, // Set the corner radius for the chart
  },
});




</script>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<canvas id="weatherChart" class="rounded-chart" width="180" height="100"></canvas>



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
    <script src="js/weather.js"></script>
</body>

</html>