<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String username = (session != null) ? (String) session.getAttribute("user") : null;
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int totalBooks = 0;
    int totalUsers = 0;

    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "Alok2061@");
         PreparedStatement bookStmt = conn.prepareStatement("SELECT COUNT(*) FROM books");
         PreparedStatement userStmt = conn.prepareStatement("SELECT COUNT(*) FROM users")) {

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (ResultSet rsBooks = bookStmt.executeQuery()) {
            if (rsBooks.next()) totalBooks = rsBooks.getInt(1);
        }

        try (ResultSet rsUsers = userStmt.executeQuery()) {
            if (rsUsers.next()) totalUsers = rsUsers.getInt(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="dashboard-bg">

<div class="container py-5">
    <div class="mb-4 text-center">
        <h1 class="fw-bold text-primary">📊 Dashboard</h1>
        <h5>Welcome, <span class="text-success"><%= username %></span>!</h5>
    </div>

    <div class="d-flex flex-wrap justify-content-center gap-3 mb-4">
        <a href="booklist.jsp" class="btn btn-info text-white">📚 Browse Books</a>
        <a href="cart.jsp" class="btn btn-warning">🛒 View Cart</a>
        <a href="order.jsp" class="btn btn-secondary">📦 My Orders</a>

        <% if (username.equalsIgnoreCase("admin")) { %>
            <a href="admin/addbook.jsp" class="btn btn-success">➕ Add Book</a>
            <a href="admin/adminpanel.jsp" class="btn btn-dark">⚙️ Admin Panel</a>
        <% } %>

        <a href="logout.jsp" class="btn btn-danger ms-auto">🚪 Logout</a>
    </div>

    <div class="row g-4 text-center">
        <div class="col-md-6">
            <div class="card shadow border-0 bg-light">
                <div class="card-body">
                    <h4 class="text-primary">📘 Total Books</h4>
                    <h1 class="display-5 fw-bold"><%= totalBooks %></h1>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card shadow border-0 bg-light">
                <div class="card-body">
                    <h4 class="text-success">👤 Total Users</h4>
                    <h1 class="display-5 fw-bold"><%= totalUsers %></h1>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
