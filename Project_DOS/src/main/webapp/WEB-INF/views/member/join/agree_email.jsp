<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이메일 인증</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card {
            width: 400px; /* 카드의 너비 설정 */
            padding: 20px; /* 패딩 추가 */
            border-radius: 10px; /* 모서리 둥글게 */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
        }
        h1 {
            margin-bottom: 20px;
            font-weight: bold;
        }
        .btn-custom {
            width: 150px; /* 버튼의 너비를 100%로 설정 */
        }
        article {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 60px); /* 헤더 높이를 제외한 높이 */
            text-align: center;
        }
    </style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<article>
    	<h1 class="text-center">이메일 인증</h1>
		<div class="card">
		    <form>
		        <div class="mb-3">
		            <label for="email" class="form-label">Email</label>
		            <div class="input-group">
		                <input type="email" class="form-control" id="email" placeholder="이메일을 입력하세요" required>
		                <button class="btn btn-outline-secondary" type="button">인증 번호 보내기</button>
		            </div>
		        </div>
		        <div class="mb-3">
		            <label for="email" class="form-label">인증번호</label>
		            <div class="input-group">
		                <input type="email" class="form-control" id="emailpasswd" placeholder="인증번호를 입력하세요" required>
		                <button class="btn btn-outline-secondary" type="button">인증</button>
		            </div>
		        </div>
		<!--         <div class="mb-3"> -->
		<!--             <label for="password" class="form-label">인증번호</label> -->
		<!--             <input type="text" class="form-control" id="password" placeholder="AB23B31" required> -->
		<!--             <div class="form-text">인증 확인 되었습니다.</div> -->
		<!--         </div> -->
		        <button type="submit" class="btn btn-dark btn-custom" onclick="location.href='MemberJoinForm'">다음으로</button>
		    </form>
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
