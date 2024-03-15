package com.klef.jfsd.springboot.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Column;
import java.util.Date;

@Entity
@Table(name = "weather_table")
public class WeatherData {
    public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public String getDate() {
    return date;
  }

  public void setDate(String iso8601Date) {
    this.date = iso8601Date;
  }

  public double getTemperature() {
    return temperature;
  }

  public void setTemperature(double temperature) {
      this.temperature = Math.round(temperature * 10.0) / 10.0;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }
  
  @Column(name = "humidity")  // Add humidity column
  private int humidity;

  public int getHumidity() {
      return humidity;
  }

  public void setHumidity(int humidity) {
      this.humidity = humidity;
  }
  
  public boolean isRaining() {
	return raining;
}

public void setRaining(boolean raining) {
	this.raining = raining;
}

@Column(name = "raining")
  private boolean raining; ;




  @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "city")
    private String city;

    @Column(name = "date")
    private String date;

    @Column(name = "temperature")
    private double temperature;

    @Column(name = "description")
    private String description;

	@Override
	public String toString() {
		return "WeatherData [humidity=" + humidity + ", raining=" + raining + ", id=" + id + ", city=" + city
				+ ", date=" + date + ", temperature=" + temperature + ", description=" + description + "]";
	}

	
	

    
}