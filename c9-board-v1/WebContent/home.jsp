<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<style>
body, html {
	height: 100%;
	background-color: ;
}
</style>
</head>
<body>
<%
	String position = "home";
%>

	<%@ include file="navbar.jsp"%>
	
	<%
		User loginCheck = (User)session.getAttribute("loginUser");
	%>
	<div class="container d-flex h-100">
		<div class="row align-self-center w-100">
			<div class="col-4 mx-auto">
				<div>
					<blockquote class="blockquote text-center">
						<p class="h1 mb-0">Coders9</p>
						<footer class="blockquote-footer">
							side project <cite title="Source Title"> - one</cite>
						</footer>
					</blockquote>
					
					
					<form method="post" action="login.jsp">
						<div class="form-group">
							<div class="input-group input-group-lg mb-4">
								<input type="text" class="form-control" placeholder="ID"
									aria-label="Username" aria-describedby="basic-addon1" name="id">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group input-group-lg mb-4">
								<input type="password" class="form-control" placeholder="PASSWORD"
									aria-label="Password" aria-describedby="basic-addon1" name="password">
							</div>
						</div>
						<div>
							<button type="submit" class="btn btn-dark btn-lg btn-block mb-4">LOGIN</button>
						</div>
					</form>
					<%
						String error = request.getParameter("error");
						if("deny".equals(error)){
					%>
						<p style="color: red;">회원가입하세요</p>
					<%
						}
					%>
					<%
						if("pwd".equals(error)){
					%>
						<p style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</p>
					<%
						}
					%>
				</div>
				<div>
					<a class="mb-1" href="#"
						style="font-size: small; font-weight: bold; color: black;">Forgot
						password?</a>
					<p class="" style="font-size: small;">
						Don't have an account? <a href="signupform.jsp"
							style="font-weight: bold; color: black;">Sign up</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- bootstrap -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
