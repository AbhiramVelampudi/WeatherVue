<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	<link rel="stylesheet" href="css/admin.css">
	
<style>
	form {
		display: flex;
		flex-direction: column;
		max-width: 400px;
		margin: 20px;
		padding: 20px;
		background-color: #f9f9f9;
		border-radius: 5px;
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	}

	form label {
		font-weight: bold;
		margin-bottom: 5px;
	}

	input[type="text"],
	textarea,
	select {
		width: 100%;
		padding: 12px;
		margin: 8px 0;
		display: inline-block;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
	}

	input[type="submit"] {
		background-color: #4CAF50;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		border-radius: 4px;
		cursor: pointer;
		transition: background-color 0.3s;
	}

	input[type="submit"]:hover {
		background-color: #45a049;
	}

	.form-group {
		margin-bottom: 20px;
	}

	.alert-success {
		color: #155724;
		background-color: #d4edda;
		border-color: #c3e6cb;
		padding: 15px;
		border-radius: 4px;
		margin-top: 20px;
	}

	.alert-error {
		color: #721c24;
		background-color: #f8d7da;
		border-color: #f5c6cb;
		padding: 15px;
		border-radius: 4px;
		margin-top: 20px;
	}
	


    .user-list ul {
        list-style-type: none;
        padding: 0;
    }

    .user-list li {
        margin-bottom: 10px;
    }
    
        .container {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        margin: 20px;
    }

    .form-container {
        flex: 1 1 40%;
        margin-right: 20px;
    }

    .user-list {
        flex: 1 1 40%;
    }

    .form-container form {
        display: flex;
        flex-direction: column;
    }
</style>
<style>
    /* ... existing styles ... */

    .user-list table {
        width: 100%;
        border-collapse: collapse;
    }

    .user-list th, .user-list td {
        border: 1px solid #dddddd;
        padding: 8px;
        text-align: left;
    }

    .user-list th {
        background-color: #f2f2f2;
    }
</style>


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
				<a href="#" class="btn-download" onclick="downloadCSV()">
        <i class='bx bxs-cloud-download' ></i>
        <span class="text">Download CSV</span>
    </a>
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

<br><br>
<c:if test="${not empty message}">
    <div style="color: green; font-weight: bold">
        ${message}
    </div>
</c:if>
<br>
<div class="container">
        <div class="form-container">
        <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mail Alerts By Location</h2>
            <form action="/WeatherAPISDPProject/bulkbyloc" method="post">
                <label for="location">Location:</label>
                <select name="location" id="location">
                    <c:forEach items="${locations}" var="location">
                        <option value="${location}">${location}</option>
                    </c:forEach>
                </select>

                <label for="subject">Email Subject:</label>
                <input type="text" name="subject" id="subject" required>

                <label for="message">Email Message:</label>
                <textarea name="message" id="message" rows="4" required></textarea>

                <button type="submit">Send Email</button>
            </form>
        </div>

        <div class="user-list">
    <h2>Registered Users in Selected Location</h2>
    <br>
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
        </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.name}</td>
                <td>${user.email}</td>
            </tr>
        </c:forEach>
    </table>
</div>
    </div>

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
        
        // Search functionality
        document.getElementById('searchIcon').addEventListener('click', function() {
            var input, filter, table, tr, td, i, txtValue;
            input = prompt("Search for names:");
            filter = input.toUpperCase();
            table = document.getElementById("userTable");
            tr = table.getElementsByTagName("tr");

            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1]; // Change index to the column you want to filter

                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        });

        // Filter functionality
        document.getElementById('filterIcon').addEventListener('click', function() {
            var filterInput = prompt("Filter by parameter (e.g., location, email):");
            var table, tr, td, i;
            table = document.getElementById("userTable");
            tr = table.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[2]; // Change index to the column you want to filter

                if (td) {
                    if (td.textContent.toUpperCase() === filterInput.toUpperCase()) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        });
        
        var filteredData = []; // Stores the filtered data

        // Function to update the filtered data array
        function updateFilteredData() {
            filteredData = [];
            var rows = document.querySelectorAll('table tr');
            for (var i = 0; i < rows.length; i++) {
                if (rows[i].style.display !== 'none') {
                    var rowData = [];
                    var cols = rows[i].querySelectorAll('td');
                    for (var j = 0; j < cols.length; j++) {
                        rowData.push(cols[j].innerText);
                    }
                    filteredData.push(rowData);
                }
            }
        }

        // Function to download user data as CSV
        function downloadCSV() {
            updateFilteredData();
            var csv = 'ID,NAME,LOCATION,EMAIL,CONTACT\n';
            for (var i = 0; i < filteredData.length; i++) {
                csv += filteredData[i].join(',') + '\n';
            }

            // Create a CSV Blob
            var blob = new Blob([csv], { type: 'text/csv' });

            // Create a download link
            var a = window.document.createElement('a');
            a.href = window.URL.createObjectURL(blob);
            a.download = 'user_data.csv';
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
        }
    </script>

		
	</section>
	<!-- CONTENT -->
	

	<script src="js/admin.js"></script>
</body>
</html>