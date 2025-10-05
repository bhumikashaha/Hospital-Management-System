<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor and Patient Portal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0fdf4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            display: flex;
            flex-direction: row;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            max-width: 1000px;
            width: 90%;
        }
        .left-section {
            flex: 1;
            background: #2f855a;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            text-align: center;
            padding: 20px;
        }
        .left-section h1 {
            font-size: 32px;
            margin-bottom: 10px;
        }
        .left-section p {
            font-size: 18px;
        }
        .right-section {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .right-section h2 {
            font-size: 28px;
            color: #2f855a;
            margin-bottom: 20px;
        }
        .btn {
            display: block;
            width: 80%;
            padding: 15px;
            margin: 10px 0;
            background-color: #38a169;
            color: #fff;
            border: none;
            border-radius: 10px;
            font-size: 18px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #2f855a;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left-section">
            <h1>Welcome to Our Portal</h1>
            <p>Your health is our priority. Choose your role to proceed.</p>
        </div>
        <div class="right-section">
            <h2>Login Portal</h2>
            <a href="patientLogin.jsp" class="btn">Patient Login</a>

        </div>
    </div>
</body>
</html>
