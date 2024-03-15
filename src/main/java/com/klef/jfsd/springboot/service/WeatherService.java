package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.WeatherData;

public interface WeatherService {
    WeatherData fetchWeatherData(String city);
    void saveWeatherData(WeatherData weatherData);
    List<WeatherData> getAllWeatherDataForCity(String city);
    List<WeatherData> getAllWeatherData();

}