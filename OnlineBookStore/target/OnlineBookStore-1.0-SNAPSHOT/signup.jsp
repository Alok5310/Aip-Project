<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<!-- Corrected class from signup-bg to signup-page -->
<body class="signup-page d-flex align-items-center justify-content-center vh-100">

<div class="card shadow-lg p-4 bg-white bg-opacity-75 rounded" style="width: 100%; max-width: 450px;">
    <h2 class="text-center text-success mb-4">📝 Create an Account</h2>

    <% if (request.getParameter("error") != null) { %>
        <div class="alert alert-danger">⚠️ Something went wrong! Please try again.</div>
    <% } %>

    <form method="post" action="register">
        <div class="mb-3">
            <label class="form-label">Name</label>
            <input type="text" name="name" class="form-control" placeholder="Enter your full name" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Choose a strong password" required>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-success">✅ Register</button>
        </div>
    </form>
</div>

</body>
</html>
