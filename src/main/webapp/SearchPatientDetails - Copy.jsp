<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String patientId = request.getParameter("PatientID");
    String patientDetails = "";
    String appointmentDetails = "";
    String prescriptionDetails = "";

    if (patientId != null && !patientId.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifecare", "root", "W7301@jqir#");

            // Fetch patient details
            String patientQuery = "SELECT * FROM patient WHERE PatientID = ?";
            PreparedStatement patientStmt = connection.prepareStatement(patientQuery);
            patientStmt.setString(1, patientId);
            ResultSet patientRs = patientStmt.executeQuery();

            if (patientRs.next()) {
                patientDetails = "<p><strong>Patient ID:</strong> " + patientRs.getString("PatientID") + "</p>" +
                                 "<p><strong>Name:</strong> " + patientRs.getString("PName") + "</p>" +
                                 "<p><strong>Contact:</strong> " + patientRs.getString("PContactNo") + "</p>";
            } else {
                patientDetails = "<p>No patient found with the given ID.</p>";
            }

            // Fetch appointment details
            String appointmentQuery = "SELECT * FROM appointments WHERE PatientID = ?";
            PreparedStatement appointmentStmt = connection.prepareStatement(appointmentQuery);
            appointmentStmt.setString(1, patientId);
            ResultSet appointmentRs = appointmentStmt.executeQuery();

            while (appointmentRs.next()) {
                appointmentDetails += "<tr>" +
                                       "<td>" + appointmentRs.getString("AppointmentDate") + "</td>" +
                                       "<td>" + appointmentRs.getString("DoctorName") + "</td>" +
                                       "<td>" + appointmentRs.getString("Reason") + "</td>" +
                                       "</tr>";
            }

            // Fetch prescription details
            String prescriptionQuery = "SELECT * FROM prescriptions WHERE PatientID = ?";
            PreparedStatement prescriptionStmt = connection.prepareStatement(prescriptionQuery);
            prescriptionStmt.setString(1, patientId);
            ResultSet prescriptionRs = prescriptionStmt.executeQuery();

            while (prescriptionRs.next()) {
                prescriptionDetails += "<tr>" +
                                       "<td>" + prescriptionRs.getString("PrescriptionDate") + "</td>" +
                                       "<td>" + prescriptionRs.getString("Medicine") + "</td>" +
                                       "<td>" + prescriptionRs.getString("Dosage") + "</td>" +
                                       "</tr>";
            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Patient Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        .header {
            background-color: #23977c;
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #2f855a;
            color: white;
        }

        .back-button {
            margin-top: 20px;
            text-align: center;
        }

        .back-button a {
            display: inline-block;
            background-color: #2f855a;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            text-decoration: none;
            border-radius: 5px;
        }

        .back-button a:hover {
            background-color: #23977c;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Search Patient Details</h1>
    </div>
    <div class="container">
        <form action="SearchPatientDetails.jsp" method="get">
            <div class="form-group">
                <label for="PatientID">Enter Patient ID:</label>
                <input type="text" id="PatientID" name="PatientID" placeholder="Patient ID" required>
            </div>
            <button type="submit" class="button">Search</button>
        </form>

        <div>
            <h2>Patient Details</h2>
            <%= patientDetails %>
        </div>

        <div>
            <h2>Appointments</h2>
            <table>
                <tr>
                    <th>Appointment Date</th>
                    <th>Doctor Name</th>
                    <th>Reason</th>
                </tr>
                <%= appointmentDetails.isEmpty() ? "<tr><td colspan='3'>No appointments found.</td></tr>" : appointmentDetails %>
            </table>
        </div>

        <div>
            <h2>Prescriptions</h2>
            <table>
                <tr>
                    <th>Prescription Date</th>
                    <th>Medicine</th>
                    <th>Dosage</th>
                </tr>
                <%= prescriptionDetails.isEmpty() ? "<tr><td colspan='3'>No prescriptions found.</td></tr>" : prescriptionDetails %>
            </table>
        </div>

        <div class="back-button">
            <a href="DoctorDashboard.jsp">Back to Home</a>
        </div>
    </div>
</body>
</html>
