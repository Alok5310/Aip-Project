<%@ page import="model.Book, dao.BookDAO" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }

    int id = Integer.parseInt(request.getParameter("id"));
    Book book = BookDAO.getBookById(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4 text-center">Edit Book</h2>

    <form action="../BookServlet" method="post" class="p-4 border rounded shadow">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="id" value="<%= book.getId() %>">

        <div class="mb-3">
            <label class="form-label">Title</label>
            <input type="text" name="title" class="form-control" value="<%= book.getTitle() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Author</label>
            <input type="text" name="author" class="form-control" value="<%= book.getAuthor() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Price</label>
            <input type="number" name="price" step="0.01" class="form-control" value="<%= book.getPrice() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Stock</label>
            <input type="number" name="stock" class="form-control" value="<%= book.getStock() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Category</label>
            <input type="text" name="category" class="form-control" value="<%= book.getCategory() %>">
        </div>

        <button type="submit" class="btn btn-primary w-100">Update Book</button>
    </form>
</div>
</body>
</html>
