<%@page import="com.board.vo.User"%>
<%@page import="com.board.vo.Board"%>
<%@page import="com.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	// 파라미터 값 조회
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// 유저 조회
	HttpSession userSession = request.getSession();
	User user = (User)userSession.getAttribute("loginUser");
	if(user == null){
		// 로그인 상태가 아닐때 에러보내기
		response.sendRedirect("board.jsp?error=deny");	
	}
	
	// reset object
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	board.setWriter(user.getId());
	
	// call dao 
	BoardDao boardDao = new BoardDao();
	boardDao.insertBoard(board);
	
	// redirect to board.jsp
	response.sendRedirect("board.jsp");
%>