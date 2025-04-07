<%@ page import="java.sql.*" %>
<html>
<head>
	<title>Mental Health website</title>
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
	<style>
		.navbar1{height: 50px; padding-top: 20px; display: flex; justify-content: end; align-items: center; font-family: "open 					Sans", sans-serif; padding-right: 15px; padding-left: 15px; border-bottom: solid 3px #F4BB44;}
		.navbar1 a{position: relative; font-size: 18px; color: black; text-decoration: none; margin-right: 40px; font-weight: 					bold;}
		.logo img{height: 55px; width: 55px; justify-content: start; margin-left: -600px; top: -10px;}
		.logo a{color: black; font-size: 35px; font-weight: 600; font-weight: bold; top: -10px;}			
		li{List-style: none; display: inline-block;}
		li a{color: black; font-size: 20px; font-weight: bold; text-decoration: none;}
		li a:hover{text-decoration: underline solid 2px; }
		.icon i{font-size: 50px; margin-left: 30px;}
		.wrapper{width: 25%; padding: 28px; border-radius: 10px; border: solid 2px #F4BB44; margin-left: 20px;}
		.wrapper .input-box{width: 100%; height: 50px; margin: 30px 0; position: relative;}
		.input-box input{width: 100%; height: 85%; background: transparent; border-radius: 40px; font-size: 16px; padding: 20px 				54px 20px 20px;}
		.input-box i{position: absolute; right: 20px; top: 50%; transform:translateY(-50%); font-size: 20px;}
		.wrapper .remember-forgot{display: flex; justify-content: space-between; font-size: 14.5px; margin: -15px 0 15px;}
		.remember-forgot a:hover{text-decoration: underline;}
		.wrapper .btn{width: 100%; height: 45px; background: #FFFFFF; border-radius: 40px; cursor: pointer; font-size: 16px; font-weight: 300;}
		.wrapper .btn:hover{background-color: #F4BB44;}
		.wrapper .register-link{font-size: 14.5px; text-align: center; margin-top: 20px;}
		.register-link a:hover{text-decoration: underline;}
		.footer{background-color: #F4BB44; padding: 70px 0; }
		.footer .container{max-width: 1170px; margin: auto;}
		.row{display: flex;}
		ul{list-style: none;}
		.footer-col{width: 25%; padding: 0 15px;}
		.footer-col h5{font-size: 25px; font-weight: 500; color: black; margin-left: 50px; text-transform: capitalize; margin-					bottom: 30px; position: relative; margin-top: -20px;}
		.footer-col h5 img{height: 55px; width: 55px;margin-top: -30px;}
		.footer-col h5::before{content: ''; position: absolute; left: 0; bottom: -10px; bacground-color: #e91e63; height: 2px; 					box-sizing: border-box; width: 50px;}
		.footer-col ul li:not(:last-child){margin-bottom: 10px;}
		.footer-col ul li a{font-size: 18px; text-transform: capitalize; color: #ffffff; text-decoration: none; font-weight: 					300; color: black; display: block; margin-left: 10px; }
		.footer-col ul li a:hover{color: #ffffff; padding-left: 8px;}
		.footer-col .social-links a{display: inline-block; gap: 0; height: 40px; width: 40px;}
		.footer-col .social-links a i{font-size: 30px; margin-left: 50px;}
		.footer-col .social-links a:hover{color: black; background-color; black;}
	</style>
	<script>
		function validateForm()
		{
			var email = document.forms["myform"]["email"].value.trim();
			var emailPattern = /^[a-zA-Z0-9_+&*-]+(?:\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$/;
			if (email == "") 
			{
				alert("Email must be filled out");
				document.forms["myform"]["email"].value = "";
				document.getElementById("email").focus();
				return false;
			}
			if (!emailPattern.test(email)) 
			{
				alert("Email is invalid");
				document.forms["myform"]["email"].value = "";
				document.getElementById("email").focus();
				return false;
			}
			
			// Validate Password
			var password = document.forms["myform"]["password"].value.trim();
			var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
			if (password == "") 
			{
				alert("Password must be filled out");
				document.forms["myform"]["password"].value = "";
				document.getElementById("password").focus();
				return false;
			}
			if (!passwordPattern.test(password)) 
			{
			alert("Password must contain at least 8 characters, one uppercase letter, one lowercase letter, one number, and one 					special character.");
				document.forms["myform"]["password"].value = "";
				document.getElementById("password").focus();
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
	<nav class="navbar1">
		<div class="logo">
			<img src="mind-check-logo.png" alt="">
			<a>Mind Mate</a>
		</div>
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="#">Help Yourself</a></li>
			<li><a href="aboutus.jsp">About</a></li>
			<li><a href="signup.jsp">SingUp</a></li>
			<li><a href="login.jsp">LogIn</a></li>
		</ul>
	</nav><br><br>
	<center>
		<div class="icon">
			<i class="fa-solid fa-user-group"></i>
		</div>
		<br>
		<div class="wrapper">	
			<form name="myform" onsubmit="return validateForm()" method="post">
				<div class="input-box">
					<input type="text" name="email" placeholder="Email"/>
					<i class='bx bxs-user'></i>
				</div>
				<div class="input-box">
					<input type="password" name="password" placeholder="Password"/>
					<i class='bx bxs-lock-alt'></i>
				</div>
				<div class="remember-forgot">
					<label><input type="checkbox">Remember me</label>
					<a href="#">Forgot password?</a>
				</div>
				<button type="submit" class="btn" name="btn">Login</button>
				<div class="register-link">
					<p>Don't have an account? <a 
					href="signup.jsp">Sign up</a></p>
				</div>
			</form>
	<%
        if (request.getParameter("btn") != null) {
            try {
                // Register the MySQL driver
                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

                // Establish connection
                String url = "jdbc:mysql://localhost:3306/mental_2025";
                Connection con = DriverManager.getConnection(url, "root", "123abc");

                // SQL query to check if the user exists
                String loginQuery = "SELECT * FROM user WHERE email = ? AND password = ?";
                PreparedStatement pst = con.prepareStatement(loginQuery);

                String email = request.getParameter("email");
                String password = request.getParameter("password");

                pst.setString(1, email);
                pst.setString(2, password); // You should hash the password for security

                ResultSet rs = pst.executeQuery();

                // Check if user exists
                if (rs.next()) {
                // User exists - proceed with login
                String fname = rs.getString("fname");
				session.setAttribute("fname", fname);

                // Redirect to home page with a success message
                response.sendRedirect("landing.jsp?loginSuccess=true");

                    // Store the login data in login_log table
                    String logQuery = "INSERT INTO users (email, password) VALUES (?, ?)";
                    PreparedStatement logPst = con.prepareStatement(logQuery);
                    logPst.setString(1, email);  // Assuming 'id' is the primary key in the 'user' table
		    		logPst.setString(2, password);
                    logPst.executeUpdate();
               } else {
                out.println("<script>alert('Invalid email or password.');</script>");
            }

                con.close();
            } catch (SQLException e) {
                out.println("Issue: " + e.getMessage());
            }
        }
    %>
		</div>
	</center>
	<br>
	<footer class="footer">
		<div class="container">
			<div class="row">	
				<div class="footer-col">
					<h5><img src="mind-check-logo.png" alt="">Mind Mate</h5>
					<ul>
						<li><a>2024 Mind Mate Limited</a></li>
					</ul>
				</div>	
				<div class="footer-col">
					<h5>Company</h5>
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<br>
						<li><a href="aboutus.jsp">About</a></li>
						<br>
						<li><a>Contribute to Resources</a></li>
					</ul>
				</div>
				<div class="footer-col">
					<h5>Contact</h5>
					<ul>
						<li><a href="contactus.jsp">Contact us</a></li>
						<br>
						<li><a href="#">Terms & Conditions</a></li>
						<br>
						<li><a href="#">Privacy Policy</a></li>
					</ul>
				</div>
				<div class="footer-col">
					<h5>follow us</h5>
					<div class="social-links">
						<a href="#"><i class='bx bxl-instagram'></i></a>
						<a href="#"><i class='bx bxl-linkedin-square' ></i></a>
					</div>
				</div>

			</div>
		</div>
	</footer>
	

</body>
</html>

