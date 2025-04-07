<%@ page import="java.sql.*" %>
<html>
<head>
		<title>Mental Health website</title>
		<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<style>
			.navbar1{height: 50px; padding-top: 20px; display: flex; justify-content: end; align-items: center; font-family: "open 				Sans", sans-serif; padding-right: 15px; padding-left: 15px; border-bottom: solid 3px #F4BB44;}
			.navbar1 a{position: relative; font-size: 18px; color: black; text-decoration: none; margin-right: 40px; font-weight: 				bold;}
			.logo img{height: 55px; width: 55px; justify-content: start; margin-left: -415px; top: -10px;}
			.logo a{color: black; font-size: 35px; font-weight: 600; font-weight: bold; top: -10px;}
			li{List-style: none; display: inline-block;}
			li a{color: black; font-size: 20px; font-weight: bold; text-decoration: none;}
			li a:hover{text-decoration: underline solid 2px; }
			.icon i{font-size: 50px; margin-left: 30px;}
			.signup-box{width: 30%; height: 540px; padding: 28px; margin: 0 28px; margin: 0px 440px; border-radius: 10px; border: solid 2px #F4BB44;}
			input{height: 60px; width: 100%; border: 1px solid black; padding: 0 5px; background: transparent; margin-right: 20px; margin: -8px 0 15px; font-size: 15px; border-radius: 20px;}
			.form-submit-btn input{background: #FFFFFF; height: 40px; width: 100%; border: 1px solid black; padding: 0 5px; margin-right: 20px; margin: -8px 0 15px; font-size: 15px; border-radius: 20px;}
			.form-submit-btn input:hover{background-color: #F4BB44;}
			.pas p{font-size: 18px;}
			.register-link p{font-size: 17px; text-align: center; margin-top: 20px;}
			.register-link a:hover{text-decoration: underline;}
			.footer{background-color: #F4BB44; padding: 70px 0; }
			.footer .container{max-width: 1170px; margin: auto;}
			.row{display: flex;}
			ul{list-style: none;}
			.footer-col{width: 25%; padding: 0 15px;}
			.footer-col h5{font-size: 25px; font-weight: 500; color: black; margin-left: 50px; text-transform: capitalize; margin-bottom: 30px; position: relative; margin-top: -20px;}
			.footer-col h5 img{height: 55px; width: 55px;margin-top: -30px;}
			.footer-col h5::before{content: ''; position: absolute; left: 0; bottom: -10px; bacground-color: #e91e63; height: 2px; box-sizing: border-box; width: 50px;}
			.footer-col ul li:not(:last-child){margin-bottom: 10px;}
			.footer-col ul li a{font-size: 18px; text-transform: capitalize; color: #ffffff; text-decoration: none; font-weight: 300; color: black; display: block; margin-left: 10px; }
			.footer-col ul li a:hover{color: #ffffff; padding-left: 8px;}
			.footer-col .social-links a{display: inline-block; gap: 0; height: 40px; width: 40px;}
			.footer-col .social-links a i{font-size: 30px; margin-left: 50px;}
			.footer-col .social-links a:hover{color: black; background-color: black;}
	
		</style>
		<script>
		function validateForm() {
			var fname = document.forms["myform"]["fname"].value.trim();
			var namePattern = /^[a-zA-Z\s]+$/;

			// Validate First Name
			if (fname == "") {
				alert("First name must be filled out");
				document.forms["myform"]["fname"].value = "";
				document.getElementById("fname").focus();
				return false;
			}
			if (!namePattern.test(fname)) {
				alert("First name is invalid");
				document.forms["myform"]["fname"].value = "";
				document.getElementById("fname").focus();
				return false;
			}

			// Validate Last Name
			var lname = document.forms["myform"]["lname"].value.trim();
			if (lname == "") {
				alert("Last name must be filled out");
				document.forms["myform"]["lname"].value = "";
				document.getElementById("lname").focus();
				return false;
			}
			if (!namePattern.test(lname)) {
				alert("Last name is invalid");
				document.forms["myform"]["lname"].value = "";
				document.getElementById("lname").focus();
				return false;
			}

			// Validate Email
			var email = document.forms["myform"]["email"].value.trim();
			var emailPattern = /^[a-zA-Z0-9_+&*-]+(?:\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$/;
			if (email == "") {
				alert("Email must be filled out");
				document.forms["myform"]["email"].value = "";
				document.getElementById("email").focus();
				return false;
			}
			if (!emailPattern.test(email)) {
				alert("Email is invalid");
				document.forms["myform"]["email"].value = "";
				document.getElementById("email").focus();
				return false;
			}

			// Validate Password
			var password = document.forms["myform"]["password"].value.trim();
			var confirmPassword = document.forms["myform"]["confirmPassword"].value.trim();
			var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
			if (password == "") {
				alert("Password must be filled out");
				document.forms["myform"]["password"].value = "";
				document.getElementById("password").focus();
				return false;
			}
			if (!passwordPattern.test(password)) {
			alert("Password must contain at least 8 characters, one uppercase letter, one lowercase letter, one number, and one 					special character.");
				document.forms["myform"]["password"].value = "";
				document.getElementById("password").focus();
				return false;
			}
			if (confirmPassword == "") {
			alert("Confirm password must be filled out");
			document.forms["myform"]["confirmPassword"].value = "";
			document.getElementById("confirmPassword").focus();
			return false;
		}
		if (password !== confirmPassword) {
			alert("Password and Confirm Password do not match");
			document.forms["myform"]["confirmPassword"].value = "";
			document.getElementById("confirmPassword").focus();
			return false;
		}
		if(request.getParameter("btn")!=null) { 
			alert("User successfully registered.");
			window.location = "signup.jsp";
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
			<li><a href="contactus.jsp">Contact</a></li>
			<li><a href="signup.jsp">SingUp</a></li>
			<li><a href="login.jsp">LogIn</a></li>
		</ul>
	</nav><br><br>
	<center>
		<div class="icon">
			<i class="fa-solid fa-user-group"></i>
		</div>
		<br>
		<div class="signup-box">
			<form name="myform" onsubmit="return validateForm()" method="post">
				<input type="text" id="fname" name="fname" placeholder="Enter first Name"/>					
				<br>
				<input type="text" id="lname" name="lname" placeholder="Enter Last Name"/>
				<br>
				<input type="text" id="email" name="email" placeholder="Enter Email"/>
				<br>
				<input type="password" id="password" name="password" placeholder="Enter Password"/>
				<br>
				<input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password"/>
				<br><br>
				<div class="form-submit-btn">
					<input type="submit" name="btn" value="Sign Up">
				</div>
				<div class="pas">
					<p>By creating an account you are agreeing to our Terms of Service and Privacy Notice.</p>
				</div>
				<div class="register-link">
					<p>Already have an account?  <a href="login.jsp">Log in</a></p>
				</div>
			</form>
			<%
	if(request.getParameter("btn")!=null)
	{
		try
		{
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			String url = "jdbc:mysql://localhost:3306/mental_2025";
			Connection con = DriverManager.getConnection(url, "root", "123abc");
			
			String sql = "INSERT INTO user (fname, lname, email, password) VALUES(?, ?, ?, ?)";
			PreparedStatement pst = con.prepareStatement(sql);

			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			pst.setString(1, fname);
			pst.setString(2, lname);
			pst.setString(3, email);
			pst.setString(4, password);

			int rowsInserted = pst.executeUpdate();
        	if (rowsInserted > 0) 
			{

            	// Prepare SQL for 'result' table
         		String sqlResult = "INSERT INTO result (fname) VALUES (?)";
            	PreparedStatement pstResult = con.prepareStatement(sqlResult);

            	// Set parameters for 'result' table
            	pstResult.setString(1, fname);
				pstResult.executeUpdate();
			}

			con.close();
		}
		catch(SQLException e)	
		{
			out.println("issue"+ e);	
		}
	}
	%>
		</div>
	</center>
	<br>
	<% if(request.getParameter("btn")!=null) { %>
		<script>
			alert("User successfully registered.");
			window.location = "signup.jsp";
		</script>
		<% } %>

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

