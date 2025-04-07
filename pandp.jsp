<%
    // Use the implicit session object directly
    String userFname = (String) session.getAttribute("fname");
%>
<html>
<head>
    <title>Mental Health website</title>
    <style>
        .navbar1{height: 70px; padding-top: 20px; display: flex; justify-content: end; align-items: center; font-family: "open Sans", sans-serif; padding-right: 15px; padding-left: 15px; border-bottom: solid 3px #F4BB44;}
        .navbar1 a{position: relative; font-size: 18px; color: black; text-decoration: none; margin-right: 40px; font-weight: bold;}
        .logo img{height: 55px; width: 55px; justify-content: start; margin-left: -530px; top: -10px;}
        .logo a{color: black; font-size: 35px; font-weight: 600; font-weight: bold; margin-left: -10px; top: -10px; }
        li{List-style: none; display: inline-block;}
        li a{color: black; font-size: 20px; font-weight: bold; text-decoration: none;}
        li a:hover{text-decoration: underline solid 2px; }
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1, h2 {
            color: #333;
        }
        p {
            line-height: 1.6;
            color: #555;
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
			<li><a href="#">Help Yourself</a></li>
			<li><a href="aboutus.jsp">About</a></li>
			<li><a href="contactus.jsp">Contact</a></li>
            <li>
                <% if (userFname != null) { %>
                    <i class='bx bxs-user-circle'></i><a href="profile.jsp"><%= userFname %></a>
                <% } %>
            </li>
        </ul>
    </nav>
    <div class="container">
        <h1>Privacy Policy</h1>
        <h2>1. Introduction</h2>
        <p>Welcome to Mind Mate. Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your personal information when you use our mental health services and website.</p>
        
        <h2>2. Information We Collect</h2>
        <p>We may collect the following types of information:</p>
        <ul>
            <li>Personal Information (name, email, phone number, etc.) when you register or book a consultation.</li>
            <li>Medical Information related to your mental health concerns, provided voluntarily.</li>
            <li>Payment Information for processing transactions.</li>
            <li>Usage Data, including IP address, browser type, and browsing activity.</li>
        </ul>
        
        <h2>3. How We Use Your Information</h2>
        <p>Your information is used to:</p>
        <ul>
            <li>Provide and improve our mental health services.</li>
            <li>Process payments and schedule consultations.</li>
            <li>Communicate with you regarding your queries or services.</li>
            <li>Ensure the security and integrity of our website.</li>
        </ul>
        
        <h2>4. Data Protection and Security</h2>
        <p>We implement appropriate technical and organizational measures to safeguard your personal data against unauthorized access, loss, or misuse. However, no online platform is completely secure, and users should take precautions when sharing information.</p>
        
        <h2>5. Third-Party Sharing</h2>
        <p>We do not sell or rent your personal information. However, we may share data with trusted partners or service providers for purposes such as payment processing, analytics, and legal compliance.</p>
        
        <h2>6. Cookies and Tracking Technologies</h2>
        <p>We use cookies to enhance user experience, analyze website traffic, and personalize content. You can manage your cookie preferences in your browser settings.</p>
        
        <h2>7. Your Rights</h2>
        <p>You have the right to:</p>
        <ul>
            <li>Access, correct, or delete your personal data.</li>
            <li>Opt-out of marketing communications.</li>
            <li>Withdraw consent for data processing where applicable.</li>
        </ul>
        
        <h2>8. Changes to This Privacy Policy</h2>
        <p>We may update this policy periodically. Continued use of our services after any modifications signifies your acceptance of the updated terms.</p>
        
        <h2>9. Contact Us</h2>
        <p>For any privacy-related concerns or inquiries, please contact us at [Your Contact Information].</p>
    </div>
</body>
</html>
