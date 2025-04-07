<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    // Use the implicit session object directly
    String userFname = (String) session.getAttribute("fname");
%>
<html>
<head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
	<meta charset="UTF-8">
		<title>Mental Health website</title>
		<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
		<style>
			.navbar1{height: 70px; padding-top: 20px; display: flex; justify-content: end; align-items: center; font-family: "open Sans", sans-serif; padding-right: 15px; padding-left: 15px; border-bottom: solid 3px #F4BB44;}
			.navbar1 a{position: relative; font-size: 18px; color: black; text-decoration: none; margin-right: 40px; font-weight: bold;}
			.logo img{height: 55px; width: 55px; justify-content: start; margin-left: -530px; top: -10px;}
			.logo a{color: black; font-size: 35px; font-weight: 600; font-weight: bold; margin-left: -18px; top: -10px; }
			li{List-style: none; display: inline-block;}
			li a{color: black; font-size: 20px; font-weight: bold; text-decoration: none;}
			li a:hover{text-decoration: underline solid 2px; }
            .logo{font-size: 80px; }
            .box{width: 40%; height: auto; border-radius: 10px; border: solid 2px #F4BB44; }
            .label1{width: 85%; height: auto; border-radius: 10px; border: solid 2px #000000; font-size: 30px; font-weight: 300;}
            .label2{width: 85%; height: auto; border-radius: 10px; border: solid 2px #000000; font-size: 30px; font-weight: 300;}
            .label3{width: 85%; height: auto; border-radius: 10px; border: solid 2px #000000; font-size: 30px; font-weight: 300;}
            .btn{width: 30%; height: 8%; background: #FFFFFF; border-radius: 40px; cursor: pointer; font-size: 32px; font-weight: 300; font-weight: bold;}
            .btn:hover{background-color: #F4BB44;}
            .box1 { width: 50%; border-radius: 10px; border: solid 2px #F4BB44; padding: 20px; }
        .table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        .table th, .table td { border: 1px solid black; padding: 10px; text-align: center; }
        .table th { background-color: #F4BB44; }
        .footer{background-color: #F4BB44; padding: 70px 0; }
			.footer .container{max-width: 1170px; margin: auto;}
			.row{display: flex;}
			ul{list-style: none;}
			.footer-col{width: 25%; padding: 0 15px;}
			.footer-col h5{font-size: 25px; font-weight: 500; color: black; margin-left: 50px; text-transform: capitalize; margin-bottom: 30px; position: relative; margin-top: -20px;}
			.footer-col h5 img{height: 55px; width: 55px;margin-top: -30px;}
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
    <center>
            <div class="logo">
                <i class="fa-duotone fa-solid fa-user"></i>
            </div><br>

            <%
                String url = "jdbc:mysql://localhost:3306/mental_2025";

            
                Connection con = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                // User information variables
                String firstName = "";
                String lastName = "";
                String email = "";

            try
            {
                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                con = DriverManager.getConnection(url, "root", "123abc");

                String sql = "select fname, lname, email from user where fname = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, userFname);

                rs = pstmt.executeQuery();
                if(rs.next())
                {
                    firstName = rs.getString("fname");
                    lastName = rs.getString("lname");
                    email = rs.getString("email");

            %>
            <%
				if(request.getParameter("btn")!=null)
				{
					response.sendRedirect("index.jsp");
				}
			%>
            <div class="box">
                <br>
                <div class="label1">
                    <label for="fname">First Name:  <%=firstName%></label><br>
                </div>
                <br>
                <div class="label2">
                    <label for="Lname">Last Name:  <%=lastName%></label><br>
                </div>
                <br>
                <div class="label3">
                    <label for="Email">Email:  <%=email%></label>
                </div>
                <br>
				<a href="index.jsp"><button type="submit" class="btn" name="btn"><i class='bx bxs-log-out-circle'>Logout</i></button></a><br><br>
            </div><br><br>
            <%
                } 
                con.close();
            }
            catch(SQLException e)
            {
                out.println("issue" + e);
            }
            %>
            
    
            <%
            try {
                con = DriverManager.getConnection(url, "root", "123abc");
                String historyQuery = "SELECT assessment_name, score, date_time FROM result WHERE fname = ?";
                pstmt = con.prepareStatement(historyQuery);
                pstmt.setString(1, userFname);
                rs = pstmt.executeQuery();
        
                boolean hasRecords = false;
        %>
                <div class="box1">
                    <h3>Your Assessment History</h3>
                    <table class="table">
                        <tr>
                            <th>Assessment Name</th>
                            <th>Score</th>
                            <th>Date & Time</th>
                        </tr>
        <%
                while (rs.next()) {
                    String assessmentName = rs.getString("assessment_name");
                    int score = rs.getInt("score");
                    Timestamp dateTime = rs.getTimestamp("date_time");
        
                    // Skip if assessmentName is null or empty
                    if (assessmentName == null || assessmentName.trim().isEmpty()) {
                        continue;
                    }
        %>
                        <tr>
                            <td><%= assessmentName %></td>
                            <td><%= score %> %</td>
                            <td><%= dateTime %></td>
                        </tr>
        <%
                    hasRecords = true;
                }
        
                if (!hasRecords) {
        %>
                        <tr>
                            <td colspan="3">You have not taken any assessments yet.</td>
                        </tr>
        <%
                }
        %>
                    </table>
                </div>
        <%
                con.close();
            } catch (SQLException e) {
                out.println("Database Error: " + e.getMessage());
            }
        %>
    
            </table><br><br>
        </center>
        <br><br><footer class="footer">
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
