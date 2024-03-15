<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
    <title>WEATHER EXPLORER</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<br>
<span class="blink">
<h3 align=center style="color:red">${message}</h3>
</span>
<br>

<div class="form-container">
    <h2>Login</h2>
    <form method="post" action="checkuserlogin">
        <input type="email" name="email" placeholder="Username" style="width: 100%; padding: 10px; margin-bottom: 10px;">
        <input type="password" name="pwd" placeholder="Password" style="width: 100%; padding: 10px; margin-bottom: 10px;">
        <button type="submit" value="Login" style="width: 100%; padding: 10px; background-color: #007bff; color: #fff; border: none; border-radius: 5px;">Login</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
