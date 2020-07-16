<%@page import="com.board.vo.User"%>
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
</head>
<body>
<div class="container">
	<%
		User userLoginCheck = (User)session.getAttribute("loginUser");
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light shadow fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Coders9</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
						<a class="nav-link" href="home.jsp">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="board.jsp">Board</a>
					</li>
					<%
						if(userLoginCheck == null) {
					%>
					<li class="nav-item">
						<a class="nav-link" href="">SignIn</a>
					</li>
					<%
						} else {
					%>
					<!-- 모달기능 추가해야함 (profile, sign out) -->
					<li class="nav-item">
						<a class="nav-link" href="userinfo.jsp" onclick="">
							<img class="img-circle" alt="" style="width: 30px; height: 30px;"
							src="https://c.wallhere.com/photos/fb/3d/1920x1080_px_Album_Covers_Led_Zeppelin_music-1402973.jpg!d">
						</a>
					</li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>
</div>
</body>
</html>