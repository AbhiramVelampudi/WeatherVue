// Assign the copied API key to the 'key' variable
const key = "2e67b40ed3f37bf3bb050ed201480aa5";
const result = document.getElementById("result");
const searchBtn = document.getElementById("search-btn");
const cityRef = document.getElementById("city");

function setBackground(weatherMain) {



  const body = document.body;
  let backgroundImage = "";

  switch (weatherMain) {
    case 'Clear':
      backgroundImage = "url('img/clear.gif')";
      break;
    case 'Clouds':
      backgroundImage = "url('img/cloudy.gif')";
      break;
    case 'Rain':
      backgroundImage = "url('img/rain.gif')";
      break;
    case 'THUNDERSTORM':
      backgroundImage = "url('img/rain.gif')";
      break;
    case 'Snow':
      backgroundImage = "url('img/snowy.jpg')";
      break;
    case 'Haze':
      backgroundImage = "url('img/haze.gif')";
      break;
    case 'Mist':
      backgroundImage = "url('img/mist.gif')";
      break;
    case 'Smoke':
      backgroundImage = "url('img/haze.gif')";
      break;
  }

  body.style.backgroundImage = backgroundImage;
}
window.addEventListener("load", () => {
  getWeather(); // Call the getWeather function on page load
});

const getWeather = () => {
  const cityValue = cityRef.value;

  const forecastUrl = `https://api.openweathermap.org/data/2.5/forecast?q=${cityValue}&appid=${key}&units=metric`;
  
  // Check if the cityValue is empty and the user's location is available
  if (cityValue.length === 0 && 'geolocation' in navigator) {
    navigator.geolocation.getCurrentPosition((position) => {
      const latitude = position.coords.latitude;
      const longitude = position.coords.longitude;
      const url = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${key}&units=metric`;
      
      fetch(url)
        .then((resp) => resp.json())
        .then((data) => {
          // Update the city input field with the user's location
          cityRef.value = data.name;
          
          // Display weather information
          console.log(data);
          console.log(data.weather[0].icon);
          console.log(data.weather[0].main);
          console.log(data.weather[0].description);
          console.log(data.name);
          console.log(data.main.temp_min);
          console.log(data.main.temp_max);
          setBackground(data.weather[0].main);
          result.innerHTML = `
            <h2>${data.name}</h2>
            <h4 class="weather">${data.weather[0].main}</h4>
            <h4 class="desc">${data.weather[0].description}</h4>
            <img src="https://openweathermap.org/img/w/${data.weather[0].icon}.png">
            <h1>${data.main.temp} &#176;</h1>
            <div class="temp-container">
                <div>
                    <h4 class="title">min</h4>
                    <h4 class="temp">${data.main.temp_min}&#176;</h4>
                </div>
                <div>
                    <h4 class="title">max</h4>
                    <h4 class="temp">${data.main.temp_max}&#176;</h4>
                </div>
            </div>
            <div>
            </div>
            <div>
            </div>
            <div>
            </div>
          `;
        })
        .catch(() => {
          result.innerHTML = `<h3 class="msg">Unable to fetch weather data for your location</h3>`;
        });
    });
  } else {
    // Handle the case when the cityValue is provided by the user
    const url = `https://api.openweathermap.org/data/2.5/weather?q=${cityValue}&appid=${key}&units=metric`;
    cityRef.value = "";
    
    fetch(url)
      .then((resp) => resp.json())
      .then((data) => {
        console.log(data);
        console.log(data.weather[0].icon);
        console.log(data.weather[0].main);
        console.log(data.weather[0].description);
        console.log(data.name);
        console.log(data.main.temp_min);
        console.log(data.main.temp_max);
        setBackground(data.weather[0].main);
        result.innerHTML = `
        <h2>${data.name}</h2>
        <h4 class="weather">${data.weather[0].main}</h4>
        <h4 class="desc">${data.weather[0].description}</h4>
        <img src="https://openweathermap.org/img/w/${data.weather[0].icon}.png">
        
        <h1>${data.main.temp} &#176;</h1>
        <div class="temp-container">
            <div>
                <h4 class="title">min</h4>
                <h4 class="temp">${data.main.temp_min}&#176;</h4>
            </div>
            <div>
                <h4 class="title">max</h4>
                <h4 class="temp">${data.main.temp_max}&#176;</h4>
                <br><br><br>
            </div>
        </div>
        `;
      })
      .catch(() => {
        result.innerHTML = `<h3 class="msg">City not found</h3>`;
      });

      

      fetch(forecastUrl)
      .then((resp) => resp.json())
      .then((data) => {
        // Extract the list of forecasts
        const forecasts = data.list;
    
        // Get the current date
        const currentDate = new Date().toDateString();
    
        // Display the 5-day forecast
        let forecastHtml = '<div class="forecast-container d-flex">';
        let previousDate = '';
        for (let i = 0; i < forecasts.length; i++) {
          const forecastDate = new Date(forecasts[i].dt_txt).toDateString();
          if (forecastDate !== currentDate && forecastDate !== previousDate) {
            forecastHtml += `
              <div class="forecast-item">
                <h4>${forecastDate}</h4>
                <img src="https://openweathermap.org/img/w/${forecasts[i].weather[0].icon}.png">
                <h5>${forecasts[i].weather[0].main}</h5>
                <p>${forecasts[i].weather[0].description}</p>
                <p>Temperature: ${forecasts[i].main.temp} &#176;C</p>
              </div>
            `;
            previousDate = forecastDate;
          }
        }
        forecastHtml += '</div>';
    
        // Append the forecast HTML to the result
        result.innerHTML += forecastHtml;
      })
      .catch(() => {
        // Handle error for forecast fetch
        result.innerHTML += `<h3 class="msg">Unable to fetch forecast data</h3>`;
      });

      fetch(forecastUrl)
      .then((resp) => resp.json())
      .then((data) => {
        // Extract the list of forecasts
        const forecasts = data.list;
    
        // Extract data for the graph
        const uniqueDates = [];
        const temperatures = [];
        const humidity = [];
        const windSpeed = [];
    
        for (const forecast of forecasts) {
          const forecastDate = new Date(forecast.dt_txt).toDateString();
          uniqueDates.push(forecastDate);
          temperatures.push(forecast.main.temp);
          humidity.push(forecast.main.humidity);
          windSpeed.push(forecast.wind.speed);
        }
    
        // Create a multi-data point graph
        const ctx = document.getElementById('weatherChart').getContext('2d');
        const weatherChart = new Chart(ctx, {
          type: 'line',
          data: {
            labels: uniqueDates,
            datasets: [
              {
                label: 'Temperature (°C)',
                data: temperatures,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1,
              },
              {
                label: 'Humidity',
                data: humidity,
                backgroundColor: 'rgba(192, 75, 192, 0.2)',
                borderColor: 'rgba(192, 75, 192, 1)',
                borderWidth: 1,
              },
              {
                label: 'Wind Speed',
                data: windSpeed,
                backgroundColor: 'rgba(192, 192, 75, 0.2)',
                borderColor: 'rgba(192, 192, 75, 1)',
                borderWidth: 1,
              },
            ],
          },
          options: {
            maintainAspectRatio: true,
            aspectRatio: 4, // Reduce the chart width by 20%
            scales: {
              y: {
                beginAtZero: true,
              },
            },
          },
        });
      })
      .catch(() => {
        // Handle error for forecast fetch
        result.innerHTML += `<h3 class="msg">forecast data</h3>`;
      });
    
    
    

    

  }
};

// Function to fetch weather details from API and display them




searchBtn.addEventListener("click", getWeather);
window.addEventListener("load", getWeather);
