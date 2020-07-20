<%@page import="com.board.util.NumberUtil"%>
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
		<%
			//<!-- 페이지네이션  -->
			// 1. 한 화면에 표시할 행의 갯수
			int receivePerPage = NumberUtil.stringToInt(request.getParameter("rowsperpage"));
			int rowsPerPage = 5;
			if(receivePerPage == 0){
				rowsPerPage = 5;
			} else {
				rowsPerPage = receivePerPage;
			}

			// 2. 클라이언트가 요청한 페이지 번호 조회하기
			int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);
			
			// 3. 조회할 목록의 시작번호와 끝번호를 조회한다.

			int receiveBeginNum = NumberUtil.stringToInt(request.getParameter("beginNumber"));
			int receiveEndNum = NumberUtil.stringToInt(request.getParameter("endNumber"));
			
			int beginNumber = (pageNo - 1) * rowsPerPage + 1;
			int endNumber = pageNo * rowsPerPage;
			
			
			System.out.println("-----------------------------------");
			System.out.println("pageNo : "+pageNo);
			
			//<!-- 페이지네이션  -->
		%>

		<div class="row w-100 align-self-center">
			<div class="col-12 mx-auto">
				<div class="card">
					<div class="card-header">
						<div class="row ">
							<div class="col-9">
								<p class="h3" style="display: inline-flex;">Coders9 - Board</p>
							</div>
							<div class="col-3">
								
								<form method="get" action="boardshownumber.jsp">
									<div class="row">
										<div class="col-7">
											<div class="input-group mb-3 ">
												<div class="input-group-prepend">
													<select id="searchOption" class="form-control" name="searchOption">
														<option value="#" selected="selected" disabled="disabled">show</option>
														<option value="10">10contents</option>
														<option value="20">20contents</option>
														<option value="30">30contents</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-5">
											<button class="btn btn-outline-dark" type="submit">search</button>										
										</div>
									</div>
								</form>
							</div>
						</div>
						<!--  
						<button class="btn btn-success btn-sm float-right"
							id="btn-add-todo-form" data-toggle="modal"
							data-target="#modal-board-form">New</button>
						
						<p style="color: red;">로그인 후 다시 시도해주세요</p>
						
						-->
					</div>
					<div class="card-body p-0">
						<table id="board-list" class="table text-center table-hover p-0 mb-0">
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
									List<Board> boards = boardDao.getAllBoardsWithRange(beginNumber, endNumber);
									int rowCount = boardDao.getBoardCount();
									
									System.out.println("rowCount : "+rowCount);
									
									if(boards.isEmpty()){
								%>		
									<tr class="font-weight-bold text-center">
										<td colspan='7'>게시물이 존재하지 않습니다.</td>
									</tr>
								<%
									} else {
										for (int i = 0; i < boards.size(); i++) {
								%>
									<tr 
								<%
									if("1".equals(boards.get(i).getVisible())) {
								%>	
									class="font-weight-bold" 
									onclick="modalDetailData(<%=boards.get(i).getNo()%>)"
									data-toggle="modal"
									data-target="#modal-board-detail"
								<%
									} else {
								%>	
									class="text-muted"
								<%
									}
								%>
									>
									<td><%=boards.get(i).getNo()%></td>
									<td><%=boards.get(i).getTitle()%></td>
									<td><%=boards.get(i).getContent()%></td>
									<td><%=boards.get(i).getWriter()%></td>
									<td><%=boards.get(i).getRegistDate()%></td>
									<td id="board-<%=boards.get(i).getNo()%>-detail-viewCnt"><%=boards.get(i).getViewCount()%></td>
									<td id="board-<%=boards.get(i).getNo()%>-detail-likes"><%=boards.get(i).getLikes()%></td>
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
									}
								%>
								
								<tr>
									<td colspan='7' class="p-1">
										<button class="btn btn-outline-dark btn-block float-right" id="btn-add-todo-form" data-toggle="modal" data-target="#modal-board-form">New</button>
									</td>
								</tr>
							
							</tbody>
						</table>
					</div>
					<div class="card-footer mt-0 p-0 pt-3">
						<!-- 페이지 처리 시작 -->
						<ul class="pagination justify-content-center">
							<%
								// 0. 한 화면당 표시할 페이지번호 갯수
								int pagesPerBlock = 10;

								// 1. 전체 행의 갯수를 조회한다.
								int rows = rowCount;

								// 2. 전체 페이지수를 계산한다.
								int totalPages = (int) Math.ceil((double) rows / rowsPerPage);

								// 3. 전체 페이지블록 갯수 계산하기
								int totalBlocks = (int) Math.ceil((double) totalPages / pagesPerBlock);

								// 4. 요청한 페이지가 어느 페이지 블록에 속하는지 계산하기
								int currentBlock = (int) Math.ceil((double) pageNo / pagesPerBlock);

								// 5. 요청한 페에지가 속한 블록의 시작페이지번호와 끝페이지번호 계산하기
								int beginPageNo = (currentBlock - 1) * pagesPerBlock + 1;
								int endPageNo = currentBlock * pagesPerBlock;
								
								if (pageNo > 1) {
							%>
							<li class="page-item "><a class="page-link"
								href="board.jsp?page=<%=pageNo - 1%>&rowsperpage=<%=rowsPerPage %>" style="color: black;">이전</a></li>
							<%
								}
								for (int num = beginPageNo; num <= endPageNo; num++) {
									if (endPageNo > totalPages) {
										endPageNo = totalPages;
									}
							%>
									<li class="page-item <%=pageNo == num ? "active" : ""%> "><a
										class="page-link" href="board.jsp?page=<%=num%>&rowsperpage=<%=rowsPerPage %>" style="color: black;"><%=num%></a></li>
							<%
								}
								if (pageNo < totalPages) {
							%>
							<li class="page-item"><a class="page-link"
								href="board.jsp?page=<%=pageNo + 1%>&rowsperpage=<%=rowsPerPage %>" style="color: black;">다음</a></li>
							<%
								}
							%>
						</ul>
						<!-- 페이지 처리 끝 -->
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
											<label>Title</label> <input type="text" class="form-control"
												name="title" id="newboard-title" />
										</div>
										<div class="form-group">
											<label>Content</label>
											<textarea rows="3" class="form-control" name="content"
												id="newboard-content"></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-outline-success btn-sm"
							id="btn-newtodo">Register</button>
						<button type="button" class="btn btn-outline-dark btn-sm"
							data-dismiss="modal">Close</button>
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
					var userId =  '<%=(String) session.getAttribute("userId")%>';
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
		
		// 게시물 제거
		function removeBoard(boardNo) {
			var boardNo = boardNo;
						
				var xhr = new XMLHttpRequest();
				
				xhr.onreadystatechange = function () {
					
					if(xhr.readyState == 4 && xhr.status == 200) {
						var text = xhr.responseText;
						var board = JSON.parse(text);

						var rows = "";
						
						rows += "<tr>";
						rows += "<th>Title</th>";
						rows += "<td colspan='3'><strike>"+board.title+"</strike></td>"
						rows += "</tr>";
						
						rows += "<tr>";
						rows += "<th>Writer</th>";
						rows += "<td><strike>"+board.writer+"</strike></td>";
						rows += "<th>RegisterDate</th>";
						rows += "<td><strike>"+board.registDate+"</strike></td>";
						rows += "</tr>";
						
						rows += "<tr>";
						rows += "<th>Views</th>";
						rows += "<td><strike>"+board.viewCount+"</strike></td>";
						rows += "<th>Good</th>";
						rows += "<td><strike>"+board.likes+"</strike></td>";
						rows += "</tr>";
						
						rows += "<tr>";
						rows += "<th style='vertical-align: middle;'>Content</th>";
						rows += "<td colspan='3'>";
						rows += "<small><strike>"+board.content+"</strike></small>";
						rows += "</td>";
						rows += "</tr>";
						
						document.getElementById("table-todo-detail-tbody").innerHTML = rows;
						
						location.reload();
					}
				}
				
			xhr.open("GET", "/c9-board-v1/removeboard.jsp?boardno="+boardNo);
			
			xhr.send();
		}
		
		
		// 좋아요 증가
		function goodToBoard(boardNo) {
			var boardNo = boardNo;
			
			var xhr = new XMLHttpRequest();
			
				xhr.onreadystatechange = function () {
					
					if(xhr.readyState == 4 && xhr.status == 200) {
						var text = xhr.responseText;
						var board = JSON.parse(text);

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
						
						// 리스트 좋아요 세팅
						document.getElementById("board-"+board.no+"-detail-likes").innerHTML = board.likes;
					}
				}
			
			xhr.open("GET", "/c9-board-v1/likeboard.jsp?boardno="+boardNo);
			
			xhr.send();
		}
	
	</script>
</body>
</html>