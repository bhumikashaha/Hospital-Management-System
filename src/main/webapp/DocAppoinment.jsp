<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor's Appointments</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7fdf8;
        }

        .header {
            background-color: #38a169;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            padding: 20px;
            margin: 20px auto;
            max-width: 1000px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table-container {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table th, table td {
            text-align: left;
            padding: 10px;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #38a169;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .button {
            background-color: #38a169;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            text-decoration: none;
            margin: 10px 0;
            display: inline-block;
        }

        .button:hover {
            background-color: #2f855a;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Doctor's Appointments</h1>
    </div>
    <div class="container">
        <h2>All Appointments</h2>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Appointment ID</th>
                        <th>Patient Name</th>
                        <th>Age</th>
                        <th>Date & Time</th>
                        <th>Contact</th>
                        <th>Reason</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>001</td>
                        <td>John Doe</td>
                        <td>30</td>
                        <td>2025-01-20 10:00 AM</td>
                        <td>123-456-7890</td>
                        <td>Fever and Cold</td>
                    </tr>
                    <tr>
                        <td>002</td>
                        <td>Jane Smith</td>
                        <td>25</td>
                        <td>2025-01-20 11:00 AM</td>
                        <td>987-654-3210</td>
                        <td>Regular Checkup</td>
                    </tr>
                    <!-- Additional rows can be added here -->
                </tbody>
            </table>
        </div>
        <a href="dashboard.html" class="button">Go Back to Dashboard</a>
    </div>
</body>
</html>
