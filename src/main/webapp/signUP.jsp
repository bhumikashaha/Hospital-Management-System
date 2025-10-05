<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Signup</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
             background: linear-gradient(135deg, #a8e6cf, #ffffff);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 400px;
            max-width: 90%;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        form label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        form button {
            width: 100%;
            background: green;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        form button:hover {
            background: #5b78d7;
        }
        .message {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Patient Signup</h1>
        <form action="signUPAction.jsp" method="POST">
            <label for="PatientID">Patient ID</label>
            <input type="text" id="PatientID" name="PatientID" placeholder="Enter Patient ID" required>

            <label for="PName">Patient Name</label>
            <input type="text" id="PName" name="PName" placeholder="Enter Patient Name" required>

            <label for="PContactNo">Contact Number</label>
            <input type="text" id="PContactNo" name="PContactNo" placeholder="Enter Contact Number" required>

            <button type="submit">Sign Up</button>
        </form>
    </div>
</body>
</html>
