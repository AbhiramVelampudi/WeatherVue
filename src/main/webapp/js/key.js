// Assign the copied API key to the 'key' variable
const key = "2e67b40ed3f37bf3bb050ed201480aa5";
const result = document.getElementById("result");
const searchBtn = document.getElementById("search-btn");
const cityRef = document.getElementById("city");


cityRef.addEventListener("keydown", function (event) {
    if (event.key === "Enter") {
        event.preventDefault(); // Prevent the default form submission
        getWeather(); // Call the getWeather function when "Enter" is pressed
    }
});

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
            </div>
        </div>
        `;
      })
      .catch(() => {
        result.innerHTML = `<h3 class="msg">City not found</h3>`;
      });
  }
};

// Function to fetch weather details from API and display them




searchBtn.addEventListener("click", getWeather);
window.addEventListener("load", getWeather);
