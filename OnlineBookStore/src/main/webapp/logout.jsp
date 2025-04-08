<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the session
    session.invalidate();

    // Redirect to login page after logout
    response.sendRedirect("login.jsp");  // Change to "adminlogin.jsp" if it's for admin
%>
