<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>
<%@ page import="dao.BookDAO" %>

<%
    String username = (String) session.getAttribute("user");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Book> books = BookDAO.getAllBooks();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book List</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="booklist-page">

<div class="container mt-5">
    <div class="card p-4 shadow" style="background-color: rgba(255, 255, 255, 0.95); border-radius: 15px;">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="text-primary">? Available Books</h2>
            <div>
                <strong>Welcome, <%= username %>!</strong>
                <a href="logout.jsp" class="btn btn-outline-danger btn-sm ms-3">Logout</a>
            </div>
        </div>

        <% if (books == null || books.isEmpty()) { %>
            <div class="alert alert-info text-center">No books available at the moment.</div>
        <% } else { %>
            <table class="table table-striped table-bordered">
                <thead class="table-dark text-center">
                    <tr>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Price (?)</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Book book : books) { %>
                        <tr class="align-middle text-center">
                            <td><%= book.getTitle() %></td>
                            <td><%= book.getAuthor() %></td>
                            <td><%= book.getPrice() %></td>
                            <td>
                                <form action="OrderServlet" method="post" class="d-flex justify-content-center align-items-center gap-2">
                                    <input type="hidden" name="bookId" value="<%= book.getId() %>" />
                                    <input type="hidden" name="price" value="<%= book.getPrice() %>" />
                                    <input type="number" name="quantity" value="1" min="1" class="form-control form-control-sm" style="width: 80px;" />
                            </td>
                            <td>
                                    <button type="submit" class="btn btn-sm btn-success">Order Now</button>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>
</div>

</body>
</html>
