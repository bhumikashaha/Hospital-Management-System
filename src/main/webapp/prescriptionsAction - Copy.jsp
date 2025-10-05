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
    PreparedStatement addPrescriptionStmt = null;

    String prescriptionDate = request.getParameter("prescriptionDate");
    String medicine = request.getParameter("medicine");
    String dosage = request.getParameter("dosage");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifecare", "root", "W7301@jqir#");

        // Insert new prescription into the database
        if (prescriptionDate != null && medicine != null && dosage != null) {
            String insertPrescriptionQuery = "INSERT INTO prescriptions (PatientID, PrescriptionDate, Medicine, Dosage) VALUES (?, ?, ?, ?)";
            addPrescriptionStmt = connection.prepareStatement(insertPrescriptionQuery);
            addPrescriptionStmt.setString(1, PatientID);
            addPrescriptionStmt.setString(2, prescriptionDate);
            addPrescriptionStmt.setString(3, medicine);
            addPrescriptionStmt.setString(4, dosage);
            addPrescriptionStmt.executeUpdate();
        }

        // Redirect to patient dashboard after insertion
        response.sendRedirect("patientDashboard.jsp");

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (addPrescriptionStmt != null) addPrescriptionStmt.close();
            if (connection != null) connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
