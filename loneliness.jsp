<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Use the implicit session object directly
    String userFname = (String) session.getAttribute("fname");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mental Health website</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        .navbar1 { height: 50px; padding-top: 20px; display: flex; justify-content: end; align-items: center; font-family: "open Sans", sans-serif; padding-right: 15px; padding-left: 15px; border-bottom: solid 3px #F4BB44; }
        .navbar1 a { position: relative; font-size: 18px; color: black; text-decoration: none; margin-right: 40px; font-weight: bold; }
        .logo img { height: 55px; width: 55px; justify-content: start; margin-left: -600px; top: -10px; }
        .logo a { color: black; font-size: 35px; font-weight: 600; font-weight: bold; top: -10px; }
        li { List-style: none; display: inline-block; }
        li a { color: black; font-size: 20px; font-weight: bold; text-decoration: none; }
        li a:hover { text-decoration: underline solid 2px; }
        .icon i{font-size: 80px; margin-left: 550px;  }
        .quiz-section { width: 50%; border-radius: 10px; border: solid 2px #F4BB44; margin-left: 300px; margin-top: 40px;}
        .quiz-section h2{margin-left: 50px; font-size: 30px;}
        .quiz-section li { font-size: 25px; }
        .btn { text-align: center; display: inline-block; margin-left: 220px; }
        button { background-color: #f1b64d; color: #000; font-size: 16px; width: 150px; height: 35px; display: inline-block; cursor: pointer; border-radius: 10px;}
        button:hover{background-color: gold;}
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
        document.addEventListener("DOMContentLoaded", function () {
            const quizData = [
                {
                    question: "How often do you feel that you lack companionship?",
                    options: [
                        "Never",
                        "Rarely",
                        "Sometimes",
                        "Always",
                    ],
                },
                {
                    question: "How often do you feel that there is no one you can turn to?",
                    options: [
                        "Never",
                        "Rarely",
                        "Sometimes",
                        "Always",
                    ],
                },
                {
                    question: "How often do you feel alone?",
                    options: [
                        "Never",
                        "Rarely",
                        "Sometimes",
                        "Always",
                    ],
                },
                {
                    question: "How often do you feel part of a group of friends?",
                    options: [
                        "Never",
                        "Rarely",
                        "Sometimes",
                        "Always",
                    ],
                },
                {
                    question: "How often do you feel that you have a lot in common with the people around you?",
                    options: [
                        "Never",
                        "Rarely",
                        "Sometimes",
                        "Always",
                    ],
                },
            ];
    
            let currentQuiz = 0;
            let score = 0;
    
            const questionElm = document.getElementById("question");
            const option_1 = document.getElementById("option_1");
            const option_2 = document.getElementById("option_2");
            const option_3 = document.getElementById("option_3");
            const option_4 = document.getElementById("option_4");
            const submitBtn = document.getElementById("submit");
            const answerElm = document.querySelectorAll(".answer");
    
            const loadQuiz = () => {
                const currentData = quizData[currentQuiz];  
                
                questionElm.innerText = currentData.question;  
                document.getElementById("option_1_label").innerText = currentData.options[0];
                document.getElementById("option_2_label").innerText = currentData.options[1];
                document.getElementById("option_3_label").innerText = currentData.options[2];
                document.getElementById("option_4_label").innerText = currentData.options[3];
            };
    
            loadQuiz();
    
            const getSelectedOption = () => {
                let answerElement = Array.from(answerElm);
                return answerElement.findIndex((curElem) => curElem.checked);
            };
    
            const deselectedAnswers = () => {
                answerElm.forEach((curElem) => {
                    curElem.checked = false;
                });
            };
    
            const calculateScore = (answers) => {
                for (let i = 0; i < answers.length; i++) {
                    if (answers[i] === 'Always') {
                        score += 20; // Example: gives 20 points for this answer
                    } else if (answers[i] === 'Sometimes') {
                        score += 15; // Example: gives 10 points for this answer
                    } else if (answers[i] === 'Rarely') {
                        score += 10; // Example: gives 5 points for this answer
                    } // Adjust scoring for other answers if needed
                }
                // Save the score to localStorage
                localStorage.setItem('quizScore', score);
            };
    
            submitBtn.addEventListener("click", () => {
                const selectedOptionIndex = getSelectedOption();
    
                // Check if an option was selected
                if (selectedOptionIndex !== -1) {
                    // Get the selected answer
                    const selectedAnswer = quizData[currentQuiz].options[selectedOptionIndex];
    
                    // Calculate the score based on the selected answer
                    score += selectedAnswer === 'Always' ? 20 : selectedAnswer === 'Sometimes' ? 15 : selectedAnswer === 'Rarely' ? 10 : 0;
    
                    currentQuiz++;
    
                    if (currentQuiz < quizData.length) {
                        deselectedAnswers();
                        loadQuiz();
                    } else {
                        alert("Quiz completed! Thank you for participating.");
                        const maxScore = quizData.length * 20; // Adjust if the max score changes
                        const percentage = (score / maxScore) * 100; // Calculate percentage
                        localStorage.setItem('quizScore', percentage.toFixed(2)); // Save percentage to localStorage
                        window.location.href = `lresult.jsp?score=${percentage}`; // Redirect to result page with score
                    }
                } else {
                    alert("Please select an answer before submitting.");
                }
            });
        });
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
            <li><a href="#">Help Yourself</a></li>
            <li><a href="aboutus.jsp">About</a></li>
            <li><a href="contactus.jsp">Contact</a></li>
            <li>
                <% if (userFname != null) { %>
                    <i class='bx bxs-user-circle'></i><a href="profile.jsp"><%= userFname %></a>
                <% } %>
            </li>
        </ul>
    </nav><br><br>
    <div class="icon">
        <i class="fa-solid fa-circle-question"></i>
    </div>
    <div class="quiz-section">
        <div id="quiz">
            <h2 class="question" id="question">quiz question</h2>
            <hr/>
            <ul>
                <li>
                    <input type="radio" name="answer" id="option_1" class="answer">
                    <label for="option_1" id="option_1_label">Option 1</label>
                </li><br>
                <li>
                    <input type="radio" name="answer" id="option_2" class="answer">
                    <label for="option_2" id="option_2_label">Option 2</label>
                </li><br>
                <li>
                    <input type="radio" name="answer" id="option_3" class="answer">
                    <label for="option_3" id="option_3_label">Option 3</label>
                </li><br>
                <li>
                    <input type="radio" name="answer" id="option_4" class="answer">
                    <label for="option_4" id="option_4_label">Option 4</label>
                </li>
            </ul>
            <div class="btn">
                <button id="submit">Submit</button><br>
            </div><br>
        </div><br>
    </div><br><br>

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
