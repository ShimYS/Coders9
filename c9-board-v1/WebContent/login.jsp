<%@page import="com.board.vo.User"%>
<%@page import="com.board.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	// 아이디, 비밀번호 조회
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// 계정 검사
	UserDao userDao = new UserDao();
	User savedUser = userDao.getUserById(id);
	
	if(savedUser == null){
		response.sendRedirect("home.jsp?error=deny");
		return;
	} else if (!password.equals(savedUser.getPassword())){
		response.sendRedirect("home.jsp?error=pwd");
		return;
	}
	
	// 세션 저장
	session.setAttribute("loginUser", savedUser);
	session.setAttribute("userId", savedUser.getId());
	
	// userinfo 리다이렉트
	response.sendRedirect("userinfo.jsp");
%>