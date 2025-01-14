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
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <style>
        .card {
            width: 500px; /* 카드의 너비 설정 */
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
            height: 1100px; /* 헤더 높이를 제외한 높이 */
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
<!-- 		        <div class="mb-3"> -->
<!-- 		            <label for="username" class="form-label">아이디</label> -->
<!-- 		            <input type="button" id="" class="form-label text-end" value="중복확인"> -->
<!-- 		            <input type="text" class="form-control" id="id" name="member_id" placeholder="4~16자 영문자, 숫자, _조합" onblur="checkId()" required > -->
<!-- 		        </div> -->
		        <div class="mb-3 ">
		            <label for="email" class="form-label">아이디</label>
		            <div class="input-group">
		                <input type="text" class="form-control" id="id" name="member_id" placeholder="4~16자 영문자, 숫자, _조합" onblur="checkId()" required>
		                <button class="btn btn-outline-secondary" type="button" id="btnCheckId" >아이디 중복 확인</button>
		            </div>
		        </div>
		        <div id="checkIdResult"></div>
		        <div class="mb-3">
		            <label for="password" class="form-label">비밀번호</label>
		            <input type="password" class="form-control" id="passwd" name="member_passwd" placeholder="비밀번호를 입력하세요." required >
		        </div>
		        <div id="checkPasswdResult"></div>
		        <div class="mb-3">
		            <label for="confirmPassword" class="form-label">비밀번호 확인</label>
		            <input type="password" class="form-control" id="passwd2" placeholder="비밀번호를 다시 입력하세요." required>
		        </div>
		        <div id="checkPasswd2Result"></div>
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
		
		
		// 아이디 중복검사 버튼 클릭 이벤트 핸들링
		$("#btnCheckId").click(function() {
// 			location.href = "MemberCheckId?id=" + $("#id").val();
			let id = $("#id").val();
			if (id == "") {
	            alert("아이디를 입력하세요!");
	            return;
			}
			// AJAX 요청으로 이메일 전송
			$.ajax({
				url: 'MemberCheckId',
				type: 'GET',
				data: {
					id: id
				}
			}).done(function(result){
				
				if(result == "true") {
					alert("아이디가 중복됩니다!");
					$("#checkIdResult").text("사용 불가능한 아이디");
					$("#checkIdResult").css("color", "red");
				} else {
					alert("사용할 수 있는 아이디 입니다!");
					$("#checkIdResult").text("사용 가능한 아이디");
					$("#checkIdResult").css("color", "blue");
				}
			}).fail(function(){
				
			});
		});
		
		
		
		$(function() {
			// 체크 결과를 저장하는 변수를 document - ready 이벤트 내에서만 사용할 경우
			let checkPasswdResult = false;
			let checkPasswd2Result = false;
			
			// 패스워드 입력란 blur 이벤트 핸들링
			$("#passwd").on("blur", function() {
				let passwd = $("#passwd").val();
				
				let msg; // 판별 결과로 출력할 메세지
				let color; // 판별 결과로 출력할 메세지의 색상명
				
				// 패스워드 조합 및 길이 규칙 : 영문자, 숫자, 특수문자(!@#$%) 8 ~ 16글자
				let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
				if(lengthRegex.exec(passwd)) { // 패스워드 패턴이 첫번째 정규표현식(lengthRegex)과 일치할 경우
					let count = 0; // 카운트 변수 선언
					
					// 1) 영문자 대문자 판별 정규표현식 패턴
					let engUpperRegex = /[A-Z]/;
					// 2) 영문자 소문자 판별 정규표현식 패턴
					let engLowerRegex = /[a-z]/;
					// 3) 숫자 판별 정규표현식 패턴
	//				let numRegex = /[0-9]/;
					let numRegex = /[\d]/;
					// 4) 특수문자(!@#$%) 판별 정규표현식 패턴
					let specRegex = /[!@#$%]/;
					
					// 5) 각 정규표현식 패턴에 따른 검사 수행 후 일치할 경우 카운트 변수값 1 증가
					// => 주의! 각각의 패턴을 별도로 검사하기 위해 각각의 if 문으로 판별(else 사용 금지!)
					if(engUpperRegex.exec(passwd)) { count++; } 
					if(engLowerRegex.exec(passwd)) { count++; }
					if(numRegex.exec(passwd)) { count++; }
					if(specRegex.exec(passwd)) { count++; }
					console.log("count 변수값 : " + count);
	
					// 6) 카운트 변수값에 따른 복잡도 검사 결과 출력
					//    => 4가지 조합 : 안전(초록색)
				    //    => 3가지 조합 : 보통(노란색)
				    //    => 2가지 조합 : 위험(주황색)
				    //    => 1가지      : 사용불가(빨간색)
					switch(count) {
						case 4 : 
							msg = "안전";
							color = "GREEN";
							// 비밀번호 체크 결과를 적합(true) 으로 표시
							checkPasswdResult = true;
							break;
						case 3 : 
							msg = "보통";
							color = "YELLOW";
							// 비밀번호 체크 결과를 적합(true) 으로 표시
							checkPasswdResult = true;
							break;
						case 2 : 
							msg = "위험";
							color = "ORANGE";
							// 비밀번호 체크 결과를 적합(true) 으로 표시
							checkPasswdResult = true;
							break;
						case 1 : 
							msg = "사용 불가";
							color = "RED";
							// 비밀번호 체크 결과를 부적합(false) 으로 표시
							checkPasswdResult = false;
					}
				} else { // 일치하지 않을 경우
					msg = "영문자, 숫자, 특수문자(!@#$%) 8~16 필수!";
					color = "RED";
					checkPasswdResult = false;
				}
				
				$("#checkPasswdResult").text(msg).css("color", color);
				// 비밀번호가 변경되면 비밀번호확인 작업을 다시 수행해야하는데
				// 비밀번호 확인 작업 코드를 중복으로 기술하는것은 비효율적이며
				// 비밀번호확인을 수행하는 함수를 호출해야하지만 익명함수이므로 호출도 불가능하다!
				// 따라서, 익명함수를 호출하는 대신 비밀번호확인 항목에 대한 이벤트를 강제로 발생시켜야 함
				// 이벤트 트리거(trigger)를 활용하여 특정 요소에 대한 이벤트 발생을 강제로 제어 가능
				// => $(선택자).trigger("이벤트명")
				$("#passwd2").trigger("blur");
			});
			// ================================
			// 비밀번호확인 입력란 blur 이벤트 핸들링
			$("#passwd2").blur(function() {
				// 비밀번호, 비밀번호확인 값 가져와서 저장
				let passwd = $("#passwd").val();
				let passwd2 = $("#passwd2").val();
				
				if(passwd == passwd2) {
					$("#checkPasswd2Result").text("비밀번호 일치").css("color", "BLUE");
					// 두 비밀번호 비교 결과를 적합(true) 으로 표시
					checkPasswd2Result = true;
				} else {
					$("#checkPasswd2Result").text("비밀번호 불일치").css("color", "RED");
					// 두 비밀번호 비교 결과를 부적합(false) 으로 표시
					checkPasswd2Result = false;
				}
				
			});
			
		});
		
		$("form").on("submit", function() {
			// 비밀번호 입력값 체크 결과값이 부적합(false) 일 경우
			// "비밀번호를 확인하세요!" alert() 함수 호출 후 비밀번호 입력란에 포커스 요청
			// 또한, 비밀번호 확인 체크 결과값도 부적합일 경우 동일한 작업 수행
			if(!checkPasswdResult) {
				alert("비밀번호를 확인하세요!");
				$("#passwd").focus();
				// submit 동작 취소를 위해 submit 이벤트 핸들러에서 false 값 리턴
				return false;
			} else if(!checkPasswd2Result) {
				alert("비밀번호 확인란을 확인하세요!");
				$("#passwd2").focus();
				// submit 동작 취소를 위해 submit 이벤트 핸들러에서 false 값 리턴
				return false;
			}
		});
			
	</script>
</body>
</html>
