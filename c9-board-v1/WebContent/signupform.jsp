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
</style>
</head>
<body>
<div class="container d-flex h-100">
		<div class="row align-self-center w-100">
			<div class="col-4 mx-auto">
				
				<!-- 네비바 -->
				<%@ include file="navbar.jsp"%>
				<!-- 바디 -->
				<div>
					<!-- 로고 + 페이지 간단 설명/안내문 -->
					<blockquote class="blockquote text-center">
						<p class="h1 mb-0">Coders9</p>
						<footer class="blockquote-footer">
							welcome to <cite title="Source Title">sign up</cite>
						</footer>
					</blockquote>
					
					<!-- 입력폼 시작 -->
					<form method="post" action="signup.jsp" onsubmit="return checkSubmitValue(this)">
						<div class="form-group mb-1">
							<div class="input-group input-group-lg">
								<input type="text" class="form-control" placeholder="ID" id="form-input-id"
									aria-label="Username" aria-describedby="basic-addon1" name="id" onkeyup="checkId()">
							</div>
							<span id="form-check-id" style="display: inline-block; color: red; font-weight: bold;"></span>
						</div>
						<div class="form-group mb-1">
							<div class="input-group input-group-lg">
								<input type="password" class="form-control" placeholder="PASSWORD-1" id="form-input-pwd1"
									aria-label="Password" aria-describedby="basic-addon1" name="password" onkeyup="checkPwd()">
							</div>
							<span id="form-check-pwd" style="display: inline-block; color: red;"></span>
						</div>
						<div class="form-group mb-1">
							<div class="input-group input-group-lg">
								<input type="password" class="form-control" placeholder="PASSWORD-2" id="form-input-pwd2"
									aria-label="Password" aria-describedby="basic-addon1" onkeyup="eqPwd()">
							</div>
							<span id="form-check-pwd-equal" style="display: inline-block; color: red;"></span>
						</div>
						<div>
							<button id="form-submit-btn" type="submit" class="btn btn-dark btn-lg btn-block">Sign Up</button>
							<span id="form-btn-submit" style="display: inline-block; color: red;"></span>
						</div>
					</form>
					<!-- 입력폼 끝 -->				
				</div>	
				
				<!-- 푸터바 -->
						
			</div>
		</div>
	</div>
	<script type="text/javascript">
		// 입력된 값을 가져오는 함수
		function setData() {
			var value = document.getElementById('form-input-id').value;
			var pwd1 = document.getElementById('form-input-pwd1').value;
			var pwd2 = document.getElementById('form-input-pwd2').value;
			
			var result = [value, pwd1, pwd2];

			return result;
		}
	
		// ID 입력 체크
		function checkId() {
			// 정규표현식 영어대/소문자와 숫자만 가능, 4~12자리
			var pattern = /^[A-Za-z0-9]{4,12}$/;
			
			var id = setData()[0];
			
			var alertText = document.getElementById('form-check-id');
			
			if(!pattern.test(id)){
				alertText.innerText = "ID is only available in English and Number!!";
				return false;
			} else {						
				alertText.innerText = "";
				// id 중복체크 
				dupCheckId(id);
				return true;
			}
		}
		
		// 전달받은 id를 db의 id들과 중복체크하는 함수
		function dupCheckId(idReceived) {
			var id = idReceived;
			
			var xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var text = xhr.responseText;
					var resData = JSON.parse(text);
					
					var alertText = document.getElementById('form-check-id');
					if('true' === resData){
						alertText.innerText = "Duplicate ID exists";
					} else {
						alertText.innerText = "";
					}				
				}
			};
			
			xhr.open('get', 'signupdupcheck.jsp?id='+id);
			xhr.send();
		}
		
		// Password 입력 체크
		function checkPwd() {
			// 정규표현식 특수문자1개이상, 영어대/소문자 1개이상, 숫자1개이상, 8~30자리
			var pattern = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[$@!%*#?&])[a-zA-Z0-9$@!%*#?&]{8,}$/;
			var pwd = setData()[1];
					
			var value = document.getElementById('form-input-pwd1').value;

			var alertText = document.getElementById('form-check-pwd');
			
			if(!pattern.test(pwd)){
				alertText.innerText = "Does not meet the conditions";
				return false;
			} else {
				alertText.innerText = "";
				return true;
			}
		}
		
		// Password 확인란 체크
		function eqPwd() {
			var pwd1 = setData()[1];
			var pwd2 = setData()[2];
			
			var alertText = document.getElementById('form-check-pwd-equal');
			
			if(pwd1 === pwd2 && pwd1 !== ""){
				alertText.innerText = "";
				return true;
			} else {
				alertText.innerText = "Passwords do not match";
				return false;
			}
		}
		
		// 회원가입전 입력정보 종합체크
		function checkSubmitValue(form) {
			var id = setData()[0];
			var pwd1 = setData()[1];
			var pwd2 = setData()[2];
			
			console.log(form);
			
			var alertText = document.getElementById('form-btn-submit');
			
			if(checkId && checkPwd && eqPwd && pwd1 === pwd2){
				return true;
			} else {
				alertText.innerText = "please check your input!";	
				return false;
			}
		}
		
	</script>
</body>
</html>





















