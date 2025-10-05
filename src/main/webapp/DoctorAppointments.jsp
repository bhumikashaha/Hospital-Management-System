<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upcoming Appointments</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0fff0; /* Light green background */
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #2d7f2d; /* Dark green */
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 128, 0, 0.2);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #2d7f2d; /* Dark green */
            color: white;
        }
        tr:nth-child(even) {
            background-color: #e6ffe6; /* Light green for alternate rows */
        }
        tr:hover {
            background-color: #ccffcc; /* Lighter green on hover */
        }
        .error {
            color: red;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>

<h2>Upcoming Appointments</h2>

<%
    String url = "jdbc:mysql://localhost:3306/lifecare";
    String user = "root";
    String password = "root"; // 🔹 Replace with your actual password
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        stmt = conn.createStatement();

        String query = "SELECT AppointmentID, PatientID, AppointmentDate, DoctorName, Reason " +
                       "FROM appointments WHERE AppointmentDate >= CURDATE() " +
                       "ORDER BY AppointmentDate ASC";
        rs = stmt.executeQuery(query);
%>

<table>
    <tr>
        <th>Appointment ID</th>
        <th>Patient ID</th>
        <th>Appointment Date</th>
        <th>Doctor Name</th>
        <th>Reason</th>
    </tr>

<%
        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("AppointmentID") %></td>
        <td><%= rs.getInt("PatientID") %></td>
        <td><%= rs.getDate("AppointmentDate") %></td>
        <td><%= rs.getString("DoctorName") %></td>
        <td><%= rs.getString("Reason") %></td>
    </tr>
<%
        }
%>
</table>

<%
    } catch (Exception e) {
%>
    <p class="error">Error: <%= e.getMessage() %></p>
<%
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>

</body>
</html>
