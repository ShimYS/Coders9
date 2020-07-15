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

		}
	</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	
	<div class="container" style="margin-top: 5%;">
		<div class="row w-100">
			<div class="col-5">
				<form action="">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<select class="form-control" name="searchoption">
								<option value="boardno">번호</option>
								<option value="boardtitle">제목</option>
								<option value="boardwriter">작성자</option>
							</select>
						</div>
						<input id="searchValue" type="text" class="form-control"
							placeholder="검색어를 입력하세요" onkeyup="eventListData()">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								onclick="eventListData()">조회</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-7">
				
			</div>

		</div>
		<div class="row w-100" id="board-body-table">
			<div class="col-12 ">
				<table id="board-list" class="table text-center table-hover">
					<colgroup>
						<col width="8%">
						<col width="10%">
						<col width="41%">
						<col width="10%">
						<col width="15%">
						<col width="8%">
						<col width="8%">
					</colgroup>
					<thead >
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>좋아요</th>
						</tr>
					</thead>
					<tbody>
					<%
						BoardDao boardDao = new BoardDao();
						List<Board> boards = boardDao.getAllBoards();
						
						for(int i=0; i<boards.size(); i++) {
					%>
						<tr class="font-weight-bold" onclick="showDetailBoard(<%=boards.get(i).getNo() %>)">
							<td><%=boards.get(i).getNo() %></td>
							<td><%=boards.get(i).getTitle() %></td>
							<td><%=boards.get(i).getContent() %></td>
							<td><%=boards.get(i).getWriter() %></td>
							<td><%=boards.get(i).getRegistDate() %></td>
							<td><%=boards.get(i).getViewCount() %></td>
							<td><%=boards.get(i).getLikes() %></td>
						</tr>
					<%
						}
					%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function showDetailBoard(boardNo) {
			alert(boardNo);
		}
	</script>
</body>
</html>