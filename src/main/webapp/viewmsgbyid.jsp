<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	<link rel="stylesheet" href="css/admin.css">

	<title>AdminHub</title>
</head>
<body>


<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand">
			<i class='bx bxs-smile'></i>
			<span class="text">AdminHub</span>
		</a>
		<ul class="side-menu top">
			<li class="active">
				<a href="/WeatherAPISDPProject/adminhome">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
			<li>
				<a href="/WeatherAPISDPProject/deleteuser">
					<i class='bx bxs-shopping-bag-alt' ></i>
					<span class="text">Delete User</span>
				</a>
			</li>
			<li>
				<a href="/WeatherAPISDPProject/addbyid">
					<i class='bx bxs-doughnut-chart' ></i>
					<span class="text">Add User</span>
				</a>
			</li>
			<li>
				<a href="/WeatherAPISDPProject/viewallmsgs">
					<i class='bx bxs-message-dots' ></i>
					<span class="text">Message</span>
				</a>
			</li>
			<li>
				<a href="/WeatherAPISDPProject/updatestatus">
					<i class='bx bxs-group' ></i>
					<span class="text">Actions</span>
				</a>
			</li>
		</ul>
		<ul class="side-menu">
			<li>
				<a href="/WeatherAPISDPProject/bulkmail">
					<i class='bx bxs-cog' ></i>
					<span class="text">Alerts</span>
				</a>
			</li>
			<li>
			
				<a href="/WeatherAPISDPProject/adminlogin" class="logout">
					<i class='bx bxs-log-out-circle' ></i>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- SIDEBAR -->


	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->
		<nav>
			<i class='bx bx-menu' ></i>
			<a href="#" class="nav-link">Categories</a>
			<form action="#">
				<div class="form-input">
					<input type="search" placeholder="Search...">
					<button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
				</div>
			</form>
			<input type="checkbox" id="switch-mode" hidden>
			<label for="switch-mode" class="switch-mode"></label>
			<a href="#" class="notification">
				<i class='bx bxs-bell' ></i>
				<span class="num">8</span>
			</a>
			<h3 align="right">Welcome,  ${ename }</h3>
		</nav>
		<!-- NAVBAR -->

		<!-- MAIN -->
		<main>
			<div class="head-title">
				<div class="left">
					<h1>Dashboard</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">Dashboard</a>
						</li>
						<li><i class='bx bx-chevron-right' ></i></li>
						<li>
							<a class="active" href="#">Home</a>
						</li>
					</ul>
				</div>
				
			</div>

					<ul class="box-info">
				 <li>
            <i class='bx bxs-calendar-check'></i>
            <span class="text">
                <h3 id="date"></h3>
                <p id="time"></p>
            </span>
        </li>
				<li>
				<i class='bx bxs-group' ></i>
        <div class="statistics-box">
                <h3 id="anotherStatCount">${ccount}</h3>
                <p >Total Users</p>
                 </div>
        </li>
				<li>
					<div id="quote-container">
    <p id="quote"></p>
  </div>
				</li>
			</ul>


			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Message Details</h3>
						<a href="/WeatherAPISDPProject/adminhome" class="nav-item nav-link active">Go Back</a>
						<i class='bx bx-filter' ></i>
					</div>
					<table>
Email : ${form.email}<br><br>
<span style="color: red;">Subject:</span> ${form.subject}<br><br>
Dear Team, <br>
${form.message}<br><br><br><br>
Best regards,<br>
${form.name}<br>



					</table>
				</div>
				
			</div>
		</main>
		<!-- MAIN -->
		<!-- ... -->
 <script>
        // Get current date and time
        const updateDateTime = () => {
            const now = new Date();
            const date = now.toDateString();
            const time = now.toLocaleTimeString();
            document.getElementById('date').textContent = date;
            document.getElementById('time').textContent = time;
        };

        // Update date and time every second
        setInterval(updateDateTime, 1000);
        
        
        // Fetch data from the API
        fetch("https://type.fit/api/quotes")
          .then(function(response) {
            return response.json();
          })
          .then(function(data) {
            // Select a random quote
            const randomIndex = Math.floor(Math.random() * data.length);
            const randomQuote = data[randomIndex].text;
            
            // Display the quote on the webpage
            const quoteElement = document.getElementById('quote');
            quoteElement.innerHTML = randomQuote;
          })
          .catch(function(error) {
            console.log('Error fetching and parsing data', error);
          });
    </script>



<!-- ... -->
		
	</section>
	<!-- CONTENT -->
	

	<script src="js/admin.js"></script>
</body>
</html>