<%@page import="com.board.dao.UserDao"%>
<%@page import="com.board.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://kit.fontawesome.com/1a122948e3.js" crossorigin="anonymous"></script>
<style>
body, html {
	height: 100%;
	background-color:;
}

.masthead {
	height: 30vh;
	min-height: 200px;
	background-image:
		url('https://c.wallhere.com/photos/fb/3d/1920x1080_px_Album_Covers_Led_Zeppelin_music-1402973.jpg!d');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	color: white;
}
#profile-header {
	width: 100%;
	height: 20vh;
}

#profile-sidemenu {
	width: 100%;
	height: 50vh;
}
#profile-contents {
	width: 100%;
	height: auto;
}
#pf-hd-row-box {
	height: 17vh;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<!-- 유저프로필 커버사진 -->
		<header class="masthead">
			<div class="container h-100">
				<div class="row h-100 align-items-center">
					<div class="col-12 text-center">
						<h1 class="font-weight-light"> 
							Coders9 - ShimYS
						</h1>
						<p class="lead">
							A great starter portfolio for programer
						</p>
					</div>
				</div>
			</div>
		</header>
		
		<!-- 유저프로필 메인 -->
		<section class=" mt-1 p-0">
			<div class="container h-100">
				
				<!-- 유저프로필 헤더 -->
				<div class="row h-100">
					<div class="col-12 p-0">
						<div class="card" id="profile-header">
							<div class="row ml-2" id="pf-hd-row-box">
								<div class="col-9">
									<div class="row mt-2">
										<div class="col-3">
											프로필사진											
										</div>
										<div class="col-9">
											<div class="row">
												<div class="col-12">
													이름(별명?)
												</div>
											</div>
											<div class="row">
												<div class="col-12">
													post 0 followers 0 following 0
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-3">
									<div class="row mt-2">
										<a class="col-9 text-right" type="button" data-toggle="modal" data-target="#myModal">Edit profile</a>
										
										<!-- Modify Modal Start -->
										<div class="modal fade" id="myModal">
											<div class="modal-dialog">
												<div class="modal-content">
				
													<!-- Modal body -->
													<form method="post" action="modifyuserinfo.jsp">
														<div class="modal-body">
														<%
															User user = (User)session.getAttribute("loginUser");
														%>
															<div class="row">
																<div class="col-3 mt-2">
																	<img alt="" src="https://c.wallhere.com/photos/fb/3d/1920x1080_px_Album_Covers_Led_Zeppelin_music-1402973.jpg!d" 
																		width="100px" height="100px">
																</div>
																<div class="col-9">
																	
																	<!-- 이름 -->
																	<div class="form-group">
																		<label for="usr" style="font-size:13px;">Name</label>
																		<div class="input-group mb-3">
																			<input type="text" class="form-control" name="name" 
																		<% 	
																			if(null == user.getName()) {
																		%>
																			placeholder="please input your name">
																		<%
																			} else {
																		%>
																			placeholder=<%=user.getName() %> value="<%=user.getName() %>">
																		<%
																			}
																		%>
																		</div>
																	</div>
																		
																	<!-- 이메일 -->
																	<div class="form-group">
																		<label for="usr" style="font-size:13px;">Email</label>
																		<div class="input-group mb-3">
																			<div class="input-group-prepend">
																				<span class="input-group-text">@</span>
																			</div>
																			<input type="text" class="form-control" name="email"
																		<% 	
																			if(null == user.getEmail()) {
																		%>
																			placeholder="please input your email">
																		<%
																			} else {
																		%>
																			placeholder=<%=user.getEmail() %> value="<%=user.getEmail() %>">
																		<%
																			}
																		%>
																		</div>
																	</div>
																	
																	<!-- 전화번호 -->
																	<div class="form-group">
																		<label for="usr" style="font-size:13px;">Tel</label>
																		<div class="input-group mb-3">
																			<div class="input-group-prepend">
																				<span class="input-group-text">
																					<i class="fab fa-telegram-plane"></i>
																				</span>
																			</div>
																			<input type="text" class="form-control" name="tel"
																		<% 	
																			if(null == user.getTel()) {
																		%>
																			placeholder="please input your tel">
																		<%
																			} else {
																		%>
																			placeholder=<%=user.getTel() %> value="<%=user.getTel() %>">
																		<%
																			}
																		%>                           
																		</div>
																	</div>
																	
																	<!-- 성별 -->
																	<div class="form-group">
																		<label for="usr" style="font-size:13px;">Gender</label>
																		<div class="row">
																		
																			<div class="col-3">
																				<div class="form-check">
																					<label class="form-check-label"> <input
																						type="radio" class="form-check-input"
																						name="gender" value="male" 
																		<%
																			if("male".equals(user.getGender())) {
																		%>
																						checked="checked"
																		<%
																			} 
																		%>
																						>male
																					</label>
																				</div>
																			</div>

																			<div class="col-9">
																				<div class="form-check">
																					<label class="form-check-label"> <input
																						type="radio" class="form-check-input"
																						name="gender" value="female"
																		<%
																			if("female".equals(user.getGender())) {
																		%>
																						checked="checked"
																		<%
																			} 
																		%>
																						>female
																					</label>
																				</div>
																			</div>
																		</div>
																		
																		
																	</div>
																	
																	<!-- 주소 -->
																	<div class="form-group">
																		<label for="usr" style="font-size:13px;">Address</label>
																		<div class="input-group mb-3">
																			<div class="input-group-prepend">
																				<span class="input-group-text">
																					<i class="fas fa-map-marker-alt"></i>
																				</span>
																			</div>
																			<input type="text" class="form-control" name="address"
																			
																		<% 	
																			if(null == user.getAddress()) {
																		%>
																			placeholder="please input your address">
																		<%
																			} else {
																		%>
																			placeholder=<%=user.getAddress() %> value="<%=user.getAddress() %>">
																		<%
																			}
																		%> 
																		</div>
																	</div>
																</div>
															</div>
														</div>

														<!-- Modal footer -->
														<div class="modal-footer">
															<button type="button" class="btn btn-light" data-dismiss="modal">cancel</button>
															<button type="submit" class="btn btn-dark">save</button>
														</div>
													</form>
												</div>
											</div>
										</div>
										<!-- Modify Modal End -->
										<a class="col-3 text-right" type="button">
											<i class="fas fa-cog mr-3"></i>									
										</a>
										<!-- 
										<div class="dropdown">

											
												<button type="button"
													class="btn btn-primary dropdown-toggle"
													data-toggle="dropdown">Sony</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">Tablet</a> <a
														class="dropdown-item" href="#">Smartphone</a>
												</div>
											
										</div>
										 -->	

									</div>
								</div>
							</div>
							
							<!-- 프로필 메뉴바 -->
							<div class="row ml-2 mb-2">
								<div class="col-12">
									Post Portfolio Badges 
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 유저프로필 메뉴, 컨텐츠 -->
				<div class="row">
					<!-- 좌측 사이드 메뉴 -->
					<div class="col-3 p-0 mt-1" >
						<div class="card" id="profile-sidemenu">
							
						</div>
					</div>
					<!-- 컨텐츠 -->
					<div class="col-9 pt-0 pr-0 pb-0 pl-1 mt-1">
						<div class="card" id="profile-contents">
							
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<script type="text/javascript">
		
	</script>
</body>
</html>






























