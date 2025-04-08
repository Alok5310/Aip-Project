<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body class="admin-login-page">

<div class="container mt-5" style="max-width: 500px; background-color: rgba(255, 255, 255, 0.9); padding: 30px; border-radius: 15px;">
    <h2 class="text-center mb-4">Admin Login</h2>

    <% if (request.getParameter("error") != null) { %>
        <div class="alert alert-danger text-center">Invalid credentials. Please try again.</div>
    <% } %>

    <form method="post" action="<%= request.getContextPath() %>/adminlogin">
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" placeholder="Enter admin email" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Enter password" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>
</div>

</body>
</html>
