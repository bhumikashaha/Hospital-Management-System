<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: url('images/home2.jpg') no-repeat center center fixed;
            background-size: cover;
            display: grid;
            align-items: center;
            justify-items: center;
            height: 100vh;
            backdrop-filter: brightness(0.7);
            box-sizing: border-box;

        }

        .signup-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding:30px;
            border-radius: 30px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
            width: 450px;
            box-sizing: border-box;

        }

        .signup-box {
            margin-bottom: 20px;
            font-size: 25px;
            color: #2f855a;

        }

        .signup-box h2 {
            margin-bottom: 15px;
            text-align: center;
             color: #2f855a;
        }


         label {
          color: black;
          font-size: 17px;
          text-align:left;

        }

        .signup-box input {
            width: 95%;
            padding: 9px;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-size: 14px;

        }

        .signup-box button {
            width: 100%;
            padding: 10px;
            background-color: #38a169;
            color: #fff;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn:hover {
            background-color: #2f855a;
        }

        .footer-text {
            margin-top: 20px;
            font-size: 12px;
            color: #777;
        }
    </style>
</head>
<body>
          <div class="signup-container">
               <div class="signup-box">
                    <h2>LifeCare</h2>
                    <form action="indexAction.jsp" method="post">
                         <label for="user_id">Enter your Id:</label>
                         <input type="text" id="id" name="user_id" required><br>
                         <label for="Username">Username:</label>
                         <input type="text" id="Username" name="username" required><br>

                         <label for="Password">Password:</label>
                         <input type="password" id="password" name="password" required><br>
                         <label>User Type:</label>
                         <select name="userType">
                              <option value="Staff">Staff</option>
                              <option value="Doctor">Doctor</option>
                         </select><br><br>

                         <form action="indexAction.jsp" method="get">
                         <button type="submit">Login</button>
                  </form>
               </div>


          </div>
</body>


                <p class="footer-text">&copy; 2025 LifeCare. All Rights Reserved.</p>

    </div>
</body>
</html>
