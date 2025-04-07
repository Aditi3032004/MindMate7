<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>
<%
    // Use the implicit session object directly
    String userFname = (String) session.getAttribute("fname");
%>
<html>
<head>
    <title>Mental Health website</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        html {
    scroll-behavior: smooth;
}
        .navbar1{height: 60px; padding-top: 20px; display: flex; justify-content: end; align-items: center; font-family: "open Sans", sans-serif; padding-right: 15px; padding-left: 15px; border-bottom: solid 3px #F4BB44;}
			.navbar1 a{position: relative; font-size: 18px; color: black; text-decoration: none; margin-right: 32px; font-weight: bold;}
			.logo img{height: 55px; width: 55px; justify-content: start; margin-left: -600px; top: -10px;}
			.logo a{color: black; font-size: 35px; font-weight: 600; font-weight: bold; margin-left: -15px; top: -10px; }
        .navbar1 i{font-size: 1.5rem; vertical-align: middle; }
        li{List-style: none; display: inline-block;}
			li a{color: black; font-size: 20px; font-weight: bold; text-decoration: none;}
			li a:hover{text-decoration: underline solid 2px; }.footer{background-color: #F4BB44; padding: 70px 0; }
            ul {
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
header {
    background: linear-gradient(90deg, #FFD700, #FFA500);
    color: white;
    text-align: center;
    padding: 1 rem;
    font-size: 1.8rem;
    font-weight: bold;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}
main {
    max-width: 900px;
    margin: 30px auto;
    padding: 25px;
    background: white;
    border-radius: 12px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

h1, h2 {
    color: #2c3e50;
    text-align: center;
}

h2 {
    font-size: 1.8rem;
    margin-bottom: 15px;
    border-bottom: 3px solid #FFA500;
    display: inline-block;
    padding-bottom: 5px;
}

p, ul {
    line-height: 1.8;
    font-size: 1.1rem;
    text-align: justify;
}

ul {
    padding-left: 20px;
    list-style: none;
}

section {
    margin-bottom: 25px;
    padding: 20px;
    background: #fff8e1;
    border-radius: 10px;
    transition: transform 0.3s ease-in-out;
}

section:hover {
    transform: scale(1.02);
    box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
}
.icon {
    width: 24px; /* Adjust size */
    height: 24px;
    margin-right: 8px; /* Space between icon & text */
    vertical-align: middle;
}

.offerings {
    background-color: #FAF3DD;
    border-radius: 15px;
    padding: 20px;
    margin-bottom: 25px;
    max-width: 870px;
}

.offerings h2 {
    font-size: 28px;
    color: #333;
    margin-bottom: 15px;
    text-align: center;
}

.offer-item {
    display: flex;
    align-items: center;
    margin: 10px 0;
    gap: 10px;
}

.offer-item strong {
    margin-right: 5px;
    color: #333;
}



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
        body {animation: fadeIn 1s ease-in-out;}
        .testimonials {
    text-align: center;
    background-color: #fff3cd; /* Light Yellow */
    padding: 40px 20px;
    border-radius: 10px;
    margin-top: 30px;
}

.testimonials h2 {
    color: black; /* Dark Yellow */
    font-size: 28px;
    margin-bottom: 20px;
}

.testimonial-container {
    display: flex;
    justify-content: center;
    gap: 20px;
    flex-wrap: wrap;
}

.testimonial {
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 300px;
}

.testimonial img {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    margin-bottom: 10px;
}

.testimonial p {
    font-size: 16px;
    color: #555;
    font-style: italic;
}

.testimonial h4 {
    color: #333;
    margin-top: 10px;
    font-weight: bold;
}

    </style>
</head>
<body>
    <nav class="navbar1">
		<div class="logo">
			<img src="mind-check-logo.png" alt="">
			<a>Mind Mate</a>
		</div>
		<ul1>
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
        </ul1>
    </nav>
    <header>
        <h1>About Us</h1>
    </header>
    <main>
        <section class="about">
            <h2>Welcome to Mind Mate</h2>
            <p>A platform dedicated to promoting mental well-being and providing resources for those seeking support.</p>
        </section>

        <section class="vision">
            <h2>Our Vision</h2>
            <p>We believe that mental health is just as important as physical health. Our goal is to break the stigma surrounding mental health and empower individuals to take charge of their emotional well-being.</p>
        </section>

        <section class="offerings">
            <h2>What We Offer</h2>
            <div class="offer-item">
                <img src="brain.png" alt="Brain Icon" class="icon">
                <strong>Mental Health Assessments:</strong> Anxiety, Depression, loneliness, financial stress, Academic Stress, and personality tests.
            </div>
            <div class="offer-item">
                <img src="bar-chart.png" alt="Bar Icon" class="icon">
                <strong>Personalized Insights:</strong> Detailed reports and visual representations (pie charts) of assessment results.
            </div>
            <div class="offer-item">
                <img src="video.png" alt="Video Icon" class="icon">
                <strong>Video Resources:</strong> Access to curated videos if assessment scores exceed 60%.
            </div>
            <div class="offer-item">
                <img src="follow-up.png" alt="Progress Icon" class="icon">
                <strong>Progress Tracking:</strong> View past assessment history to monitor mental health.
            </div>
            <div class="offer-item">
                <img src="rocket.png" alt="Future Icon" class="icon">
                <strong>Future Scope:</strong> Plans to introduce doctor consultations and professional guidance.
            </div>
        </section>
        

        <section class="commitment">
            <h2>Our Commitment</h2>
            <p>We are committed to making mental health resources accessible and easy to understand. You are not alone - we are here for you!</p>
        </section>

        <section class="testimonials">
            <h2>What Our Users Say</h2>
            <div class="testimonial-container">
                <div class="testimonial">
                    <img src="woman.png" alt="User 1">
                    <p>"Mind Mate has completely changed how I manage my stress. The assessments are so helpful!"</p>
                    <h4>- Aisha Sharma</h4>
                </div>
                <div class="testimonial">
                    <img src="boy.png" alt="User 2">
                    <p>"I love the personalized insights! It helped me understand my emotions better."</p>
                    <h4>- Rohit Verma</h4>
                </div>
                <div class="testimonial">
                    <img src="girl.png" alt="User 3">
                    <p>"The video resources are a lifesaver. I highly recommend this platform to everyone!"</p>
                    <h4>- Sneha Kapoor</h4>
                </div>
                <div class="testimonial">
                    <img src="user4.png" alt="User 4">
                    <p>"The assessments and reports gave me a clear understanding of my mental health. Great platform!"</p>
                    <h4>- Arjun Mehta</h4>
                </div>
            </div>
        </section>
    </main>
</body>
</html>