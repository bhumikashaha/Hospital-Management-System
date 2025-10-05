<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%
    // Get user input
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String userType = request.getParameter("userType"); // "Doctor" or "Staff"

    // Flag to check login status
    boolean isValidUser = false;
    String redirectPage = "index.jsp"; // Default redirect for failed login

    try {
        // Load MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to the database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifecare", "root", "root");

        // Prepare the SQL query based on userType
        String query = null;
        if ("Doctor".equalsIgnoreCase(userType)) {
            query = "SELECT id, username FROM doctor WHERE username = ? AND password = ?";
            redirectPage = "DoctorDashboard.jsp"; // Successful doctor login
        } else if ("Staff".equalsIgnoreCase(userType)) {
            query = "SELECT id, username FROM staff WHERE username = ? AND password = ?";
            redirectPage = "index1.jsp"; // Successful staff login
        }

        if (query != null) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            // Execute query
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Valid user
                isValidUser = true;
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("userType", userType);
            }

            rs.close();
            ps.close();
        }

        con.close();
    } catch (ClassNotFoundException e) {
        out.println("<p>Error: MySQL Driver not found. Please ensure the JDBC JAR is added to the project.</p>");
    } catch (SQLException e) {
        out.println("<p>Error: Unable to connect to the database. Check credentials and database configuration.</p>");
        out.println("<p>Details: " + e.getMessage() + "</p>");
    }

    // Redirect based on login status
    if (isValidUser) {
        response.sendRedirect(redirectPage);
    } else {
        out.println("<h2>Invalid Username or Password</h2>");
        out.println("<a href='index.jsp'>Try Again</a>");
    }
%>
