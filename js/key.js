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
  }

  body.style.backgroundImage = backgroundImage;
}


// Function to fetch weather details from API and display them
const getWeather = () => {
  const cityValue = cityRef.value;
  if (cityValue.length === 0) {
    result.innerHTML = `<h3 class="msg">Please enter a city name</h3>`;
  } else {
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



searchBtn.addEventListener("click", getWeather);
window.addEventListener("load", getWeather);
