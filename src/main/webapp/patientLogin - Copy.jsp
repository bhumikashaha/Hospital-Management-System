<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Login</title>
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
            width: 470px;
            padding: 20px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            justify-content: center;
        }

         .image{
             flex:1 1 45rem;
             max-width: 40%;
             margin-right: 50px;
         }

         .image img{
            max-width: 100%;
            height: auto;
         }

         h1 {
            margin-bottom: 20px;
            color: #2f855a;
            text-align: center;
         }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: black;
        }
        .form-group input {
            width: 100%;
            padding: 6px;
            border: 1px solid #ddd;
            border-radius: 10px;
        }
        .btn {
            width: 100%;
            padding: 10px;
            background-color: #38a169;
            color: #fff;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #2f855a;
        }
        .create-account {
            margin-top: 15px;
            color: #2f855a;
            text-decoration: none;
            font-size: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .create-account:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

     <div class="image">
           <img src="https://raw.githubusercontent.com/wincodersujon/Hospital-website/c6c954ab074b68cf2b37490b556a2f6d33e23ea7/hospital/image/appointment-img.svg" alt="">
     </div>


    <div class="container">
        <h1>Patient Login</h1>
        <!-- Login Form -->


        <form action="patientLoginAction.jsp" method="post">
            <div class="form-group">
                <label for="PatientID">Patient ID (PID):</label>
                <input type="text" id="PatientID" name="PatientID" placeholder="Enter your Patient ID" required>
            </div>
            <div class="form-group">
                <label for="PName">Patient Name:</label>
                <input type="text" id="PName" name="PName" placeholder="Enter your Name" required>
            </div>
            <div class="form-group">
                <label for="PContactNo">Contact Number:</label>
                <input type="text" id="PContactNo" name="PContactNo" placeholder="Enter your Contact Number" required>
            </div>
            <button type="submit" class="btn">Login</button>
        </form>

        <!-- Link to Sign Up Page -->
        <a href="signUP.jsp" class="create-account"> Don't have an account? Sign up here </a>
    </div>
</body>
</html>
