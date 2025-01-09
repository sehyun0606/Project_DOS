<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
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
		<h1 class="text-center mb-4">아이디 찾기</h1>
		<div class="login-container mt-5">
		    <form action="FindSelectAgree" id="FindId" method="post">
		        <div class="mb-3">
		            <label for="login" class="form-label">User Name</label>
		            <input type="text" id="member_name" name="member_name" class="form-control" placeholder="이름 입력" >
		        </div>
		        <div class="mb-3">
		            <label for="phonenumber" class="form-label">Phone Number</label>
		            <input type="text" id="member_phone" name="member_phone" class="form-control" placeholder="전화번호 입력" >
		        </div>
		        <button type="submit" class="btn btn-dark w-100 mb-3">아이디 찾기</button>
		        <div class="d-flex justify-content-between">
		       	    <a href="MemberLogin" class="text-black no-underline " >로그인 하기</a>
		       	    <a href="FindPasswd" class="text-black no-underline ">비밀번호 찾기</a>
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
