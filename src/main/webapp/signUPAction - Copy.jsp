<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    // Initialize variables for error/success messages
    String errorMessage = null;
    String successMessage = null;

    // Retrieve form parameters
    String pid = request.getParameter("PatientID") != null ? request.getParameter("PatientID").trim() : "";
    String pname = request.getParameter("PName") != null ? request.getParameter("PName").trim() : "";
    String pcontactNo = request.getParameter("PContactNo") != null ? request.getParameter("PContactNo").trim() : "";

    if (pid.isEmpty() || pname.isEmpty() || pcontactNo.isEmpty()) {
        errorMessage = "All fields are required!";
    } else {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            String dbURL = "jdbc:mysql://localhost:3306/lifecare";
            String dbUser = "root";
            String dbPassword = "W7301@jqir#";
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifecare", "root", "W7301@jqir#");

            // Check if patient already exists
            String checkQuery = "SELECT * FROM patient WHERE PatientID = ?";
            preparedStatement = connection.prepareStatement(checkQuery);
            preparedStatement.setString(1, pid);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                errorMessage = "Patient ID already exists. Please use a different ID.";
            } else {
                // Insert new patient
                String insertQuery = "INSERT INTO patient (PatientID, PName, PContactNo) VALUES (?, ?, ?)";
                preparedStatement = connection.prepareStatement(insertQuery);
                preparedStatement.setString(1, pid);
                preparedStatement.setString(2, pname);
                preparedStatement.setString(3, pcontactNo);

                int rowsInserted = preparedStatement.executeUpdate();
                if (rowsInserted > 0) {
                    successMessage = "Signup successful! You can now log in.";
                } else {
                    errorMessage = "An error occurred while signing up. Please try again.";
                }
            }
            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
            errorMessage = "An error occurred. Please try again later.";
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
          background: linear-gradient(135deg, #a8e6cf, #ffffff);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .message-box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 400px;
            max-width: 90%;
        }
        .message-box h1 {
            margin-bottom: 15px;
            font-size: 24px;
        }
        .error {
            color: red;
        }
        .success {
            color: green;
        }
        a {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #6e8efb;
        }
    </style>
</head>
<body>
    <div class="message-box">
        <% if (errorMessage != null) { %>
            <h1 class="error"><%= errorMessage %></h1>
        <% } %>
        <% if (successMessage != null) { %>
            <h1 class="success"><%= successMessage %></h1>
        <% } %>
        <a href="patientLogin.jsp">Go Back to Signup</a>
    </div>
</body>
</html>
