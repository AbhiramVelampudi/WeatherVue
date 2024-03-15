package com.klef.jfsd.springboot.service;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.klef.jfsd.springboot.api.WeatherApiResponse;
import com.klef.jfsd.springboot.model.WeatherData;
import com.klef.jfsd.springboot.repository.WeatherDataRepository;


@Service
public class WeatherServiceImpl implements WeatherService {

    private final String OPEN_WEATHER_MAP_API_KEY = "ce2f7d0e68c1e1ae3d1d883857ba61f0"; // Replace with your API key
    private final String OPEN_WEATHER_MAP_URL = "https://api.openweathermap.org/data/2.5/weather?";

    @Autowired
    private WeatherDataRepository weatherDataRepository;
    
    

    @Override
    public WeatherData fetchWeatherData(String city) {
        String apiUrl = OPEN_WEATHER_MAP_URL + "q=" + city + "&appid=" + OPEN_WEATHER_MAP_API_KEY;

        RestTemplate restTemplate = new RestTemplate();
        WeatherApiResponse response = restTemplate.getForObject(apiUrl, WeatherApiResponse.class);

        WeatherData weatherData = new WeatherData();
        weatherData.setCity(city);

        // Set the date in ISO 8601 format
        LocalDateTime now = LocalDateTime.now();
        String iso8601Date = DateTimeFormatter.ISO_LOCAL_DATE_TIME.format(now);
        weatherData.setDate(iso8601Date);

        // Convert temperature from Kelvin to Celsius
        double temperatureInKelvin = response.getMain().getTemp();
        double temperatureInCelsius = temperatureInKelvin - 273.15;
        int humidity = response.getMain().getHumidity();
        weatherData.setTemperature(temperatureInCelsius);
        weatherData.setHumidity(humidity);
        weatherData.setDescription(response.getWeather()[0].getDescription());

        // Check if it is currently raining
        boolean isRaining = checkIfRaining(response);
        weatherData.setRaining(isRaining);

        saveWeatherData(weatherData);

        return weatherData;
    }

    private boolean checkIfRaining(WeatherApiResponse response) {
        for (WeatherApiResponse.Weather weather : response.getWeather()) {
            String description = weather.getDescription().toLowerCase();
            if (description.contains("rain") || description.contains("drizzle") || description.contains("thunderstorm")) {
                return true; // It is raining
            }
        }
        return false; // It is not raining
    }



    
    @Override
    public List<WeatherData> getAllWeatherDataForCity(String city) {
        // Implement the logic to retrieve all weather data for a given city
        // For example, assuming you have a method findByCity in your repository:
        return weatherDataRepository.findByCity(city);
    }
    
    @Override
    public List<WeatherData> getAllWeatherData() {
        return weatherDataRepository.findAll();
    }


    @Override
    public void saveWeatherData(WeatherData weatherData) {
        weatherDataRepository.save(weatherData);
    }
}