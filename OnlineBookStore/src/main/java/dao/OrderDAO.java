package dao;

import model.Order;
import util.DBConnection;

import java.sql.*;
import java.util.*;
import java.time.format.DateTimeFormatter;

public class OrderDAO {

    // ✅ Place a new order
    public static boolean placeOrder(Order order) {
        boolean success = false;
        String sql = "INSERT INTO orders (user_id, book_id, quantity, total_price, order_date) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            // 🧾 Debug logs
            System.out.println("📦 Placing order...");
            System.out.println("➡️ User ID: " + order.getUserId());
            System.out.println("➡️ Book ID: " + order.getBookId());
            System.out.println("➡️ Quantity: " + order.getQuantity());
            System.out.println("➡️ Total Price: " + order.getTotalPrice());

            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getBookId());
            ps.setInt(3, order.getQuantity());
            ps.setDouble(4, order.getTotalPrice());
            ps.setTimestamp(5, new Timestamp(System.currentTimeMillis())); // Set current timestamp

            int rowsInserted = ps.executeUpdate();
            success = rowsInserted > 0;

            if (success) {
                System.out.println("✅ Order placed successfully!");
            } else {
                System.out.println("⚠️ No rows inserted. Check data.");
            }

        } catch (SQLException e) {
            System.out.println("❌ Error placing order in DB: " + e.getMessage());
        }

        return success;
    }

    // ✅ Retrieve all orders by a specific user
    public static List<Order> getOrdersByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.*, b.title AS book_title " +
                     "FROM orders o JOIN books b ON o.book_id = b.book_id " +
                     "WHERE o.user_id = ? ORDER BY o.order_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();

                o.setId(rs.getInt("order_id"));         // order ID
                o.setUserId(rs.getInt("user_id"));      // user ID
                o.setBookId(rs.getInt("book_id"));      // book ID
                o.setQuantity(rs.getInt("quantity"));   // quantity
                o.setTotalPrice(rs.getDouble("total_price")); // price

                // Format date
                Timestamp ts = rs.getTimestamp("order_date");
                if (ts != null) {
                    String formattedDate = ts.toLocalDateTime()
                                             .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                    o.setOrderDate(formattedDate);
                }

                o.setBookTitle(rs.getString("book_title")); // Book title from JOIN

                orders.add(o); // add to list
            }

            System.out.println("📋 Total Orders Retrieved for user " + userId + ": " + orders.size());

        } catch (SQLException e) {
            System.out.println("❌ Error fetching orders: " + e.getMessage());
        }

        return orders;
    }
}
