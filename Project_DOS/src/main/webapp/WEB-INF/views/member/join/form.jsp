<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/member_join_form.js"></script>
    <style>
        .card {
            width: 600px; /* 카드의 너비 설정 */
            padding: 20px; /* 패딩 추가 */
            border-radius: 10px; /* 모서리 둥글게 */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
        }
        h1 {
            margin-bottom: 20px;
            font-weight: bold;
            text-align: center;
        }
        .btn-custom {
            width: 150px; /* 버튼의 너비를 100%로 설정 */
        }
        
        article {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 1000px; /* 헤더 높이를 제외한 높이 */
            text-align: left;
        }
    </style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	
	<article>
		<div class="card">
		    <h1>회원가입</h1>
		    <form action="JoinSuccess" name="joinForm" method="post">
		        <div class="mb-3">
		            <label for="username" class="form-label">아이디</label>
		            <input type="text" class="form-control" id="id" name="member_id" placeholder="4~16자 영문자, 숫자, _조합" onblur="checkId()" required >
		        </div>
		        <div class="mb-3">
		            <label for="password" class="form-label">비밀번호</label>
		            <input type="password" class="form-control" id="passwd" name="member_passwd" placeholder="비밀번호를 입력하세요." required >
		        </div>
		        <div class="mb-3">
		            <label for="confirmPassword" class="form-label">비밀번호 확인</label>
		            <input type="password" class="form-control" id="passwd2" placeholder="비밀번호를 다시 입력하세요." required>
		        </div>
		        <div class="mb-3">
		            <label for="name" class="form-label">이름</label>
		            <input type="text" class="form-control" id="name" name="member_name" pattern="^[가-힣]{2,6}$" title="한글 2글자 ~ 6글자 사이" required>
		        </div>
		        <div class="mb-3">
		            <label for="birthdate" class="form-label">생년월일</label>
		            <input type="date" class="form-control" id="birthdate" name="member_birth"  required>
		        </div>
		        <div class="mb-3">
		            <label for="phoneNumber" class="form-label">전화번호</label>
		            <input type="text" class="form-control" id="phoneNumber" name="member_phone" placeholder="전화번호를 입력하세요." required>
		        </div>
		        <div class="mb-3">
		            <label for="email" class="form-label">이메일</label>
		            <input type="email" class="form-control" id="email" placeholder="이메일을 입력하세요" name="member_email" required>
		        </div>
		        <div class="mb-3">
			            <label for="email" class="form-label">주소</label>
						<input type="text" class="form-control" id="postcode" name="member_post_code" size="6" readonly placeholder="우편번호" required>
			            <input type="text" class="form-control" id="address1" name="member_address1" size="6" placeholder="기본주소" >
			            <input type="text" class="form-control" id="address2" name="member_address2" size="6" placeholder="상세주소" >
						<input type="button" class="form-control btn btn-dark" value="주소검색" id="btnSearchAddress"><br>
<!-- 						<input type="text" id="address1" name="address1" size="25" readonly placeholder="기본주소"><br> -->
<!-- 						<input type="text" id="address2" name="address2" size="25" placeholder="상세주소"> -->
<!-- 		            <label for="email" class="form-label">주소</label> -->
<!-- 		            <input type="email" class="form-control" id="email" placeholder="이메일을 입력하세요" > -->
		        </div>
		        <div class="d-flex justify-content-between">
            		<button type="submit" class="btn btn-primary btn-custom">회원가입</button>
           			<button type="button" class="btn btn-secondary btn-custom" onclick="window.history.back()">뒤로가기</button>
        		</div>
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
	<!-- ==================================================================== -->
	<!-- 카카오(다음) 우편번호 검색 서비스 API 활용하여 주소검색 기능 구현하기 -->
	<!-- 해당 API 웹사이트 주소 : https://postcode.map.daum.net/guide -->
	<!-- 카카오(다음)에서 제공하는 우편번호 검색 스크립트 파일(postcode.v2.js) 로딩 필수 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		document.querySelector("#btnSearchAddress").onclick = function() {
		    new daum.Postcode({ // postcode.v2.js 에서 제공하는 daum.Postcode 객체 생성
		    	// 주소 검색 창에서 주소 검색 후 검색된 주소를 사용자가 클릭 시
		    	// oncomplete 이벤트에 의해 이벤트 뒤의 익명함수가 자동으로 호출됨
	            // 사용자가 클릭한 주소 정보가 익명함수 파라미터 data 로 전달됨 
	            // => 주의! 이 익명함수는 개발자가 호출하는 것이 아니라
	            //    API 에 의해 자동으로 호출됨
	            //    (어떤 동작 수행 후 자동으로 호출되는 함수를 콜백(callback) 함수라고 함)
		        oncomplete: function(data) {
		            // 클릭(선택)된 주소 정보(객체)가 익명함수 파라미터 data 에 저장되어 있음
// 		            console.log(data);
		            // data 객체 접근을 위해 data.xxx 형식으로 주소 상세정보 접근 가능
		            // ---------------------------------------------------------------
		            // 1) 우편번호(= postcode 이지만, 최근 국가기초구역번호로 변경 = zonecode 사용)
		            document.joinForm.postcode.value = data.zonecode;
		    		
		    		// 2) 기본주소(address 속성값)
// 		            document.joinForm.address1.value = data.address;
		    		
		    		// 만약, 해당 주소에 건물명(buildingName 속성값)이 존재할 경우(널스트링 아님)
		    		// 기본주소 뒤에 건물명을 결합하여 출력
		    		// ex) 기본주소 : 부산광역시 부산진구 동천로109
		    		//     건물명 : 삼한골든게이트
		    		//     => 부산광역시 부산진구 동천로109 (삼한골든게이트)
		    		let address = data.address; // 기본 주소 저장
		    		
		    		if(data.buildingName != "") { // 건물명이 존재할 경우 판별
		    			address += " (" + data.buildingName + ")"; // 건물명 결합
		    		}
		    		
		    		document.joinForm.address1.value = address; // 기본 주소 출력
		    		
		    		// 상세주소 입력 항목(name 속성 address2)에 커서 요청
		    		document.joinForm.address2.focus();
		        }
		    }).open(); // 주소검색창 표시(새 창으로 열림)
		}
	</script>
</body>
</html>
