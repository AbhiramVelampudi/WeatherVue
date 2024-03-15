<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="UTF-8">
    <title>WEATHER EXPLORER</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&family=Open+Sans:wght@400;500;600&display=swap" rel="stylesheet">   

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Your custom styles for body background -->
    <style>
        body {
            background-image: url('../images/dark-1836972_1280.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
</head>

<body>

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
                <a href="weather" class="nav-item nav-link">Weather</a>
                <a href="userreg" class="nav-item nav-link">Login</a>
                <a href="contact" class="nav-item nav-link">Contact</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h1 class="text-center">Weather Data</h1>
                <form action="/search" method="post">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" name="city" placeholder="Enter city">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-primary">Search</button>
                        </div>
                    </div>
                </form>

                <c:if test="${not empty weatherData}">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title">Weather for ${weatherData.city}</h2>
                            <p class="card-text">Date: ${weatherData.date}</p>
                            <p class="card-text">Temperature: <fmt:formatNumber value="${weatherData.temperature}" pattern="#.#" />°C</p>
                            <p class="card-text">Humidity: ${weatherData.humidity}%</p>
                            <p class="card-text">Description: ${weatherData.description}</p>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JavaScript (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <!-- Your JavaScript for dynamic background changes -->
<!-- Your JavaScript for dynamic background changes -->
<!-- Your JavaScript for dynamic background changes -->
<!-- Your JavaScript for dynamic background changes -->
<script>
    const body = document.body;

    function setBackground(weatherDescription) {
        let backgroundImage = "";

        // Convert the weather description to lowercase for case-insensitive comparison
        const lowercasedDescription = weatherDescription.toLowerCase();

        // Check for specific keywords in the weather description
        if (lowercasedDescription.includes('clear')) {
            backgroundImage = "url('img/clear.gif')";
        } else if (lowercasedDescription.includes('cloud')) {
            backgroundImage = "url('img/cloudy.gif')";
        } else if (lowercasedDescription.includes('rain') || lowercasedDescription.includes('shower')) {
            backgroundImage = "url('img/rain.gif')";
        } else {
            backgroundImage = "url('../images/dark-1836972_1280.jpg')"; // Default background
        }

        body.style.backgroundImage = backgroundImage;
    }

    // Fetch the weather description dynamically from your JSP
    const weatherDescription = "${weatherData.description}"; // Replace with the actual attribute from your JSP
    setBackground(weatherDescription);
</script>



</body>
</html>
