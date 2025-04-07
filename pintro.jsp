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
            <h1>Mental Health Awareness For Personality</h1>
            <p>
                Personality refers to the unique patterns of thoughts, emotions, and behaviors that define an individual. 
                It influences how people perceive the world, interact with others, and handle different situations. A well-balanced 
                personality contributes to mental well-being, strong relationships, and overall life satisfaction.
            </p>
            <p>
                However, certain personality traits may contribute to stress, anxiety, or difficulties in social interactions. 
                Understanding one's personality can help in improving self-awareness, emotional regulation, and decision-making. Engaging 
                in self-reflection, seeking professional guidance, and practicing positive habits can support personality development and 
                enhance mental well-being over time. 
            </p>
        </div>
        <div class="video-content">
            <a href="https://www.youtube.com/watch?v=DxIDKZHW3-E" target="_blank">
                <img src="personality0.webp" alt="Mental Health Awareness Video">
                <div class="play-button">&#9654;</div>
            </a>
        </div>
    </div>
    <div class="container">
        <h2>Signs & Symptoms of Personality</h2>
            <div class="box">
                <h3>Cognitive</h3>
                <ul>
                    <li>Persistent self-doubt and overthinking</li>
                    <li>Rigid thinking patterns or difficulty adapting to change</li>
                    <li>Negative self-talk and low self-esteem</li>
                    <li>Trouble making decisions due to fear of failure</li>
                </ul>
            </div>
            <div class="box">
                <h3>Emotional</h3>
                <ul>
                    <li>Frequent mood swings or intense emotions</li>
                    <li>Sensitivity to criticism or rejection</li>
                    <li>Difficulty managing stress and anxiety</li>
                    <li>Feelings of loneliness or detachment from others</li>
                </ul>
            </div>
            <div class="box">
                <h3>Physical</h3>
                <ul>
                    <li>Sleep disturbances due to overthinking</li>
                    <li>Increased heart rate or tension in social situations</li>
                    <li>Fatigue from emotional exhaustion</li>
                    <li>Physical discomfort linked to stress (headaches, stomach issues)</li>
                </ul>
            </div>
            <div class="box">
                <h3>Behavioral</h3>
                <ul>
                    <li>Avoiding social interactions or responsibilities</li>
                    <li>Impulsivity or difficulty controlling emotions</li>
                    <li>Procrastination or perfectionism</li>
                    <li>Unhealthy coping mechanisms (e.g., isolation, emotional eating)</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="cont">
        <div class="left">
            <h4>WHAT CAUSES PERSONALITY?</h4>
        </div>
        <div class="right">
            <p>Personality-related mental health challenges can arise from various factors, including childhood experiences, genetic 
                predisposition, and environmental influences. Traits such as perfectionism, excessive self-criticism, or difficulty 
                expressing emotions can contribute to stress and anxiety. Unhealthy coping mechanisms, lack of emotional regulation, and 
                social isolation may worsen mental well-being. Additionally, external factors such as societal expectations, work pressure, 
                and relationship struggles can impact personality development and mental health. These challenges can lead to emotional distress, 
                difficulty maintaining relationships, and struggles with self-confidence and decision-making.</p>
        </div>
    </div><br>
    <section class="help"><br>
        <h2>HOW CAN YOU HELP YOURSELF?</h2>
        <p>
            Recognizing personality-related mental health challenges is the first step. Managing them involves self-awareness, identifying 
            negative thought patterns, and working on emotional regulation. Practicing mindfulness, self-reflection, and setting personal 
            growth goals can bring stability. Engaging in stress-relief activities like exercise, meditation, and quality sleep can also help. 
            Seeking support from trusted individuals, therapists, or self-help resources can provide guidance and encouragement. Remember, small 
            and consistent efforts toward self-improvement can lead to long-term emotional resilience and well-being.
        </p>
    <div class="phase">
        <div class="boxx">
            <div class="icon"><img src="plogo1.png" alt=""></div>
            <div class="text">
                <h3>Enhance Self-Awareness</h3>
                <p>Reflect on your thoughts, emotions, and behaviors to understand yourself better.</p>
            </div>
        </div>
    
        <div class="boxx">
            <div class="icon"><img src="plogo2.png" alt=""></div>
            <div class="text">
                <h3>Build Emotional Resilience</h3>
                <p>Practice positive thinking and develop coping strategies for handling stress and setbacks.</p>
            </div>
        </div>

        <div class="boxx">
            <div class="icon"><img src="plogo3.png" alt=""></div>
            <div class="text">
                <h3>Limit Negative Influences</h3>
                <p>Surround yourself with positive, supportive people and minimize toxic relationships.</p>
            </div>
        </div>

        <div class="boxx">
            <div class="icon"><img src="plogo4.png" alt=""></div>
            <div class="text">
                <h3>Seek Professional Guidance</h3>
                <p>Talk to a therapist, mentor, or coach to gain insights into personal growth and self-improvement.</p>
            </div>
        </div>

        <div class="boxx">
            <div class="icon"><img src="plogo5.png" alt=""></div>
            <div class="text">
                <h3>Develop New Skills</h3>
                <p>Engage in learning activities, hobbies, and experiences that boost confidence and adaptability.</p>
            </div>
        </div>

        <div class="boxx">
            <div class="icon"><img src="plogo6.png" alt=""></div>
            <div class="text">
                <h3>Practice Mindfulness & Relaxation</h3>
                <p>Meditation, deep breathing, and journaling can help maintain emotional balance and reduce stress.</p>
            </div>
        </div>
    </div>
    </section>
    <section class="videos">
        <div class="video-items">
        <h3 class="mental-health-heading">Personality is Tough, But So Are You - Find Support Here</h3>
            <div class="video-list">
                <div class="video">
                    <a href="https://youtu.be/4E1JiDFxFGk?si=AWze9CjQkxtrhfb1" target="_blank">
                        <img src="personality1.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/1jv8wHDoliA?si=nQGZEBIOphvOKsoB" target="_blank">
                        <img src="personality9.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/U6Y9WTyPgG0?si=DOOGoy1hDgr98yTE" target="_blank">
                        <img src="personality4.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/-Xv593jgyJ4?si=mCEyWNS0JSQgZi51" target="_blank">
                        <img src="personality8.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/lI-Va0-YETs?si=w_P41aQaxqiOmq-i" target="_blank">
                        <img src="personality5.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/vZqU-3KraiQ?si=Yslxy9pU3ESyTJ1r" target="_blank">
                        <img src="personality6.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/4ZjCr_xlIGg?si=Z4yl3xfoacFXaopu" target="_blank">
                        <img src="personality7.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/fZfHkTlAjnA?si=4TwFHCd7JyM4otYc" target="_blank">
                        <img src="personality3.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/ghtSaOSBSrQ?si=v9FSSyj3Th1bw97P" target="_blank">
                        <img src="personality2.webp" alt="">
                        <div class="play">&#9654;</div>
                    </a>
                </div>
                <div class="video">
                    <a href="https://youtu.be/F8R04ihAFsU?si=t5f8ssP0mbBlS11j" target="_blank">
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