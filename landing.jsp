<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Use the implicit session object directly
    String userFname = (String) session.getAttribute("fname");
    // Get login success parameter
    String loginSuccess = request.getParameter("loginSuccess");
%>

<script>
    // JavaScript to display alert based on login status
    var userFname = "<%= userFname != null ? userFname : "null" %>";
    var loginSuccess = "<%= loginSuccess != null ? "true" : "false" %>";
    
    // Check if the user is logged in and the login was successful
    if (loginSuccess === "true" && userFname !== "null") {
        alert("Login successful! Welcome, " + userFname);
    } else if (userFname === "null") {
        alert("Please log in.");
    }
</script>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
		<title>Mental Health website</title>
		<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
		<style>
			.navbar1{height: 60px; padding-top: 20px; display: flex; justify-content: end; align-items: center; font-family: "open Sans", sans-serif; padding-right: 15px; padding-left: 15px; border-bottom: solid 3px #F4BB44;}
			.navbar1 a{position: relative; font-size: 18px; color: black; text-decoration: none; margin-right: 40px; font-weight: bold;}
			.logo img{height: 55px; width: 55px; justify-content: start; margin-left: -480px; top: -10px;}
			.logo a{color: black; font-size: 35px; font-weight: 600; font-weight: bold; top: -10px; }
			.navbar1 i{font-size: 25px; vertical-align: middle;}
			li{List-style: none; display: inline-block;}
			li a{color: black; font-size: 20px; font-weight: bold; text-decoration: none;}
			li a:hover{text-decoration: underline solid 2px; }
			/* Basic styling for navigation */
nav ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
    display: flex;
    background: white;
}

nav ul li {
    position: relative;
    padding: 15px;
}

nav ul li a {
    text-decoration: none;
    color: black;
    font-weight: bold;
}
.dropdown {
    position: relative;
    display: inline-block;
}
/* Dropdown menu styling */
.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    background: #ffffff;
    border-radius: 8px;
    overflow: hidden;
    width: 200px;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
    padding: 5px 0;
    z-index: 1000;
}

.dropdown-menu li {
    list-style: none;
    padding: 12px 18px;
    font-size: 16px;
    font-weight: 600;
    color: #333;
    cursor: pointer;
    transition: all 0.3s ease;
}

.dropdown-menu li:hover {
    background: #f5a623;
    color: white;
    transform: scale(1.05);
}

.dropdown-menu li a {
    color: black;
    display: block;
}

.dropdown-menu {
    opacity: 0;
    transform: translateY(-10px);
    transition: opacity 0.3s ease, transform 0.3s ease;
    display: none;
}
.dropdown:hover .dropdown-menu {
    display: block;
    opacity: 1;
    transform: translateY(0);
}

			.content{margin-top: 30px;}
			.content .content-left{display: block; width: 100%;}
			.content .content-left .info{max-width: 100%; display: flex; flex-direction: column;}
			.content .content-left .info h2{font-size: 50px; font-family: sans-serif; margin-bottom: 30px; margin-left: 60px;}
			.content .content-left .info p{font-size: 20px; line-height: 2pc; margin-bottom: 30px; font-family: sans-serif; margin: -8px 0 15px; margin-left: 60px;}
			.content .content-left button{padding: 10px 23px; background-color: white; color: black; border-radius: 30px; border: solid 3px #F4BB44; cursor: pointer; height: 50px; width: 300px; font-size: 20px; margin-left: 60px;}
			.content .content-left button:hover{background-color:  #F8D27C;}
			.content .content-right{display: block; width: 100%;}
			.content .content-right img{width: 400px; height: 400px; position: relative; user-select: none;  float: right; margin-right: 80px; top: -400px; border-radius: 100px;}
			.infor h3{font-size: 50px; font-family: sans-serif; margin-bottom: 30px; margin-left: 60px;}
			.list{display: inline-block; display: grid; grid-template-columns: repeat(3, 1fr);}
			.information{ width: 350px; height: auto; display: block; border-radius: 20px; position: relative; outline: 3px solid #F4BB44; margin-left: 50px; margin-top: 50px;}
			.information h4{font-size: 20px; color: black; text-decoration: none; font-weight: bold; margin-left: 5px; padding: 20px;}
			.information p{font-size: 20px; color: black; text-decoration: none; margin-left: 5px; padding: 20px; margin-top: -50px;}
			.information:hover{background-color:  #F8D27C;}
			.footer{background-color: #F4BB44; padding: 70px 0; }
			.footer .container{max-width: 1170px; margin: auto;}
			.row{display: flex;}
			ul{list-style: none;}
			.footer-col{width: 25%; padding: 0 15px;}
			.footer-col h5{font-size: 25px; font-weight: 500; color: black; margin-left: 50px; text-transform: capitalize; margin-bottom: 30px; position: relative; margin-top: -20px;}
			.footer-col h5 img{height: 55px; width: 55px; margin-top: -30px;}
			.footer-col h5::before{content: ''; position: absolute; left: 0; bottom: -10px; bacground-color: #e91e63; height: 2px; box-sizing: border-box; width: 50px;}
			.footer-col ul li:not(:last-child){margin-bottom: 10px;}
			.footer-col ul li a{font-size: 18px; text-transform: capitalize; color: #ffffff; text-decoration: none; font-weight: 300; color: black; display: block; margin-left: 10px; }
			.footer-col ul li a:hover{color: #ffffff; padding-left: 8px;}
			.footer-col .social-links a{display: inline-block; gap: 0; height: 40px; width: 40px;}
			.footer-col .social-links a i{font-size: 30px; margin-left: 50px;}
			.footer-col .social-links a:hover{color: black; background-color: black;}


		</style>
</head>
<body>
	<nav class="navbar1">
		<div class="logo">
			<img src="mind-check-logo.png" alt="">
			<a>Mind Mate</a>
		</div>
		<ul>
			<li><a href="landing.jsp">Home</a></li>
			<li class="dropdown">
				<a href="#">Help Yourself</a>
				<ul class="dropdown-menu">
					<li><a href="aintro.jsp">Anxiety</a></li>
					<li><a href="dintro.jsp">Depression</a></li>
					<li><a href="fintro.jsp">Financial Stress</a></li>
					<li><a href="acintro.jsp">Academic Stress</a></li>
					<li><a href="lintro.jsp">Loneliness</a></li>
					<li><a href="pintro.jsp">Personality</a></li>
				</ul>
			</li>
			<li><a href="aboutus.jsp">About</a></li>
			<li><a href="contactus.jsp">Contact</a></li>
           	<li>
                <% if (userFname != null) { %>
                    <i class='bx bxs-user-circle'></i><a href="profile.jsp"><%= userFname %></a>
                <% } %>
            </li>
        </ul>
    </nav>
	<section class="grid">
		<div class="content">
			<div class="content-left">
				<div class="info">
					<h2>Assess Your Mental Well-<br>
					being</h2>
					<p>Take a simple, reliable test to understand your emotional<br>
					state. MindMate helps you gain insight into your thoughts,<br>
					feelings, and overall mental well-being.Get started on your<br>
					journey to self-awareness and improved mental health today.</p>
				</div><br><br>
				<button onclick="location.href='test.jsp'">Start Your Assessment</button><br><br><br><br>
			</div>
			<div class="content-right">
				<img src="image 1.png" alt="" >
			</div>
		</div>
	</section>
	<section>
		<div class="infor">
			<h3>How it works?</h3>
		</div>
		<div class="list">
			<div class="information">
				<h4>Open the Test</h4>
				<p>Click on the "Start Assessment" button to being the MindMeet test.</p>
			</div>
			<div class="information">
				<h4>Answer Question</h4>
				<p>Carefully respond to 25 questions across four sections. Choose a score ranging from 1 to 5 for each question.</p>
			</div>
			<div class="information">
				<h4>Calculate Your Score</h4>
				<p>Once you've completed the questions, your scores will be calculated automaticall.</p>
			</div>
			<div class="information">
				<h4>Get Feedback</h4>
				<p>Discover your total score and refer to the provide feedback. Understand your level of depression based on the score range 				and gain valuable insights into your emotional well-being.</p>
			</div>
			<div class="information">
				<h4>Take Action</h4>
					<p>Use the feedback to determine if further steps are necessary. Seek professional help if required or explore self-					help techniques outlined in the app to improve your mental health.</p>
			</div>
		</div>
	</section><br><br>
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