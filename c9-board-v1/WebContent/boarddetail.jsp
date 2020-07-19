<%@page import="com.google.gson.Gson"%>
<%@page import="com.board.vo.Board"%>
<%@page import="com.board.dao.BoardDao"%>
<%@page import="com.board.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	

	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
	
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(boardNo);
	
	int cnt = board.getViewCount() + 1;
	
	//조회수 증가
	boardDao.updateBoardViewCnt(boardNo, cnt);
	
	Board resultBoard = boardDao.getBoardByNo(boardNo);
	
	Gson gson = new Gson();
	String jsonText = gson.toJson(resultBoard);
	
	out.write(jsonText);
%>