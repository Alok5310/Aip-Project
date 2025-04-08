<%@ page import="java.util.List" %>
<%@ page import="model.Order" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    List<Order> orders = (List<Order>) session.getAttribute("orders");
    SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy, hh:mm a");
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">? My Orders</h2>

    <%
        if (orders == null || orders.isEmpty()) {
    %>
        <div class="alert alert-info text-center">You haven't placed any orders yet.</div>
    <%
        } else {
    %>
        <div class="table-responsive">
            <table class="table table-bordered table-hover text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Order ID</th>
                        <th>Book Title</th>
                        <th>Quantity</th>
                        <th>Total Price (?)</th>
                        <th>Order Date</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Order o : orders) { %>
                    <tr>
                        <td><%= o.getId() %></td>
                        <td><%= o.getBookTitle() %></td>
                        <td><%= o.getQuantity() %></td>
                        <td>?<%= o.getTotalPrice() %></td>
                        <td><%= sdf.format(o.getOrderDate()) %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    <%
        }
    %>

    <div class="text-center mt-4">
        <a href="dashboard.jsp" class="btn btn-secondary">?? Back to Dashboard</a>
    </div>
</div>
</body>
</html>
