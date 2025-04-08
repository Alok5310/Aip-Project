package controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {
    private static final String ADMIN_EMAIL = "Chaturbedialok61@gmail.com";
    private static final String ADMIN_PASSWORD = "Alok2061@";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", "admin");
            response.sendRedirect("admin/adminpanel.jsp");
        } else {
            response.sendRedirect("admin/adminlogin.jsp?error=1");
        }
    }
}
