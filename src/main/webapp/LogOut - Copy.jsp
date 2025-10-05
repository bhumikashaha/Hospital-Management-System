<%
    if (session != null) {
        session.invalidate(); // Invalidate the session
    }
    response.sendRedirect("index1.jsp"); // Redirect to the login page
%>
