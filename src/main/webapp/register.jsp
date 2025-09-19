<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration - Bhojan Vibes</title>
    <style>
        body {
            font-family: Arial;
            background-color: #fff2e6;
            padding: 40px;
        }
        .register-form {
            background: #fff;
            padding: 25px;
            width: 400px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0,0,0,0.2);
        }
        .register-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type=text], input[type=password], input[type=email] {
            width: 100%;
            padding: 12px;
            margin: 8px 0 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type=submit] {
            width: 100%;
            padding: 12px;
            background: #ff7f50;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background: #ff6347;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="register-form">
    <h2>Register</h2>

    <% if (request.getParameter("error") != null) { %>
        <div class="error">Registration failed. Try again.</div>
    <% } %>

  <form action="RegisterServlet" method="post">
  Name:<input type="text" name="name" />
  E-mail:<input type="email" name="email" />
  Password:<input type="password" name="password" />
  <button type="submit">Register</button>
</form>

</div>

</body>
</html>
