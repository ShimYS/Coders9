<%@page import="com.board.vo.Board"%>
<%@page import="com.board.dao.BoardDao"%>
<%@page import="com.board.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap 4 Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="navbar.jsp"%>
<div class="container" style="margin-top: 4%;">
	<div class="row">
		<div class="col-4">
			d
		</div>
        <div class="col-4 mt-3 text-center">
            <h1>BOARD</h1>
        </div>
        <div class="col-4 text-right">
        	<form class="mt-4">
        		<input type="text" class="form-control" id="search-date" style="display: inline-block; width: 200px;">
        		<button type="button" class="btn btn-primary ml-1" id="btn-search">search</button>
        	</form>
        </div>
    </div>
  	
  	<div class="row">
  		<div class="col-12">
  			<div class="card card-promary">
  				<div class="card-header text-center">
  					<p>board</p>
  				</div>
  				<div class="card-body">
	  				<table class="table table text-center table-striped p-0">
		                <%
		                	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
		                	System.out.println(boardNo);
		                	BoardDao boardDao = new BoardDao();
		                	Board board = boardDao.getBoardByNo(boardNo);
		                %>
		                <colgroup>
		                	<col width="25%">
		                	<col width="25%">
		                	<col width="12.5%">
		                	<col width="12.5%">
		                	<col width="12.5%">
		                	<col width="12.5%">
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th>title</th>
		                        <td><%=board.getTitle() %></td>
		                        <th>view</th>
		                        <td><%=board.getViewCount() %></td>
		                        <th>like</th>
		                        <td><%=board.getLikes() %></td>
		                    </tr>
		                    <tr>
		                        <th>writer</th>
		                        <td><%=board.getWriter() %></td>
		                        <th colspan="2">date</th>                    
		                        <td colspan="2"><%=board.getRegistDate() %></td>                    
		                    </tr>
		                    <tr>
		                        <th>content</th>
		                        <td colspan="5"><%=board.getContent() %></td>
		                    </tr>
		                </tbody>
	            	</table>
  				</div>
  				<div class="card-footer">
  					<div class="row">
	  					<div class="col-6">
	  						페이지네이션
	  					</div>
	  					<div class="col-6 text-right">
	  						<button class="btn btn-primary">modify</button>
	  						<button class="btn btn-primary">delete</button>
	  					</div>
  					</div>
  				</div>
  				
  			</div>
  		</div>
  	</div>
</div>
</body>
</html>