<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Simulate session data (replace with actual session management)
    String PatientID = (String) session.getAttribute("PatientID");
    String PatientName = (String) session.getAttribute("PatientName");

    if (PatientID == null || PatientName == null) {
        response.sendRedirect("patientLogin.jsp"); // Redirect to login if not logged in
        return;
    }

    // Database setup
    Connection connection = null;
    PreparedStatement appointmentStmt = null, prescriptionStmt = null, addAppointmentStmt = null, addPrescriptionStmt = null;
    ResultSet appointmentRs = null, prescriptionRs = null;

    String appointmentData = "", prescriptionData = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifecare", "root", "W7301@jqir#");

        // Handle form submission to add appointment
        String appointmentDate = request.getParameter("appointmentDate");
        String doctorName = request.getParameter("doctorName");
        String reason = request.getParameter("reason");

        if (appointmentDate != null && doctorName != null && reason != null) {
            String insertAppointmentQuery = "INSERT INTO appointments (PatientID, AppointmentDate, DoctorName, Reason) VALUES (?, ?, ?, ?)";
            addAppointmentStmt = connection.prepareStatement(insertAppointmentQuery);
            addAppointmentStmt.setString(1, PatientID);
            addAppointmentStmt.setString(2, appointmentDate);
            addAppointmentStmt.setString(3, doctorName);
            addAppointmentStmt.setString(4, reason);
            addAppointmentStmt.executeUpdate();
            response.sendRedirect("patientDashboard.jsp");  // Reload page after submitting
            return; // Prevent further code execution after redirect
        }

        // Handle form submission to add prescription
        String prescriptionDate = request.getParameter("prescriptionDate");
        String medicine = request.getParameter("medicine");
        String dosage = request.getParameter("dosage");

        if (prescriptionDate != null && medicine != null && dosage != null) {
            String insertPrescriptionQuery = "INSERT INTO prescriptions (PatientID, prescriptionDate, Medicine, Dosage) VALUES (?, ?, ?, ?)";
            addPrescriptionStmt = connection.prepareStatement(insertPrescriptionQuery);
            addPrescriptionStmt.setString(1, PatientID);
            addPrescriptionStmt.setString(2, prescriptionDate);
            addPrescriptionStmt.setString(3, medicine);
            addPrescriptionStmt.setString(4, dosage);
            addPrescriptionStmt.executeUpdate();
            response.sendRedirect("patientDashboard.jsp");  // Reload page after submitting
            return; // Prevent further code execution after redirect
        }

        // Fetch all appointments
        String appointmentQuery = "SELECT * FROM appointments WHERE PatientID = ? ORDER BY AppointmentDate DESC";
        appointmentStmt = connection.prepareStatement(appointmentQuery);
        appointmentStmt.setString(1, PatientID);
        appointmentRs = appointmentStmt.executeQuery();
        while (appointmentRs.next()) {
            appointmentData += "<tr><td>" + appointmentRs.getString("AppointmentDate") + "</td>"
                    + "<td>" + appointmentRs.getString("DoctorName") + "</td>"
                    + "<td>" + appointmentRs.getString("Reason") + "</td></tr>";
        }

        // Fetch prescription history
        String prescriptionQuery = "SELECT * FROM prescriptions WHERE PatientID = ? ORDER BY PrescriptionDate DESC";
        prescriptionStmt = connection.prepareStatement(prescriptionQuery);
        prescriptionStmt.setString(1, PatientID);
        prescriptionRs = prescriptionStmt.executeQuery();
        while (prescriptionRs.next()) {
            prescriptionData += "<tr><td>" + prescriptionRs.getString("PrescriptionDate") + "</td>"
                    + "<td>" + prescriptionRs.getString("Medicine") + "</td>"
                    + "<td>" + prescriptionRs.getString("Dosage") + "</td></tr>";
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (appointmentRs != null) appointmentRs.close();
            if (prescriptionRs != null) prescriptionRs.close();
            if (appointmentStmt != null) appointmentStmt.close();
            if (prescriptionStmt != null) prescriptionStmt.close();
            if (addAppointmentStmt != null) addAppointmentStmt.close();
            if (addPrescriptionStmt != null) addPrescriptionStmt.close();
            if (connection != null) connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard</title>
    <style>
        /* Same styles as before */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #2f855a;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .container {
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 10px 0;
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
        .form-container {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #fff;
        }
        .form-container input, .form-container button {
            padding: 10px;
            margin: 5px 0;
            width: 99%;
        }
        .form-container button {
            background-color: #2f855a;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }
        .form-container button:hover {
            background-color: #23977c;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome, <%= PatientName %></h1>
        <a href="index1.jsp" style="color: white; text-decoration: none;">Logout</a>
    </div>
    <div class="container">
        <!-- Appointments Section -->
        <div>
            <h2>Your Appointments</h2>
            <table>
                <tr>
                    <th>Date</th>
                    <th>Doctor</th>
                    <th>Reason</th>
                </tr>
                <%= appointmentData.isEmpty() ? "<tr><td colspan='3'>No appointments found.</td></tr>" : appointmentData %>
            </table>
        </div>

        <!-- Add Appointment Form -->
        <div class="form-container">
            <h2>Add New Appointment</h2>
            <form action="patientDashboard.jsp" method="post">
                <input type="datetime-local" name="appointmentDate" required placeholder="Appointment Date">
                <input type="text" name="doctorName" required placeholder="Doctor Name">
                <input type="text" name="reason" required placeholder="Reason">
                <button type="submit">Add Appointment</button>
            </form>
        </div>

        <!-- Prescriptions Section -->
        <div>
            <h2>Your Prescription History</h2>
            <table>
                <tr>
                    <th>Date</th>
                    <th>Medicine</th>
                    <th>Dosage</th>
                </tr>
                <%= prescriptionData.isEmpty() ? "<tr><td colspan='3'>No prescriptions found.</td></tr>" : prescriptionData %>
            </table>
        </div>

        <!-- Add Prescription Form -->
        <div class="form-container">
            <h2>Add New Prescription</h2>
            <form action="patientDashboard.jsp" method="post">
                <input type="datetime-local" name="prescriptionDate" required placeholder="Prescription Date">
                <input type="text" name="medicine" required placeholder="Medicine Name">
                <input type="text" name="dosage" required placeholder="Dosage">
                <button type="submit">Add Prescription</button>
            </form>
        </div>
    </div>
</body>
</html>
