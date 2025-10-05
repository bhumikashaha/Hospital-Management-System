<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String message = "";

    if (request.getMethod().equalsIgnoreCase("POST")) {
        String patientId = request.getParameter("PatientID");
        String prescriptionDate = request.getParameter("PrescriptionDate");
        String medicine = request.getParameter("Medicine");
        String dosage = request.getParameter("Dosage");

        if (patientId != null && prescriptionDate != null && medicine != null && dosage != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifecare", "root", "root");

                String insertQuery = "INSERT INTO prescriptions (PatientID, PrescriptionDate, Medicine, Dosage) VALUES (?, ?, ?, ?)";
                PreparedStatement stmt = connection.prepareStatement(insertQuery);
                stmt.setString(1, patientId);
                stmt.setString(2, prescriptionDate);
                stmt.setString(3, medicine);
                stmt.setString(4, dosage);

                int rowsInserted = stmt.executeUpdate();

                if (rowsInserted > 0) {
                    message = "Prescription successfully added!";
                } else {
                    message = "Failed to add prescription. Please try again.";
                }

                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
                message = "An error occurred: " + e.getMessage();
            }
        } else {
            message = "All fields are required.";
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard - Add Prescription</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        .header {
            background-color: #2f855a;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 16px;
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .form-group input, .form-group textarea {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group textarea {
            resize: none;
        }

        .button {
            display: inline-block;
            background-color: #2f855a;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }

        .button:hover {
            background-color: #23977c;
        }

        .message {
            margin-top: 20px;
            font-size: 16px;
            font-weight: bold;
            color: #4CAF50;
        }

        .actions {
            margin-top: 20px;
            text-align: center;
        }

        .actions a {
            display: inline-block;
            background-color: #2f855a;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            text-decoration: none;
            border-radius: 5px;
            margin: 0 10px;
        }

        .actions a:hover {
            background-color: #23977c;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Doctor Dashboard - Add Prescription</h1>
    </div>
    <div class="container">
        <form action="PrecriptionAction.jsp" method="post">
            <div class="form-group">
                <label for="PatientID">Patient ID:</label>
                <input type="text" id="PatientID" name="PatientID" placeholder="Enter Patient ID" required>
            </div>
            <div class="form-group">
                <label for="PrescriptionDate">Prescription Date:</label>
                <input type="datetime-local" id="PrescriptionDate" name="PrescriptionDate" required>
            </div>
            <div class="form-group">
                <label for="Medicine">Medicine:</label>
                <textarea id="Medicine" name="Medicine" rows="3" placeholder="Enter medicine details" required></textarea>
            </div>
            <div class="form-group">
                <label for="Dosage">Dosage:</label>
                <textarea id="Dosage" name="Dosage" rows="2" placeholder="Enter dosage details" required></textarea>
            </div>
            <button type="submit" class="button">Add Prescription</button>
        </form>

        <% if (!message.isEmpty()) { %>
            <div class="message">
                <%= message %>
            </div>
        <% } %>

        <div class="actions">
            <a href="DoctorDashboard.jsp">Back to Home</a>
            <a href="#" onclick="window.print()">Print Prescription</a>
        </div>
    </div>
</body>
</html>
