<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin: auto;
            padding: 2rem;
            border: 1px solid #dee2e6;
            border-radius: 0.5rem;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            background-color: #dc3545; /* Bootstrap의 danger 색상 */
            color: white;
            width: 200px;
            margin: auto;
        }
        .text-black {
            color: black; /* 검은색으로 설정 */
        }
        .no-underline {
            text-decoration: none; /* 밑줄 제거 */
            color: #007bff; /* 링크 색상 */
        }
        .no-underline:hover {
            text-decoration: underline; /* 호버 시 밑줄 추가 */
        }
    </style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	
	<article>
		<h1 class="text-center mb-4">DOS</h1>
		<div class="login-container mt-5">
		    <form action="LoginAction" method="post">
		        <div class="mb-3">
		            <label for="login" class="form-label">Login</label>
		            <input type="text" id="login" name="login" class="form-control" placeholder="아이디 입력" required>
		        </div>
		        <div class="mb-3">
		            <label for="password" class="form-label">Password</label>
		            <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호 입력" required>
		        </div>
		        <div class="form-check mb-3">
		            	<input type="checkbox" id="remember" name="remember" class="form-check-input">
		            	<label for="remember" class="form-check-label">아이디 저장</label>
		        </div>
		        <button type="submit" class="btn btn-dark w-100 mb-3">로그인</button>
		        <div class="text-center">
		       	    <a href="FindLogin" class="text-black no-underline " >아이디 찾기</a> | <a href="FindPasswd" class="text-black no-underline ">비밀번호 찾기</a>
		   	    </div>
		    </form>
		</div>
		<div class="d-grid gap-2 col-6 mx-auto">
		    <p class="text-center mt-4">아직 DOS 계정이 없으신가요?</p>
		    <button class="btn btn-custom" onclick="location.href='MemberJoin'">회원가입</button>
		</div>
	</article>
	<br>
	<br>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
	</footer>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
