package controller;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import util.DBConnection; // ✅ Import your DB utility

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            response.sendRedirect("login.jsp?error=empty");
            return;
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE email=? AND password=?")) {

            stmt.setString(1, email);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", rs.getString("name"));
                    session.setAttribute("userId", rs.getInt("user_id"));

                    System.out.println("✅ Login successful for user: " + rs.getString("name"));
                    response.sendRedirect("dashboard.jsp");
                } else {
                    System.out.println("❌ Invalid login attempt for email: " + email);
                    response.sendRedirect("login.jsp?error=invalid");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // ✅ Print actual DB error to console/log
            request.setAttribute("errorMessage", "Database connection problem: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
