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

<div class="actions">
    <h3>Admin Actions</h3>
    <ul id="adminActionsList">
        <%-- Add list items here dynamically using Java code --%>
        <c:forEach items="${adminActions}" var="action">
            <li>${action}</li>
        </c:forEach>
    </ul>
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
        
        function addActionToAdminList(action) {
            var list = document.getElementById('adminActionsList');
            var listItem = document.createElement('li');
            listItem.textContent = action;
            list.appendChild(listItem);
        }

        // Example usage of the addActionToAdminList function
        // You can call this function wherever you want to add an action to the list
        <%-- Example usage:
        <%
            addActionToAdminList("Added a new user on 2023-10-14");
        %>
        --%>
    </script>

		
	</section>
	<!-- CONTENT -->
	

	<script src="js/admin.js"></script>
</body>
</html>