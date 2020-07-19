<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	HttpSession httpSession = request.getSession();
	
	httpSession.invalidate();
	
	response.sendRedirect("home.jsp?status=logout");
%>