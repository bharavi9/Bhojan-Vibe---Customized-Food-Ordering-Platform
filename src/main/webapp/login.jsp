<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Bhojan Vibes</title>
    <style>
        body {
            font-family: Arial;
            background-color: #fff2e6;
            padding: 40px;
        }
        .login-form {
            background: #fff;
            padding: 25px;
            width: 400px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0,0,0,0.2);
        }
        .login-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px;
            margin: 8px 0 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type=submit] {
            width: 100%;
            padding: 12px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background: #45a049;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="login-form">
    <h2>Login</h2>

    <% if (request.getParameter("error") != null) { %>
        <div class="error">Invalid email or password.</div>
    <% } %>

    <form action="LoginServlet" method="post">
  Email:<input type="text" name="email" />
  Password:<input type="password" name="password" />
  <button type="submit">Login</button>
</form>
<p>Don't have an account? <a href="register.jsp">Register here</a></p>

</div>

</body>
</html>
