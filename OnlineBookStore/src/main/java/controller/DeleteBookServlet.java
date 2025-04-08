package controller;

import dao.BookDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("id"));

        BookDAO bookDAO = new BookDAO();
        boolean success = bookDAO.deleteBook(bookId);

        if (success) {
            response.sendRedirect("admin/adminpanel.jsp?msg=deleted");
        } else {
            response.sendRedirect("admin/adminpanel.jsp?msg=error");
        }
    }
}
