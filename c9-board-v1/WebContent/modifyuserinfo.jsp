<%@page import="com.board.dao.UserDao"%>
<%@page import="com.board.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	// 세션에서 유저 객체 조회
	User user = (User)session.getAttribute("loginUser");
	
	// 입력된 값 조회
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	
	// 유저 객체에 조회한 값 담기
	user.setName(name);
	user.setEmail(email);
	user.setTel(tel);
	user.setGender(gender);
	user.setAddress(address);
	
	// 유저 정보 수정
	UserDao userDao = new UserDao();
	userDao.updateUser(user);
	
	response.sendRedirect("userinfo.jsp");
%>