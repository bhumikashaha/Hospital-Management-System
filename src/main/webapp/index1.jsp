<!--it is a staff dashboard-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String email = (String) session.getAttribute("username");
String userType = (String) session.getAttribute("userType");
String username = "";
String userId = "";
if (email == null) {
    response.sendRedirect("index.html");
}

    boolean userFound = false;

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifecare", "root", "root");

        // Query to fetch user details
        String query = "SELECT id, username FROM "+ userType +" WHERE password = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            userId = rs.getString("id");
            username = rs.getString("username");
            email = rs.getString("password");

            userFound = true;
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Mananagment Project</title>

    <!-- font awesome cdn link  -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>

<!-- header section starts  -->

<header class="header">

    <a href="#" class="logo"> <i class="fas fa-heartbeat"></i> <strong>LifeCare</strong></a>

    <nav class="navbar">
        <a href="index.jsp">home</a>
        <a href="services.jsp">services</a>
        <a href="doctor.jsp">doctors</a>
        <a href="DocPatPortal.jsp"> Login Portal</a>
        <a href="review.jsp">review</a>
        <a href="blog.jsp">blog</a>

    </nav>

    <div id="menu-btn" class="fas fa-bars"></div>

</header>

<!-- header section ends -->

<!-- home section starts  -->

<section class="home" id="home">

    <div class="image">
        <img src="https://raw.githubusercontent.com/wincodersujon/Hospital-website/c6c954ab074b68cf2b37490b556a2f6d33e23ea7/hospital/image/home-img.svg" alt="">
    </div>

    <div class="content">
        <h3>we take care of your healthy life</h3>
        <p> A person who has good physical health is likely to have bodily functions and processes working at their peak.</p>
    </div>

</section>

<!-- home section ends -->

<!-- icons section starts  -->

<section class="icons-container">

    <div class="icons">
        <i class="fas fa-user-md"></i>
        <h3>100+</h3>
        <p>doctors at work</p>
    </div>

    <div class="icons">
        <i class="fas fa-users"></i>
        <h3>1030+</h3>
        <p>satisfied patients</p>
    </div>

    <div class="icons">
        <i class="fas fa-procedures"></i>
        <h3>490+</h3>
        <p>bed facility</p>
    </div>

    <div class="icons">
        <i class="fas fa-hospital"></i>
        <h3>70+</h3>
        <p>available hospitals</p>
    </div>

</section>

<!-- icons section ends -->

<!-- footer section starts  -->

<section class="footer">

    <div class="box-container">

        <div class="box">
            <h3>quick links</h3>
            <a href="index.jsp"> <i class="fas fa-chevron-right"></i> home </a>
            <a href="services.jsp"> <i class="fas fa-chevron-right"></i> Services </a>
            <a href="doctor.jsp"> <i class="fas fa-chevron-right"></i> doctors </a>
            <a href="DocPatPortal.jsp"> <i class="fas fa-chevron-right"></i> Login Portal</a>
            <a href="review.jsp"> <i class="fas fa-chevron-right"></i> review </a>
            <a href="blog.jsp"> <i class="fas fa-chevron-right"></i> blog </a>

        </div>

        <div class="box">
            <h3>our services</h3>
            <a href="services.jsp"> <i class="fas fa-chevron-right"></i> 24/7 Ambulance </a>
            <a href="services.jsp"> <i class="fas fa-chevron-right"></i> Emergency Rooms </a>
            <a href="services.jsp"> <i class="fas fa-chevron-right"></i> Free Check-Ups </a>
        </div>

        <div class="box">
            <h3>appointment info</h3>
            <a href="#"> <i class="fas fa-phone"></i> +917385301082</a>
            <a href="#"> <i class="fas fa-phone"></i> +918080789133</a>
            <a href="#"> <i class="fas fa-envelope"></i> lifecare@gmail.com </a>
            <a href="#"> <i class="fas fa-map-marker-alt"></i> Maharashtra, India </a>
        </div>

        <div class="box">
            <h3>follow us</h3>
            <a href="#"> <i class="fab fa-faceappointment-f"></i> faceappointment </a>
            <a href="#"> <i class="fab fa-facebook-f"></i> Facebook </a>
            <a href="#"> <i class="fab fa-twitter"></i> twitter </a>
            <a href="#"> <i class="fab fa-instagram"></i> instagram </a>
            <a href="#"> <i class="fab fa-linkedin"></i> linkedin </a>
            <a href="#"> <i class="fab fa-pinterest"></i> pinterest </a>
        </div>

    </div>

    <div class="credit"> Copyright &copy; <span>2025</span> LifeCare | All Rights Reserved </div>

</section>

<!-- footer section ends -->

<!-- jquery cdn link -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<!-- js file link  -->
<script src="main.js"></script>

</body>
</html>
