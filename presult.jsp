<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%
    // Use the implicit session object directly
    String userFname = (String) session.getAttribute("fname");
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
		<title>Mental Health website</title>
		<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<style>
			.navbar1{height: 60px; padding-top: 20px; display: flex; justify-content: end; align-items: center; font-family: "open 				Sans", sans-serif; padding-right: 15px; padding-left: 15px; border-bottom: solid 3px #F4BB44;}
			.navbar1 a{position: relative; font-size: 18px; color: black; text-decoration: none; margin-right: 40px; font-weight: bold;}
			.logo img{height: 55px; width: 55px; justify-content: start; margin-left:  -480px; top: -10px;}
			.logo a{color: black; font-size: 35px; font-weight: 600; font-weight: bold; top: -10px; }
			.navbar1 i{font-size: 25px; vertical-align: middle;}
			li{List-style: none; display: inline-block;}
			li a{color: black; font-size: 20px; font-weight: bold; text-decoration: none;}
			li a:hover{text-decoration: underline solid 2px; }
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
			.content .content-left{display: block; width: 100%; height: auto;}
			.content .content-left img{width: 550px; height: 420px; position: relative; user-select: none;  float: left; margin-left: 40px; top: -30px; border-radius: 100px;}
			.content .content-right{display: block; width: 100%; height: auto;}
			.content .content-right .info h2{font-size: 40px; font-family: sans-serif; margin-bottom: 30px; text-align: center; margin-top: 150px;}
            .content .content-right .info{max-width: 100%; display: flex; flex-direction: column;}
            .content .content-right .result{font-size: 50px; font-weight: bold; color: #F4BB44; text-align: center;  margin-bottom: 150px;}
            body { font-family: "Open Sans", sans-serif; }
            .pie h3{font-size: 30px;  text-align: center; }
            #myPieChart {max-width: 500px; margin: 20px auto; }
            .info{font-size: 15px; margin-left: 60px; }
            .button-container {display: flex; justify-content: space-between; padding: 0 20px;}
            #leftButton {background-color: #f1b64d; color: black; font-size: 20px; width: 300px; height: 50px; cursor: pointer; border-radius: 30px;}
            #rightButton {background-color: #f1b64d; color: black; font-size: 20px; width: 300px; height: 50px; cursor: pointer; border-radius: 30px;}
			#centerButton {background-color: #f1b64d; color: black; font-size: 20px; width: 300px; height: 50px; cursor: pointer; border-radius: 30px;}
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
        <script>
            window.onload = function() {
                var score = localStorage.getItem('quizScore'); // Retrieve score from localStorage
                console.log("Sending score:", score); // Debugging line
                if (score) {
                    document.getElementById('scoreDisplay').innerText = score + '%'; // Display the score
                    fetch('psaveScore.jsp', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'score=' + encodeURIComponent(score)
        })
        .then(response => response.text())
        .then(data => console.log("Server response:",data))
        .catch(error => console.error('Error:', error));
                    localStorage.removeItem('quizScore'); // Clear score from localStorage after use
                    var percentageScore = parseFloat(score);
                    var remainingScore = 100 - percentageScore;
    
                    // Create the pie chart
                    var ctx = document.getElementById('myPieChart').getContext('2d');
                    var myPieChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: ['Anxiety Level', 'Remaining'],
                            datasets: [{
                                data: [percentageScore, remainingScore],
                                backgroundColor: ['#f1b64d', '#e0e0e0'], // Colors for the slices
                            }]
                        },
                        options: {
                            responsive: true,
                            plugins: {
                                legend: {
                                    display: true,
                                    position: 'top',
                                }
                            }
                        }
                    });
                } else {
                    document.getElementById('scoreDisplay').innerText = 'No score available.'; // Display if no score
                }
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
    </nav><br>
    <div class="info">
        <h1>Getting to know yourself is the first step towards a mentally healthier life.</h1>
    </div>
    <section class="grid">
		<div class="content">
			<div class="content-left">
					<img src="final.jpeg" alt="" >
			</div>
			<div class="content-right">
                <div class="info">
				    <h2>Your Personality Level Result:</h2>
				</div>
                <div class='result' id='scoreDisplay'>No score available.</div>
			</div>
		</div>
	</section>
    <center>
    <section>
        <div class="pie">
            <h3>Understanding Your Personality Assessment</h3>
            <canvas id="myPieChart"></canvas> <!-- Canvas for pie chart -->
        </div>
		<%
    String lastAssessment = (String) session.getAttribute("last_assessment");
	String redirectPage = "defaultIntro.jsp";
    if (lastAssessment != null) {
        if ("anxiety".equals(lastAssessment)) {
            redirectPage = "aintro.jsp";
        } else if ("depression".equals(lastAssessment)) {
            redirectPage = "dintro.jsp";
        } else if ("Financial Stress".equals(lastAssessment)) {
            redirectPage = "fintro.jsp";
        } else if ("Personality".equals(lastAssessment)) {
            redirectPage = "pintro.jsp";
        } else if ("Academic Stress".equals(lastAssessment)) {
            redirectPage = "acintro.jsp";
        } else if ("Lonelinaess".equals(lastAssessment)) {
            redirectPage = "lintro.jsp";
        }
    }
%>
        <div class="button-container">
			<button onclick="location.href='<%= redirectPage %>'" id="rightButton">Help Yourself</button>
            <%
    String Assessment = (String) session.getAttribute("assessment");
	String redirect = "defaultconsultation.jsp";
    if (Assessment != null) {
        if ("anxiety".equals(Assessment)) {
            redirect = "aconsultation.jsp";
        } else if ("depression".equals(Assessment)) {
            redirect = "dconsultation.jsp";
        } else if ("Financial Stress".equals(Assessment)) {
            redirect = "fconsultation.jsp";
        } else if ("Personality".equals(Assessment)) {
            redirect = "pconsultation.jsp";
        } else if ("Academic Stress".equals(Assessment)) {
            redirect = "acconsultation.jsp";
        } else if ("Lonelinaess".equals(Assessment)) {
            redirect = "lconsultation.jsp";
        }
    }
%>
            <button onclick="location.href='<%= redirect %>'" id="centerButton">Book a Consultation</button>
            <button onclick="location.href='test.jsp'" id="rightButton">Take Another Free Report</button>
        </div>
    </section>
    </center><br><br>
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
						<li><a href="tandc.jsp">Terms & Conditions</a></li>
						<br>
						<li><a href="pandp.jsp">Privacy Policy</a></li>
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

