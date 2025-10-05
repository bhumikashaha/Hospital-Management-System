<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<%
    String message = "";
    String prescriptionDetails = "";
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String patientId = request.getParameter("PatientID");
        String prescriptionDate = request.getParameter("PrescriptionDate");
        String medicine = request.getParameter("Medicine");
        String dosage = request.getParameter("Dosage");

        // Check if all fields are filled
        if (patientId != null && !patientId.isEmpty() && prescriptionDate != null && !prescriptionDate.isEmpty() &&
            medicine != null && !medicine.isEmpty() && dosage != null && !dosage.isEmpty()) {
            try {
                // Connect to the database
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifecare", "root", "root");

                // Insert prescription data into the database
                String insertQuery = "INSERT INTO prescriptions (PatientID, PrescriptionDate, Medicine, Dosage) VALUES (?, ?, ?, ?)";
                PreparedStatement stmt = connection.prepareStatement(insertQuery);
                stmt.setString(1, patientId);
                stmt.setString(2, prescriptionDate);
                stmt.setString(3, medicine);
                stmt.setString(4, dosage);

                // Execute the query
                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    message = "Prescription successfully added!";
                    prescriptionDetails = "<p><strong>Prescription Date:</strong> " + prescriptionDate + "</p>" +
                                          "<p><strong>Medicine:</strong> " + medicine + "</p>" +
                                          "<p><strong>Dosage:</strong> " + dosage + "</p>";
                } else {
                    message = "Failed to add prescription. Please try again.";
                }

                // Close the connection
                connection.close();
            } catch (Exception e) {
                message = "An error occurred: " + e.getMessage();
                e.printStackTrace();
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
    <title>Add Prescription</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        .header {
            background-color: #4CAF50;
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

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .button {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }

        .button:hover {
            background-color: #45a049;
        }

        .message {
            font-size: 18px;
            color: #4CAF50;
            margin: 20px 0;
        }

        .back-button {
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
        }

        .back-button:hover {
            background-color: #e53935;
        }

        .print-button {
            background-color: #008CBA;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }

        .print-button:hover {
            background-color: #007bb5;
        }

        .button-container {
            margin-top: 20px;
        }

        /* Print style */
        @media print {
            .back-button, .print-button {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Add Prescription</h1>
    </div>

    <div class="container">
        <!-- Show message if prescription is added -->
        <div class="message">
            <%= message %>
        </div>

        <!-- Display prescription details if added successfully -->
        <div class="prescription-details">
            <h2>Prescription Details</h2>
            <%= prescriptionDetails %>
        </div>

        <!-- Buttons for Back Home or Print -->
        <div class="button-container">
            <form action="DoctorDashboard.jsp" method="GET" style="display: inline;">
                <button type="submit" class="back-button">Back Home</button>
            </form>

            <button onclick="window.print()" class="print-button">Print Prescription</button>
        </div>
    </div>
</body>
</html>
