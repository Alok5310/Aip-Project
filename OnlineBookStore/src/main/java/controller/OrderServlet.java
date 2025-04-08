package controller;

import dao.OrderDAO;
import model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // ✅ Get session and user ID
            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("userId");

            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // ✅ Get book data from request
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            double totalPrice = price * quantity;

            // ✅ Create order
            Order order = new Order();
            order.setUserId(userId);
            order.setBookId(bookId);
            order.setQuantity(quantity);
            order.setTotalPrice(totalPrice);

            // ✅ Save order
            boolean success = OrderDAO.placeOrder(order);

            if (success) {
                System.out.println("✅ Order placed successfully.");
                response.sendRedirect("order.jsp");
            } else {
                System.out.println("❌ Order failed.");
                request.setAttribute("errorMessage", "Order failed. Please try again.");
                request.getRequestDispatcher("order-failure.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("order-failure.jsp").forward(request, response);
        }
    }
}
