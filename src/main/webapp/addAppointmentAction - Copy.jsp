<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Simulate session data (replace with actual session management)
    String PatientID = (String) session.getAttribute("PatientID");

    if (PatientID == null) {
        response.sendRedirect("patientLogin.jsp"); // Redirect if not logged in
        return;
    }

    // Database setup
    Connection connection = null;
    PreparedStatement addAppointmentStmt = null;

    String appointmentDate = request.getParameter("appointmentDate");
    String doctorName = request.getParameter("doctorName");
    String reason = request.getParameter("reason");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifecare", "root", "W7301@jqir#");

        // Insert new appointment into the database
        if (appointmentDate != null && doctorName != null && reason != null) {
            String insertAppointmentQuery = "INSERT INTO appointments (PatientID, AppointmentDate, DoctorName, Reason) VALUES (?, ?, ?, ?)";
            addAppointmentStmt = connection.prepareStatement(insertAppointmentQuery);
            addAppointmentStmt.setString(1, PatientID);
            addAppointmentStmt.setString(2, appointmentDate);
            addAppointmentStmt.setString(3, doctorName);
            addAppointmentStmt.setString(4, reason);
            addAppointmentStmt.executeUpdate();
        }

        // Redirect to patient dashboard after insertion
        response.sendRedirect("patientDashboard.jsp");

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (addAppointmentStmt != null) addAppointmentStmt.close();
            if (connection != null) connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
