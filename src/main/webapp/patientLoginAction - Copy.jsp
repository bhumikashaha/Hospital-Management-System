<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    // Retrieve parameters
    String pid = request.getParameter("PatientID") != null ? request.getParameter("PatientID").trim() : "";
    String pname = request.getParameter("PName") != null ? request.getParameter("PName").trim() : "";
    String pcontactNo = request.getParameter("PContactNo") != null ? request.getParameter("PContactNo").trim() : "";

    if (pid.isEmpty() || pname.isEmpty() || pcontactNo.isEmpty()) {
        out.println("<script type='text/javascript'>");
        out.println("alert('All fields are required. Please fill out the form.');");
        out.println("location='patientLogin.jsp';");
        out.println("</script>");
    } else {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            String dbURL = "jdbc:mysql://localhost:3306/lifecare";
            String dbUser = "root";
            String dbPassword = "W7301@jqir#";
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifecare", "root","W7301@jqir#");

            // Prepare SQL query
            String sql = "SELECT * FROM patient WHERE PatientID = ? AND PName = ? AND PContactNo = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, pid);
            preparedStatement.setString(2, pname);
            preparedStatement.setString(3, pcontactNo);

            // Execute query and check results
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                // Set session attributes
                session.setAttribute("PatientID", pid);
                session.setAttribute("PatientName", pname);

                // Redirect to the dashboard if login is successful
                response.sendRedirect("patientDashboard.jsp");
            } else {
                // Show an error message if credentials are invalid
                out.println("<script type='text/javascript'>");
                out.println("alert('Invalid Patient ID, Name, or Contact Number. Please try again.');");
                out.println("location='patientLogin.jsp';");
                out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script type='text/javascript'>");
            out.println("alert('An error occurred. Please try again later.');");
            out.println("location='patientLogin.jsp';");
            out.println("</script>");
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
%>
