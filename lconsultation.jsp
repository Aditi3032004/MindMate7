<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement" %>
<meta charset="UTF-8">
<%
    String userFname = (String) session.getAttribute("fname");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
		<title>Mental Health website</title>
        <style>
            
			.navbar1{height: 70px; padding-top: 20px; display: flex; justify-content: end; align-items: center; font-family: "open Sans", sans-serif; padding-right: 15px; padding-left: 15px; border-bottom: solid 3px #F4BB44;}
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
header{font-size: 2.2rem;
    font-weight: 600;
    color: #4a90e2; /* Calming blue */
    text-align: center;
    font-family: "Poppins", sans-serif;
    background: linear-gradient(to right, #4a90e2, #81c784);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    padding: 10px 0 5px; /* Adds some spacing above and below */
    position: relative;
    margin-top: -120px;
   
}
header::after {
    content: "";
    display: block;
    width: 250px;
    height: 4px;
    background-color: #4a90e2;
    margin: 2px auto 0;
    border-radius: 2px;
    line-height: 1;
    margin-top: -40px;
    margin-bottom: 10px;
}

/* Responsive Design */
@media (max-width: 768px) {
    header {
        font-size: 2rem;
    }
}

@media (max-width: 480px) {
    header {
        font-size: 1.8rem;
    }
}
.main-content{
    background: url('consul1.webp') no-repeat center center/cover;
    min-height: calc(100vh - 80px); /* Adjust according to your layout */
    padding-top: 80px;
}   
.doctors-container {
    display: flex;
    justify-content: center; /* Center align horizontally */
    align-items: flex-start; /* Align at the top */
    flex-wrap: nowrap; /* Prevent wrapping */
    gap: 20px; /* Add space between doctors */
    white-space: nowrap; /* Prevent text wrapping */
    padding: 20px;
}
.doctor-container {
    max-width: 350px;
    height: 650px;
    padding: 20px;
    border: 3px solid black;
    border-radius: 25px;
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: flex-start; /* Button ko neeche set karega */
}
        .doctor-container img { width: 250px; 
    height: 250px; /* Square shape ke liye */
    border-radius: 50%;
    object-fit: cover; /* Image ko crop karke fit karega */
    margin: 0 auto; /* Horizontally center */
    display: block;
    margin-bottom: -3px;
}
        .doctor-container h2 {
    font-size: 30px; /* Doctor ka naam bada karne ke liye */
    font-weight: bold;
    margin-bottom: -5px;
}

.doctor-container p {
    font-size: 20px; /* Description text ke liye */
    white-space: normal;
    word-wrap: break-word;
}
@media (max-width: 1024px) {
    .doctor-container {
        width: 100%; /* Full width on small screens */
        max-width: 90%;
    }
}
        .hidden { display: none; }
        .form-container { margin-top: 20px; }
        button { background-color: #f4a261; border: none; padding: 10px 20px; cursor: pointer; border-radius: 20px; font-size: 20px; /* Button ka text bada karne ke liye */
            padding: 10px 15px;}
        button:hover { background-color: #e76f51; }

        .form-container {
            width: 350px;
            background: rgba(255, 255, 255, 0.95);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            z-index: 1000;
            display: none; /* Initially hidden */
        }

        /* Show Form When Needed */
        .form-container.show {
            display: block;
        }

        /* Form Heading */
        .form-container h3 {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        /* Label Styling */
        .form-container label {
            font-size: 16px;
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #444;
            text-align: left;
        }

        /* Input Fields */
        .form-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        /* Submit Button */
        .form-container button {
            background: #007bff;
            color: white;
            font-size: 16px;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s ease;
            width: 100%;
        }

        .form-container button:hover {
            background: #0056b3;
        }

        /* Close Button */
        .close-btn {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 20px;
            cursor: pointer;
            color: #333;
        }

        /* Dark Background Overlay */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
            display: none;
        }

        /* Hidden Class */
        .hidden {
            display: none;
        } 
.footer{ background: url('consul1.webp') no-repeat center center/cover; padding: 70px 0;
    background-size: cover;
    background-position: center; }
			.footer .container{max-width: 1170px; height: auto;}
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
    <div class="main-content">
    <header>
        <h1>Loneliness</h1>
    </header>
    <div class="doctors-container">
    <div class="doctor-container">
        <img src="ldr1.webp" alt="Dr. Kiran Malhotra">
        <h2>Dr. Kiran Malhotra</h2>
        <p><strong>Specialization:</strong> Social Anxiety & Emotional Support</p>
        <p>Dr. Kiran Malhotra has over 10 years of experience helping individuals cope with loneliness, social isolation, and emotional distress. She uses therapy, mindfulness, and social engagement techniques to improve mental well-being and foster connections.</p>
        <button onclick="showForm()">Book Consultation</button>
    </div>
    <div class="doctor-container">
        <img src="ldr2.webp" alt="Dr. Arjun Sethi">
        <h2>Dr. Arjun Sethi</h2>
        <p><strong>Specialization:</strong>Relationship Building & Mental Wellness</p>
        <p>Dr. Arjun Sethi specializes in guiding individuals through loneliness by improving communication skills, fostering healthy relationships, and building emotional resilience. With 12 years of experience, he combines counseling and behavioral therapy to enhance social confidence.</p>
        <button onclick="showForm()">Book Consultation</button>
    </div>
    <div class="doctor-container">
        <img src="ldr3.webp" alt="Dr. Meera Kapoor">
        <h2>Dr. Meera Kapoor</h2>
        <p><strong>Specialization:</strong>Mental Well-being & Self-Companionship</p>
        <p>Dr. Meera Kapoor helps individuals overcome loneliness by fostering self-compassion, emotional resilience, and personal fulfillment. With 9 years of experience, she integrates therapy, mindfulness, and structured social engagement techniques to support mental well-being.</p>
        <button onclick="showForm()">Book Consultation</button>
    </div>
    </div>
    <div id="overlay" class="overlay" onclick="hideForm()">
    <div id="consultationForm" class="form-container hidden">
        <span class="close-btn" onclick="hideForm()"></span>
        <h3>Book Your Consultation</h3>
        <form>
            <label for="name">Your Name:</label>
            <input type="text" id="name" name="name" required><br><br>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>
            
            <label for="date">Preferred Date:</label>
            <input type="date" id="date" name="date" required><br><br>
            
            <button type="submit">Submit</button>
        </form>
    </div>
</div>
<script>
    function showForm() {
        document.getElementById("consultationForm").classList.add("show");
        document.getElementById("consultationForm").classList.remove("hidden");
        document.getElementById("overlay").style.display = "block";
    }

    function hideForm() {
        document.getElementById("consultationForm").classList.remove("show");
        document.getElementById("consultationForm").classList.add("hidden");
        document.getElementById("overlay").style.display = "none";
    }
</script>
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
