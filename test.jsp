<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>
<%
    // Use the implicit session object directly
    String userFname = (String) session.getAttribute("fname");
    String assessment_name = request.getParameter("assessment");
    

    if (assessment_name != null) {
        // Store last attempted assessment in session
        session.setAttribute("last_assessment", assessment_name);
    }

    if (assessment_name != null) {
        // Store last attempted assessment in session
        session.setAttribute("assessment", assessment_name);
    }

        // Insert into database if needed
        if (request.getParameter("btnNext") != null && assessment_name != null && userFname != null) {

    
                // Redirect based on the selected assessment
                if ("anxiety".equals(assessment_name)) {
                    response.sendRedirect("anxiety.jsp");
                } else if ("depression".equals(assessment_name)) {
                    response.sendRedirect("depression.jsp");
                } else if ("Financial Stress".equals(assessment_name)) {
                    response.sendRedirect("financial.jsp");
                } else if ("Personality".equals(assessment_name)) {
                    response.sendRedirect("personality.jsp");
                } else if ("Academic Stress".equals(assessment_name)) {
                    response.sendRedirect("academic.jsp");
                } else if ("Lonelinaess".equals(assessment_name)) {
                    response.sendRedirect("loneliness.jsp");
                }
            
        }
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
			.logo img{height: 55px; width: 55px; justify-content: start; margin-left: -530px; top: -10px;}
			.logo a{color: black; font-size: 35px; font-weight: 600; font-weight: bold; margin-left: -15px; top: -10px; }
        .navbar1 i{font-size: 1.5rem; vertical-align: middle; }
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
        .sen{font-size: 2em; font-weight: bold; position: relative; display: inline-block; margin-bottom: 15px;}
        .sen::after{content: ''; display: block; width: 130%; height: 3px; background-color: orange; margin: 0 auto; margin-top: -15px; margin-left: -100px;}
        .sen2{font-size: 25px; margin-top: -20px;}
        .list{display: inline-block; display: grid; grid-template-columns: repeat(3, 1fr);}
        .photo img{width: 280px; height: 280px; display: block; padding: 10px; border-radius: 20px; position: relative; outline: 3px solid #F4BB44; margin-left: 50px; margin-top: 50px;}
        .photo1 img{width: 280px; height: 280px; display: block; padding: 10px; border-radius: 20px; position: relative; outline: 3px solid #F4BB44; margin-left: 50px; margin-top: -20px;}
        .photo2 img{width: 280px; height: 280px; display: block; padding: 10px; border-radius: 20px; position: relative; outline: 3px solid #F4BB44; margin-left: 50px; margin-top: -20px;}
        .photo img, .photo1 img, .photo2 img {transition: transform 0.3s ease-in-out;}
        .photo img:hover, .photo1 img:hover, .photo2 img:hover {transform: scale(1.1);}
        .title{padding: 30px 0 50px;}
        .title label{text-align: center; font-weight: bold; font-size: 25px; margin-top: 100px; margin-bottom: -50px; cursor: pointer; transition: color 0.3s ease, text-shadow 0.3s ease, transform 0.3s ease-in-out;}
        .title label:hover {color: #F4BB44; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); transform: scale(1.1);}
        @keyframes shake {0% { transform: translateX(0); } 25% { transform: translateX(-5px); } 50% { transform: translateX(5px); } 75% { transform: translateX(-5px); } 100% { transform: translateX(0); }}
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
        .btnNext {background-color: #F4BB44; color: black; font-size: 18px; font-weight: bold; padding: 10px 25px; border: 2px solid black; border-radius: 8px; cursor: pointer; transition: all 0.3s ease; display: block; margin: 20px auto; }
        .btnNext:hover {background-color: black; color: #F4BB44; }
        .btnNext:active {transform: scale(0.95); }
        @keyframes fadeIn {from { opacity: 0; transform: translateY(20px); }to { opacity: 1; transform: translateY(0); }}
        body {animation: fadeIn 1s ease-in-out;}

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
    </nav><br>
    <center>
        <div class="sen">
            <h2>Free  Mental  Health  Assessment</h2>           
        </div>
        <div class="sen2">
            <p>Mental health matters just as much as physical health.</p>
        </div>
        <form action="test.jsp" method="post">
            <div class="list">
                <div class="photo">
                    <img src="anxiety.jpg" alt="">
                    <div class="title">
                        <label for="assessment-anxiety">
                            <input type="radio" name="assessment" value="anxiety" id="assessment-anxiety" class="assessment-radio" />
                            Anxiety
                        </label>
                    </div>
                </div>
                <div class="photo">
                    <img src="depression.jpg" alt="">
                    <div class="title">
                        <label for="assessment-depression">
                            <input type="radio" name="assessment" value="depression" id="assessment-depression" class="assessment-radio" />
                            Depression
                        </label>
                    </div>
                </div>
                <div class="photo">
                    <img src="financial1.jpeg" alt="">
                    <div class="title">
                        <label for="assessment-Financial Stress">
                            <input type="radio" name="assessment" value="Financial Stress" id="assessment-Financial Stress" class="assessment-radio" />
                            Financial Stress
                        </label>
                    </div>
                </div>
                <div class="photo1">
                    <img src="personality.jpeg" alt="">
                    <div class="title">
                        <label for="assessment-Personality">
                            <input type="radio" name="assessment" value="Personality" id="assessment-Personality" class="assessment-radio" />
                            Personality
                        </label>
                    </div>
                </div>
                <div class="photo2">
                    <img src="acadamic.webp" alt="">
                    <div class="title">
                        <label for="assessment-Academic Stress">
                            <input type="radio" name="assessment" value="Academic Stress" id="assessment-Academic Stress" class="assessment-radio" />
                            Academic Stress
                        </label>
                    </div>
                </div>
                <div class="photo2">
                    <img src="loanliness.jpg" alt="">
                    <div class="title">
                        <label for="assessment-Lonelinaess">
                            <input type="radio" name="assessment" value="Lonelinaess" id="assessment-Lonelinaess" class="assessment-radio" />
                            Lonelinaess
                        </label>
                    </div>
                </div>
            </div>
            <br>
            <button type="submit" name="btnNext" class="btnNext">Next</button>
        </form>
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
