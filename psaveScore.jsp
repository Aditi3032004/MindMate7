<%@ page import="java.sql.*" %>
<%
    String userFname = (String) session.getAttribute("fname");
    String assessment_name = request.getParameter("assessment");
    String score = request.getParameter("score");

    if (score == null || score.isEmpty()) {
        out.println("Error: Score is missing.");
        return; // Stop execution if score is missing
    }

    Connection con = null;
    PreparedStatement pst = null;

    try {
        double scoreValue = Double.parseDouble(score);
        String url = "jdbc:mysql://localhost:3306/mental_2025";
        con = DriverManager.getConnection(url, "root", "123abc");

        String sql = "INSERT INTO result (fname, assessment_name, score) VALUES (?, ?, ?)";
        pst = con.prepareStatement(sql);
        pst.setString(1, userFname);
        pst.setString(2, "Personality");
        pst.setDouble(3, scoreValue);

        int result = pst.executeUpdate();
        if (result > 0) {
            out.println("Score saved successfully!");
        } else {
            out.println("Failed to save score.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
