<%@page import="com.google.gson.Gson"%>
<%@page import="com.board.vo.User"%>
<%@page import="com.board.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	
	UserDao userDao = new UserDao();
	User savedUser = userDao.getUserById(id);
	
	Gson gson = new Gson();
	String jsonContent;
	
	// 중복된 아이디 체크
	if(savedUser == null){
		// 중복되지 않음
		jsonContent = gson.toJson("false");
	} else {
		// 중복됨
		jsonContent = gson.toJson("true");
	}
	
	out.write(jsonContent);
%>