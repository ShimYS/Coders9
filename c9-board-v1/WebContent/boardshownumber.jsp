<%@page import="com.board.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int numberOfContent = NumberUtil.stringToInt(request.getParameter("searchOption"));
	
	response.sendRedirect("/c9-board-v1/board.jsp?rowsperpage="+numberOfContent);
%>