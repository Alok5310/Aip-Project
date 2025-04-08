<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Failed</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5 text-center">
        <h2 class="text-danger">? Oops! Something went wrong.</h2>
        <p>We couldn't process your order at this time.</p>
        <%
            String errorMsg = (String) session.getAttribute("orderError");
            if (errorMsg != null) {
        %>
            <div class="alert alert-warning mt-3"><%= errorMsg %></div>
        <%
                session.removeAttribute("orderError"); // clear message
            }
        %>
        <a href="booklist.jsp" class="btn btn-primary mt-4">? Try Again</a>
    </div>
</body>
</html>
