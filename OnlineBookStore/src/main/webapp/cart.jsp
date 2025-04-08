<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>
<%@ page import="model.CartItem" %>

<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    double grandTotal = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="cart-page">

<div class="container mt-5">
    <div class="card shadow-lg p-4">
        <h2 class="text-center text-primary mb-4">🛒 Your Shopping Cart</h2>

        <div class="table-responsive">
            <table class="table table-bordered table-striped text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Book</th>
                        <th>Price (₹)</th>
                        <th>Quantity</th>
                        <th>Total (₹)</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (cart != null && !cart.isEmpty()) {
                        for (CartItem item : cart) {
                            double total = item.getBook().getPrice() * item.getQuantity();
                            grandTotal += total;
                    %>
                    <tr>
                        <td><%= item.getBook().getTitle() %></td>
                        <td><%= item.getBook().getPrice() %></td>
                        <td><%= item.getQuantity() %></td>
                        <td><%= total %></td>
                        <td>
                            <a href="RemoveFromCartServlet?bookId=<%= item.getBook().getId() %>" class="btn btn-sm btn-danger">🗑 Remove</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3"><strong>Grand Total:</strong></td>
                        <td colspan="2"><strong>₹<%= grandTotal %></strong></td>
                    </tr>
                </tfoot>
                </table>

                <div class="text-end">
                    <form action="OrderServlet" method="post">
                        <input type="hidden" name="total_price" value="<%= grandTotal %>" />
                        <button type="submit" class="btn btn-success">✅ Place Order</button>
                    </form>
                </div>
            <% } else { %>
                <tr>
                    <td colspan="5" class="text-center">Your cart is empty.</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>
</div>
</div>

</body>
</html>
