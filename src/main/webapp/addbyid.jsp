<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
<style>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f3f4f6;
            font-family: Arial, sans-serif;
        }

        form {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form label {
            display: block;
            margin-bottom: 10px;
        }

        form input[type="text"],
        form input[type="email"],
        form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        form input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
        }

        form input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</style>

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
				<a href="#" class="btn-download">
					<i class='bx bxs-cloud-download' ></i>
					<span class="text">Download PDF</span>
				</a>
			</div>



<form:form modelAttribute="customer" method="post" action="insertuser">

<table align="center">

<tr>
<td><label>Name</label></td>
<td>
<input type="text" placeholder="Name" name="name" required/>
</td>
</tr>

<tr><td></td></tr>

<tr>
<td><label>Email</label></td>
<td>
<input type="email" placeholder="Email" name="email" required/>
</td>
</tr>

<tr><td></td></tr>

<tr>
<td><label>Password</label></td>
<td>
<input type="password" placeholder="Password" name="pwd" required/>
</td>
</tr>

<tr><td></td></tr>

<tr>
<td><label>Location</label></td>
<td>
<input type="text" placeholder="Location" name="location" required/>
</td>
</tr>

<tr><td></td></tr>

<tr>
<td><label>ContactNo</label></td>
<td>
<input type="text" placeholder="ContactNo" name="contact" pattern="[1-9][0-9]{9}" required/>
</td>
</tr>

<tr><td></td></tr>
<tr><td></td></tr>

<tr align="center">
<td colspan=2><input type="submit" value="Add" class="button"></td>
</tr>

</table>

</form:form>
					
					</main>
		<!-- MAIN -->
		<!-- ... -->


		
	</section>
	<!-- CONTENT -->
	

	<script src="js/admin.js"></script>
</body>
</html>