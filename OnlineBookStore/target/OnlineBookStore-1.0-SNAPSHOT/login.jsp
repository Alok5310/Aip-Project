<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<!-- Use class matching your style.css -->
<body class="login-page d-flex align-items-center justify-content-center vh-100">

<div class="card shadow-lg p-4 bg-white bg-opacity-75 rounded" style="width: 100%; max-width: 400px;">
    <h2 class="text-center text-primary mb-4">🔐 User Login</h2>

    <% 
        String error = request.getParameter("error");
        if ("empty".equals(error)) {
    %>
        <div class="alert alert-warning">⚠️ Please fill in both email and password.</div>
    <% } else if ("invalid".equals(error)) { %>
        <div class="alert alert-danger">❌ Invalid email or password. Try again.</div>
    <% } else if ("driver".equals(error)) { %>
        <div class="alert alert-danger">⚠️ JDBC Driver not found.</div>
    <% } else if ("db".equals(error)) { %>
        <div class="alert alert-danger">⚠️ Database error. Please try again later.</div>
    <% } %>

    <form method="post" action="login">
        <div class="mb-3">
            <label class="form-label">Email address</label>
            <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">🔓 Login</button>
        </div>
    </form>
</div>

</body>
</html>
