<%@page import="com.board.vo.User"%>
<%@page import="com.board.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	
	// 입력값 조회
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// 유저객체에 입력값 담기
	User user = new User();
	user.setId(id);
	user.setPassword(password);
	
	// 신규 유저 등록
	UserDao userDao = new UserDao();
	userDao.insertUser(user);
	
	// home 리다이렉트
	response.sendRedirect("home.jsp");
%>