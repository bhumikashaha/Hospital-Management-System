<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #333;
            padding: 20px;
            background-color: #4CAF50;
            color: white;
            margin-bottom: 30px;
        }

        .container {
            width: 60%;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin: 10px 0 5px;
            font-size: 1.1em;
        }

        input[type="text"], input[type="datetime-local"], textarea {
            padding: 10px;
            font-size: 1em;
            margin: 5px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            font-size: 1.1em;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            font-size: 1.2em;
            text-align: center;
            margin-bottom: 20px;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            font-size: 1.2em;
            color: #4CAF50;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

    <h1>Add New Appointment</h1>

    <div class="container">
        <form action="addAppointmentAction.jsp" method="POST">
            <label for="patientID">Patient ID:</label>
            <input type="text" id="patientID" name="patientID" required>

            <label for="appointmentDate">Appointment Date & Time:</label>
            <input type="datetime-local" id="appointmentDate" name="appointmentDate" required>

            <label for="doctorName">Doctor Name:</label>
            <input type="text" id="doctorName" name="doctorName" required>

            <label for="reason">Reason for Appointment:</label>
            <textarea id="reason" name="reason" rows="4" required></textarea>

            <input type="submit" value="Add Appointment">
        </form>

        <div class="back-link">
            <a href="index.jsp">Back to Home</a>
        </div>
    </div>

</body>
</html>
