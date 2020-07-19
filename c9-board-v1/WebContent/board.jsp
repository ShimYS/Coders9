<%@page import="com.board.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body, html {
	height: 100%;
	background-color:;
}

#board-body-table {
	width: 100%;
}
</style>
</head>
<body>
<%
	String position = "board";
%>
	<%@ include file="navbar.jsp"%>

	<div class="container d-flex h-100">
		<div class="row w-100 align-self-center">
			<div class="col-12 mx-auto">
				<div class="card">
					<div class="card-header">
						<p class="h3" style="display: inline-flex;">Coders9 - Board</p>
						<button class="btn btn-success btn-sm float-right" id="btn-add-todo-form" data-toggle="modal" data-target="#modal-board-form">New</button>
						<%
							String error = request.getParameter("error");
							
							if("deny".equals(error)){
						%>
							<p style="color:red;">로그인 후 다시 시도해주세요</p>
						<%
							}
						%>
					</div>
					<div class="card-body">
						<table id="board-list" class="table text-center table-hover">
							<colgroup>
								<col width="8%">
								<col width="10%">
								<col width="37%">
								<col width="10%">
								<col width="15%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead>
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

									for (int i = 0; i < boards.size(); i++) {
								%>
								<tr class="font-weight-bold" data-toggle="modal" 
									data-target="#modal-board-detail" onclick="modalDetailData(<%=boards.get(i).getNo()%>)">
									<td><%=boards.get(i).getNo()%></td>
									<td><%=boards.get(i).getTitle()%></td>
									<td><%=boards.get(i).getContent()%></td>
									<td><%=boards.get(i).getWriter()%></td>
									<td><%=boards.get(i).getRegistDate()%></td>
									<td id="board-<%=boards.get(i).getNo() %>-detail-viewCnt"><%=boards.get(i).getViewCount()%></td>
									<td><%=boards.get(i).getLikes()%></td>
								</tr>
								<!-- 모달 상세정보 모달 창  -->
								<tr>
									<td class="modal" id="modal-board-detail">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												
												<div class="modal-header">
													<h4 class="modal-title" id="modal-board-datail-title">Board - detail</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
	
												<div class="modal-body">
													<div class="row">
														<div class="col-12">
															<table class="table table-bordered table-sm">
																<colgroup>
																	<col width="15%">
																	<col width="35%">
																	<col width="15%">
																	<col width="35%">
																</colgroup>
																<tbody id="table-todo-detail-tbody">
																	<!-- 게시물 상세보기 데이터 -->
																</tbody>
															</table>
														</div>
													</div>
												</div>
	
												<div class="modal-footer" id="modal-board-datail-btn">
													
												</div>
											</div>
										</div>
									</td>
									<!-- 모달 상세정보 모달 창  -->
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
					<div class="card-footer">
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 새 일정 등록 모달창  -->
	<div class="modal" id="modal-board-form">
		<div class="modal-dialog modal-lg">
			<form method="post" action="addboard.jsp">
	 			<div class="modal-content">
	   				<div class="modal-header">
	     				<h4 class="modal-title">New Board Form</h4>
	     				<button type="button" class="close" data-dismiss="modal">&times;</button>
	   				</div>
	   				<div class="modal-body">
	     				<div class="row">
	     					<div class="col-12">
	     						<div class="card">
	     							<div class="card-body">
	     								<div class="form-group">
	     									<label>Title</label>
	     									<input type="text" class="form-control" name="title" id="newboard-title"/>
	     								</div>
	     								<div class="form-group">
	     									<label>Content</label>
	     									<textarea rows="3" class="form-control" name="content" id="newboard-content"></textarea>
	     								</div>
	     							</div>
	     						</div>
	     					</div>
	     				</div>
	   				</div>
	   				<div class="modal-footer">
	     				<button type="submit" class="btn btn-outline-success btn-sm" id="btn-newtodo">Register</button>
	     				<button type="button" class="btn btn-outline-dark btn-sm" data-dismiss="modal">Close</button>
	   				</div>
	 			</div>
	 		</form>
		</div>
	</div>
	<!-- 새 일정등록 모달창 끝 -->
	
	<script type="text/javascript">
		function modalDetailData(boardNo) {
			var boardNo = boardNo;
			
			var xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function () {
				
				if(xhr.readyState == 4 && xhr.status == 200) {
					var text = xhr.responseText;
					var board = JSON.parse(text);
					
					// 상세정보 세팅
					var rows = "";
					
					rows += "<tr>";
					rows += "<th>Title</th>";
					rows += "<td colspan='3'>"+board.title+"</td>"
					rows += "</tr>";
					
					rows += "<tr>";
					rows += "<th>Writer</th>";
					rows += "<td>"+board.writer+"</td>";
					rows += "<th>RegisterDate</th>";
					rows += "<td>"+board.registDate+"</td>";
					rows += "</tr>";
					
					rows += "<tr>";
					rows += "<th>Views</th>";
					rows += "<td>"+board.viewCount+"</td>";
					rows += "<th>Good</th>";
					rows += "<td>"+board.likes+"</td>";
					rows += "</tr>";
					
					rows += "<tr>";
					rows += "<th style='vertical-align: middle;'>Content</th>";
					rows += "<td colspan='3'>";
					rows += "<small>"+board.content+"</small>";
					rows += "</td>";
					rows += "</tr>";
					
					document.getElementById("table-todo-detail-tbody").innerHTML = rows;
					
					// 타이틀 세팅
					var titleRows = "";
					titleRows = board.writer+"'s board";
					document.getElementById("modal-board-datail-title").innerHTML = titleRows;
					
					// 버튼 세팅
					var userId =  '<%=(String)session.getAttribute("userId")%>';
					var btnRows = "";
					if(board.writer == userId){
						btnRows += "<button type='button' class='btn btn-outline-danger btn-sm' id='btn-del-todo' onclick='removeBoard("+board.no+")'>삭제</button>";
						btnRows += "<button type='button' class='btn btn-outline-dark btn-sm' data-dismiss='modal'>닫기</button>";						
					} else {
						btnRows += "<button type='button' class='btn btn-outline-success btn-sm' id='btn-wait-todo' onclick='goodToBoard("+board.no+")'>좋아요</button>";
						btnRows += "<button type='button' class='btn btn-outline-dark btn-sm' data-dismiss='modal'>닫기</button>";	
					}	
					document.getElementById("modal-board-datail-btn").innerHTML = btnRows;
					
					// 리스트 조회수 세팅
					document.getElementById("board-"+board.no+"-detail-viewCnt").innerHTML = board.viewCount;
				}
			}
			
			xhr.open("GET", "/c9-board-v1/boarddetail.jsp?boardno="+boardNo);
			
			xhr.send();
		}	
		
		function removeBoard(boardNo) {
			console.log(boardNo);
		}
		
		function goodToBoard(boardNo) {
			console.log(boardNo);
		}
	
	</script>
</body>
</html>