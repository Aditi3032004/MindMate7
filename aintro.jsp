<%@ page import="javax.servlet.http.HttpSession" %>
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
			.navbar1{height: 50px; padding-top: 20px; display: flex; justify-content: end; align-items: center; font-family: "open Sans", sans-serif; padding-right: 15px; padding-left: 15px; border-bottom: solid 3px #F4BB44;}
			.navbar1 a{position: relative; font-size: 18px; color: black; text-decoration: none; margin-right: 40px; font-weight: bold;}
			.logo img{height: 55px; width: 55px; justify-content: start; margin-left: -600px; top: -10px;}
			.logo a{color: black; font-size: 35px; font-weight: 600; font-weight: bold; top: -10px; }
			.navbar1 i{font-size: 25px; vertical-align: middle;}
            li{List-style: none; display: inline-block;}
			li a{color: black; font-size: 20px; font-weight: bold; text-decoration: none; }
			li a:hover{text-decoration: underline solid 2px; }
            .mental-health-section {display: flex; align-items: center; justify-content: space-between; background-color: #FFF4DC; padding: 20px;}
            .text-content {width: 50%; padding: 20px;}
            .text-content h1 {font-size: 36px; font-family: sans-serif; color: #073b3a;}
            .text-content p {font-size: 18px; color: #333; line-height: 1.6;}
            .video-content {width: 50%; position: relative;}
            .video-content img {width: 100%; border-radius: 10px; box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);}
            .play-button {position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); font-size: 50px; color: white; background: rgba(0, 0, 0, 0.5); padding: 20px; border-radius: 50%; cursor: pointer;}
            .container {display: flex; flex-wrap: wrap;  justify-content: center; gap: 20px; padding: 20px;}
            h2 {text-align: center; font-size: 40px; font-weight: bold; color: #F4BB44; margin-bottom: 30px; text-transform: uppercase; width: 100%; display: block;}
            .box {background-color: #EAD7A1; width: 200px; padding: 25px; border-radius: 10px; color: black; font-family: 'Poppins', sans-serif; box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.2); transition: transform 0.3s ease, box-shadow 0.3s ease;}
            .box:hover {
    transform: scale(1.05);
    box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.2);
}
            .box h3 {font-size: 25px; font-weight: bold; margin-bottom: 15px; margin-left: 20px;}
            .box ul {padding-left: 20px;}
            .box ul li { margin-bottom: 8px; font-size: 16px; text-align: left;}
            .cont {display: flex; width: 100%; height: 250px;}
            .left {width: 40%; background-color: #FFBF00; display: flex; align-items: center; justify-content: center; padding: 20px;}
            .left h4 {color: white; font-size: 36px; font-weight: bold;}
            .right {width: 60%; background-color: #FFF4DC; display: flex; align-items: center; padding: 20px;}
            .right p {color: #C75050; font-size: 18px; line-height: 1.5;}
            .help {background-color: #FFFDD0; color: white; width: 100%; margin: auto; text-align: left;}
            .help h2 {font-size: 36px; color: #073b3a; font-weight: bold; margin-top: 10px; text-transform: uppercase;}
            .help p {font-size: 18px; color: #073b3a; line-height: 1.6; text-align: left; margin-left: 5px;}
            .phase {display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px; background-color: #FFDB58; padding: 40px; border-radius: 10px;}
            .boxx { display: flex; align-items: center; gap: 15px; background: rgba(255, 255, 255, 0.2); padding: 15px; border-radius: 8px;}
            .icon img{ width: 50px; height: auto; transition: transform 0.3s ease-in-out;}
            .icon:hover img {
    transform: scale(1.1);
}
            .text {color: black;}
            .videos .video-items{width: 100%; position: relative; margin-top: 10px; margin: 0;  justify-content: flex-start;}
            .mental-health-heading {
    text-align: center; /* Center align */
    font-size: 30px; /* Size bada karein */
    font-weight: bold; /* Bold karein */
    color: #333; /* Dark grey color */
    margin-bottom: 30px; /* Thoda space de */
    font-family: "open Sans", sans-serif; /* Achha readable font */
    text-transform: capitalize; /* First letter capital */

}
            .videos {
                
                width: 100%; margin: auto;
                text-align: center;
    display: flex;
    justify-content: center;
    overflow-x: hidden;
    padding: 20px;
}
            .video-list {
                justify-content: flex-start;
    display: flex;
    gap: 20px;
    overflow-x: auto;
    scroll-behavior: smooth;
    scrollbar-width: thin; /* For Firefox */
    -ms-overflow-style: none; 
    padding-bottom: 10px;
    clear: both;
    margin-top: 20px;
}
.video-list::-webkit-scrollbar {
    display: none;
}
.video {
    max-width: 200px;
    position: relative;
    flex: 0 0 auto;
    text-align: center;
}
.video img {
    width: 200px; /* Adjust size */
    height: 200px; /* Adjust size */
    object-fit: cover;
    border-radius: 10px;
    border: 2px solid #ddd; /* Optional border */
}
.play {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 20px;
    color: white;
    background: rgba(0, 0, 0, 0.7);
    padding: 10px;
    border-radius: 100%;
    cursor: pointer;
}
            .video:hover .play {
    background: rgba(255, 0, 0, 0.7);
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
    </nav><br>
    <div class="mental-health-section">
        <div class="text-content">
            <h1>Mental Health Awareness For Anxiety</h1>
            <p>
                Anxiety is the body's natural response to stress, characterized by feelings of fear, worry, or unease. 
                It is a normal reaction to uncertain or challenging situations.
            </p>
            <p>
                However, when anxiety becomes excessive, persistent, or interferes with daily life, it may indicate an anxiety disorder. 
                Managing anxiety through relaxation techniques, mindfulness, and seeking professional help can improve mental well-being. 
            </p>
        </div>
        <div class="video-content">
            <a href="https://www.youtube.com/watch?v=XTgbQl73dos" target="_blank">
                <img src="anxietyintro.webp" alt="Mental Health Awareness Video">
                <div class="play-button">&#9654;</div>
            </a>
        </div>
    </div>
    <div class="container">
        <h2>Signs & Symptoms of Anxiety</h2>
            <div class="box">
                <h3>Cognitive</h3>
                <ul>
                    <li>Excessive worrying</li>
                    <li>Difficulty concentrating</li>
                    <li>Overthinking</li>
                    <li>Fear of worst-case scenarios</li>
                </ul>
            </div>
            <div class="box">
                <h3>Emotional</h3>
                <ul>
                    <li>Feeling nervous or tense</li>
                    <li>Restlessness</li>
                    <li>Sense of impending danger</li>
                    <li>Increased irritability</li>
                </ul>
            </div>
            <div class="box">
                <h3>Physical</h3>
                <ul>
                    <li>Increased heart rate</li>
                    <li>Rapid breathing</li>
                    <li>Muscle tension</li>
                    <li>Fatigue</li>
                </ul>
            </div>
            <div class="box">
                <h3>Behavioral</h3>
                <ul>
                    <li>Avoiding social situations</li>
                    <li>Compulsive behaviors</li>
                    <li>Procrastination</li>
                    <li>Changes in eating or sleeping patterns</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="cont">
        <div class="left">
            <h4>WHAT CAUSES ANXIETY?</h4>
        </div>
        <div class="right">
            <p>Anxiety can be triggered by multiple factors including excessive stress, unresolved trauma, genetic predisposition, lifestyle habits, and imbalances in brain chemistry. Environmental pressures such as work stress, financial difficulties, and social expectations can also contribute. Additionally, unhealthy coping mechanisms, poor sleep, and overuse of stimulants like caffeine can worsen anxiety levels.</p>
        </div>
    </div><br>
    <section class="help"><br>
        <h2>HOW CAN YOU HELP YOURSELF?</h2>
        <p>
            Recognizing anxiety is the first step. Managing anxiety involves practicing mindfulness, deep breathing, and relaxation techniques. 
            Engaging in physical activities, maintaining a balanced diet, and ensuring quality sleep can also help. Talking to trusted friends or 
            seeking professional guidance can provide support and relief. Remember, small consistent steps can lead to better mental well-being.
        </p>
    <div class="phase">
        <div class="boxx">
            <div class="icon"><img src="breathing.png" alt=""></div>
            <div class="text">
                <h3>Practice Deep Breathing</h3>
                <p>Slow, deep breaths help in calming your mind.</p>
            </div>
        </div>
    
        <div class="boxx">
            <div class="icon"><img src="notepad.png" alt=""></div>
            <div class="text">
                <h3>Write Down Your Thoughts</h3>
                <p>Journaling helps organize thoughts, identify stressors, and promote self-awareness.</p>
            </div>
        </div>

        <div class="boxx">
            <div class="icon"><img src="exercise.png" alt=""></div>
            <div class="text">
                <h3>Exercise Regularly</h3>
                <p>Engage in physical activity like walking, yoga, or stretching to release endorphins.</p>
            </div>
        </div>

        <div class="boxx">
            <div class="icon"><img src="sleeping-mask.png" alt=""></div>
            <div class="text">
                <h3>Maintain a Sleep Routine</h3>
                <p>Ensure 7-9 hours of quality sleep to help manage stress and anxiety.</p>
            </div>
        </div>

        <div class="boxx">
            <div class="icon"><img src="diet.png" alt=""></div>
            <div class="text">
                <h3>Eat a Balanced Diet</h3>
                <p>Nutrient-rich foods support brain health and help regulate mood.</p>
            </div>
        </div>

        <div class="boxx">
            <div class="icon"><img src="comfortable.png" alt=""></div>
            <div class="text">
                <h3>Create a Comfortable Environment</h3>
                <p>A peaceful and clutter-free space reduces stress and promotes relaxation.</p>
            </div>
        </div>
    </div>
    </section>
    <section class="videos">
        <div class="video-items">
        <h3 class="mental-health-heading">Anxiety is Tough, But So Are You - Find Support Here</h3>
            <div class="video-list">
                <div class="video">
                    <a href="https://youtu.be/wHZV7xvt49A?si=ml7JpdxxyScjqF2b" target="_blank">
                        <img src="anxiety1.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/3NmaZs6ZXTs?si=dMZUZF-0lsAdiFI0" target="_blank">
                        <img src="anxiety2.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/WGG7MGgptxE?si=x5xdEE3fnYwjWDpC" target="_blank">
                        <img src="anxiety3.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/PxjxY9VilCs?si=bNsyGUOMKnH57zqt" target="_blank">
                        <img src="anxiety4.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/mKW4ZFP8bGY?si=S-LxZ6HnwPjv9deH" target="_blank">
                        <img src="anxiety5.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/W4-hhWqi2rg?si=6aFhMV16_UxkkubX" target="_blank">
                        <img src="anxiety6.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/bsaOBWUqdCU?si=cBmV_RrnN_AQQ6kt" target="_blank">
                        <img src="anxiety7.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/xGb4fvfZpWM?si=hVEs2S6TLnG5XTPu" target="_blank">
                        <img src="anxiety8.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/lHVYgnlukTw?si=1fF-y6mmLN5l6Y1C" target="_blank">
                        <img src="anxiety9.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/-v34YfjfKUk?si=Zp6hxDPnd8jB2hj7" target="_blank">
                        <img src="anxiety10.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
            </div>
            </div>
    </section>
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