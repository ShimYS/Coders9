<%@page import="com.board.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	 <title></title>
	 <meta charset="utf-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
 	<style>
		body, html {
			height: 100%;
			background-color: ;
		}
		#board-body-table {
			width: 100%;
			height: auto;
		}
	</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	
	<div class="container d-flex h-100">
		<div class="row align-self-center  w-100" id="board-body-table">
			<div class="col-8 mx-auto">
				<table class="table text-center">
					<thead class="thead-dark">
						<tr>
							<th scope="col">#</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">내용</th>
							<th scope="col">좋아요</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>
					<tbody>
					<%
						BoardDao boardDao = new BoardDao();
						List<Board> boards = boardDao.getAllBoards();
					%>
					<%
						for(int i=0; i<boards.size(); i++){
					%>
						<tr>
							<th scope="row"><%=boards.get(i).getNo() %></th>
							<td><%=boards.get(i).getTitle() %></td>
							<td><%=boards.get(i).getWriter() %></td>
							<td><%=boards.get(i).getContent() %></td>
							<td><%=boards.get(i).getLikes() %></td>
							<td><%=boards.get(i).getRegistDate() %></td>
						</tr>
					<%
						}
					%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>