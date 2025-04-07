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
		<title>Mental Health website</title>
		<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

		<style>
        html body {
            overflow-x: hidden; /* Prevent horizontal scrolling */
            opacity: 0;
            transform: translateY(20px);
            animation: fadeIn 1s ease-out forwards;
            background-color: #f8f8f8;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
			.navbar1{height: 60px; padding-top: 20px; display: flex; justify-content: end; align-items: center; font-family: "open Sans", sans-serif; padding-right: 15px; padding-left: 15px; border-bottom: solid 3px #F4BB44;}
			.navbar1 a{position: relative; font-size: 18px; color: black; text-decoration: none; margin-right: 40px; font-weight: bold;}
			.logo img{height: 55px; width: 55px; justify-content: start; margin-left: -600px; top: -10px;}
			.logo a{color: black; font-size: 35px; font-weight: 600; font-weight: bold; top: -10px; }
			.navbar1 i{font-size: 25px; vertical-align: middle;}
            li{List-style: none; display: inline-block;}
			li a{color: black; font-size: 20px; font-weight: bold; text-decoration: none; }
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

            .background-container {
    width: 100%;
    height: 100vh; /* Full screen height */
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(to right, rgba(255, 255, 255, 0.7), rgba(255, 255, 255, 0.7)),
                url('contactus1.webp') left center / 50% auto no-repeat,
                url('contactus.webp') right center / 50% auto no-repeat;
}
            /* Centering the form */

            .contact-form {
    padding: 25px;
    backdrop-filter: blur(10px); /* Sirf form ke peeche blur */
    background: rgba(255, 255, 255, 0.3); /* Thoda transparent effect */
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease-in-out;
    width: 60%;
    margin: 50px auto;
    text-align: center;
    position: relative;
    z-index: 10;
    overflow: hidden;
}

/* Form Title Styling */
.contact-form h2 {
    margin-bottom: 20px;
}

/* Styling labels */
.contact-form label {
    font-weight: bold;
    display: block;
    text-align: left;
    margin-top: 10px;
    color: #333;
}

/* Styling input fields */
.contact-form input,
.contact-form textarea {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    transition: all 0.3s ease-in-out;
}

/* Placeholder Styling */
.contact-form input::placeholder,
.contact-form textarea::placeholder {
    color: #aaa;
}

/* Add focus effect */
.contact-form input,
.contact-form textarea {
    border-color: #ffb703;
    outline: none;
    box-shadow: 0px 0px 8px rgba(255, 183, 3, 0.5);
}

/* Styling the Submit button */
.contact-form button {
    background-color: #ffb703;
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    width: 100%;
    transition: all 0.3s ease-in-out;
}

/* Hover effect */
.contact-form button:hover {
    background-color: #ff9f00;
    transform: scale(1.05);
}

/* Responsive Design */
@media (max-width: 600px) {
    .contact-form {
        max-width: 90%;
    }
}
/* General Styling */
.response-time, .faq-section, .follow-us {
    background: #ffffff;
    border-radius: 10px;
    padding: 20px;
    margin: 20px 0;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Heading Styling */
.response-time h3, 
.faq-section h3, 
.follow-us h3 {
    color: #222;
    font-size: 22px;
    font-weight: bold;
    margin-bottom: 10px;
}

/* Response Time Text */
.response-time p {
    font-size: 16px;
    color: #555;
}

/* FAQ Section Styling */
.faq-section ul {
    list-style-type: none;
    padding: 0;
}

.faq-section ul li {
    background: #f9f9f9;
    padding: 12px;
    margin: 8px 0;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* Follow Us Section */
.follow-us a {
    display: flex;
    align-items: center;
    text-decoration: none;
    font-size: 16px;
    color: #0073b1;
    margin-right: 15px;
}

.follow-us img {
    width: 30px;
    height: 30px;
    margin-right: 8px;
    transition: transform 0.3s ease-in-out;
}

.follow-us img:hover {
    transform: scale(1.1);
}




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
    <center>
    <h1 id="welcome-message"></h1>
    </center>
    <div class="background-container">
    <div class="contact-form">
        <h2>Contact Us</h2>
        <form>
            <label for="name"><i class="fas fa-user"></i>  Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>
            
            <label for="email"><i class="fas fa-envelope"></i>  Email:</label>
            <input  type="email" id="email" name="email" placeholder="Enter your email" required>
    
            <label for="message"><i class="fas fa-comment"></i>  Message:</label>
            <textarea id="message" name="message" rows="4" placeholder="Type your message here..." required></textarea><br><br><br>
    
            <button type="submit">Submit</button>
        </form>
    </div>
    </div>

    <!-- Response Time -->
<div class="response-time">
    <h3>&#128197; Our Response Time</h3>
    <p>We usually respond within <strong>24 hours</strong>. If it's urgent, please mention it in your message.</p>
</div>

<!-- FAQs Section -->
<div class="faq-section">
    <h3>&#10067; Frequently Asked Questions</h3>
    <ul>
        <li><strong>How long will it take to get a response?</strong> - Usually within 24 hours.</li><br>
        <li><strong>Do you offer mental health consultations?</strong> - Currently, we provide self-assessment tools, but consultations will be available soon!</li>
        <li><strong>Can I track my past assessment history?</strong> - Yes! You can view your past assessment results in your profile section to track changes over time.</li>
        <li><strong>How can I suggest improvements or report issues on the website?</strong> - We welcome feedback! You can send your suggestions or report technical issues via our Contact Form.</li>
        <li><strong>Is this website free to use?</strong> - Yes, our mental health assessments and resources are free to access. In the future, we may introduce premium features like consultations with mental health professionals.</li>
    </ul>
</div>

<!-- Follow Us -->
<div class="follow-us">
    <h3>&#128242; Follow Us</h3>
    <p>Stay updated with our latest resources:</p>
    <a href="#"><img src="instagram-icon.png" alt="Instagram"> Instagram</a>
    <a href="#"><img src="linkedin-icon.png" alt="LinkedIn"> LinkedIn</a>
</div>
    <script>
        const messages = ["Welcome! Need Help?", "Reach Out to Us Anytime!", "We're Here to Listen"];
let index = 0;
function typeMessage() {
    let text = messages[index];
    let i = 0;
    let speed = 100;
    document.getElementById("welcome-message").innerHTML = "";
    function typeWriter() {
        if (i < text.length) {
            document.getElementById("welcome-message").innerHTML += text.charAt(i);
            i++;
            setTimeout(typeWriter, speed);
        }
    }
    typeWriter();
    index = (index + 1) % messages.length;
}
setInterval(typeMessage, 4000);
typeMessage();
</script>
    
    <%
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        
        if (name != null && email != null && message != null) {
            try {
                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                String url = "jdbc:mysql://localhost:3306/mental_2025";
                Connection con = DriverManager.getConnection(url, "root", "123abc");
                String query = "INSERT INTO contact_queries (name, email, message) VALUES (?, ?, ?)";
                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, name);
                pst.setString(2, email);
                pst.setString(3, message);
                pst.executeUpdate();
                out.println("<p>Thank you! Your message has been received.</p>");
                con.close();
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        }
    %>
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