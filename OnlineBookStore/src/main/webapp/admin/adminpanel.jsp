<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, util.DBConnection" %>
<%
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }

    String adminName = (String) session.getAttribute("admin");
    String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Custom CSS (adjusted for admin folder) -->
    <link rel="stylesheet" href="../css/style.css">
</head>
<body class="admin-panel-page">

<div class="container mt-5">
    <div class="card shadow-lg p-4" style="background-color: rgba(255, 255, 255, 0.95); border-radius: 15px;">
        <h2 class="mb-3">📚 Welcome Admin, <%= adminName %> 👋</h2>
        <hr>

        <!-- Feedback message -->
        <% if ("deleted".equals(msg)) { %>
            <div class="alert alert-success">✅ Book deleted successfully!</div>
        <% } else if ("error".equals(msg)) { %>
            <div class="alert alert-danger">❌ Failed to delete book!</div>
        <% } %>

        <div class="d-flex gap-3 mb-4">
            <a href="addbook.jsp" class="btn btn-success">➕ Add Book</a>
            <a href="../logout.jsp" class="btn btn-danger ms-auto">🚪 Logout</a>
        </div>

        <!-- Book Table -->
        <h4>📖 Book List</h4>
        <div class="table-responsive">
            <table class="table table-bordered table-hover mt-3">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Category</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    try (Connection conn = DBConnection.getConnection();
                         PreparedStatement stmt = conn.prepareStatement("SELECT * FROM books");
                         ResultSet rs = stmt.executeQuery()) {
                        while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getInt("book_id") %></td>
                        <td><%= rs.getString("title") %></td>
                        <td><%= rs.getString("author") %></td>
                        <td>₹<%= rs.getDouble("price") %></td>
                        <td><%= rs.getInt("stock") %></td>
                        <td><%= rs.getString("category") %></td>
                        <td>
                            <a href="editbook.jsp?id=<%= rs.getInt("book_id") %>" class="btn btn-sm btn-warning">✏ Edit</a>
                            <a href="../DeleteBookServlet?id=<%= rs.getInt("book_id") %>"
                               onclick="return confirm('Are you sure you want to delete this book?');"
                               class="btn btn-sm btn-danger">🗑 Delete</a>
                        </td>
                    </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='7' class='text-danger'>Database error!</td></tr>");
                        e.printStackTrace();
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
