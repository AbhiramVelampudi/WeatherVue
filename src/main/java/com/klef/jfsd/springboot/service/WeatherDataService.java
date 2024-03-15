package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.WeatherData;
import com.klef.jfsd.springboot.repository.WeatherDataRepository;

@Service
public class WeatherDataService {
    private final WeatherDataRepository weatherDataRepository;

    @Autowired
    public WeatherDataService(WeatherDataRepository weatherDataRepository) {
        this.weatherDataRepository = weatherDataRepository;
    }

    public void saveWeatherData(WeatherData weatherData) {
        weatherDataRepository.save(weatherData);
    }
}
