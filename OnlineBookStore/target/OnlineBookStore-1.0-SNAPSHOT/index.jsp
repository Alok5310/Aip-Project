<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Online Bookstore</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<!-- Apply the correct background class as per style.css -->
<body class="index-page d-flex align-items-center justify-content-center vh-100">

<div class="text-center bg-white bg-opacity-75 p-5 rounded shadow">
    <h1 class="display-4 fw-bold text-primary mb-4">📚 Welcome to the Online Bookstore</h1>
    <p class="lead mb-5">Discover, Read, and Shop Your Favorite Books!</p>
    <div class="d-flex justify-content-center gap-3 flex-wrap">
        <a href="login.jsp" class="btn btn-primary px-4 py-2">👤 User Login</a>
        <a href="signup.jsp" class="btn btn-success px-4 py-2">📝 Sign Up</a>
        <a href="admin/adminlogin.jsp" class="btn btn-danger px-4 py-2">🔐 Admin Login</a>
    </div>
</div>

</body>
</html>
