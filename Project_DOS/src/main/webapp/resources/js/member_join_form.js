function checkId() {
	// 입력받은 아이디 가져오기
	let id = $("#id").val();
	console.log("id : " + id + ", " + id.length);
	
	/*
	[ 자바스크립트에서 정규표현식 활용 방법 ]
	1. 정규표현식 패턴 문자열을 갖는 객체 생성
	   1) let 변수명 = new RegExp("패턴문자열");
	   2) let 변수명 = /패턴문자열/;
	2. 변수명.exec("검사할 문자열") 형태로 유효성 검사
	   => 검사 결과를 판별하여 적합할 경우 대상 문자열 리턴, 부적합할 경우 null 리턴
          (null 값이 리턴됐을 경우 패턴이 일치하지 않는 문자열이라는 의미) 
	   => 자바스크립트의 if문에 boolean 타입이 아닌 다른 타입의 값이 전달될 경우
	      값이 존재하기만 하면 무조건 true 가 리턴되고, null 또는 널스트링 이면 false 로 취급됨
	*/
	// ------------------------------------------------------------------------
	// 아이디 입력값 검증
	// 규칙 : 영문자 또는 숫자만 첫글자에 올 수 있고
	//        두번째 글자부터는 영문자, 숫자, 특수문자 _ 만 사용하여 4 ~ 16글자
	let regex = /^[A-Za-z0-9][A-Za-z0-9_]{3,15}$/;
	console.log(regex + ", " + typeof(regex));
	
	// 정규표현식에 따른 유효성 검사를 위해 정규표현식 객체(regex)의 exec() 메서드 호출
	// => 파라미터 : 검사에 사용할 대상 문자열
	// => 리턴타입 : string(일치할 경우 대상 문자열, 아니면 null)
	console.log(id + " 검사결과 : " + regex.exec(id));
	
	// if 문을 사용하여 정규표현식 검사 코드를 파라미터로 전달하여
	// 패턴이 일치하는 문자열일 경우 해당 문자열 리턴되므로 true 로 취급되며
	// 패턴이 일치하지 않을 경우 null 값이 리턴되므로 false 로 취급됨
	if(regex.exec(id)) {
		$("#checkIdResult").text("사용 가능한 아이디");
		$("#checkIdResult").css("color", "blue");
	} else {
		$("#checkIdResult").text("사용 불가능한 아이디");
		$("#checkIdResult").css("color", "red");
	}
}

// ==================================================================
// 비밀번호, 비밀번호확인 입력값 체크 결과를 저장할 변수 선언
// => true : 적합, false : 부적합
//let checkPasswdResult = false;
//let checkPasswd2Result = false;

$(function() {
	// 체크 결과를 저장하는 변수를 document - ready 이벤트 내에서만 사용할 경우
	let checkPasswdResult = false;
	let checkPasswd2Result = false;
	
	// 패스워드 입력란 blur 이벤트 핸들링
	$("#passwd").on("blur", function() {
		/*
		 [ 패스워드 입력값 검증 ]
		 1) 패스워드 조합 및 길이 규칙 : 영문자, 숫자, 특수문자(!@#$%) 8 ~ 16글자
		 2) 패스워드 복잡도(안전도) 규칙
		    => 영문자 대문자, 소문자, 숫자, 특수문자 중 최소 2가지 이상 조합 필수!
		    => 4가지 조합 : 안전(초록색)
		    => 3가지 조합 : 보통(노란색)
		    => 2가지 조합 : 위험(주황색)
		    => 1가지      : 사용불가(빨간색)
		*/
		let passwd = $("#passwd").val();
		console.log("passwd : " + passwd);
		
		let msg; // 판별 결과로 출력할 메세지
		let color; // 판별 결과로 출력할 메세지의 색상명
		
		// 패스워드 조합 및 길이 규칙 : 영문자, 숫자, 특수문자(!@#$%) 8 ~ 16글자
		let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
		if(lengthRegex.exec(passwd)) { // 패스워드 패턴이 첫번째 정규표현식(lengthRegex)과 일치할 경우
			// 조합 및 길이 규칙을 통과한 패스워드를 대상으로
			// 패스워드 복잡도 검사를 위해 각각의 규칙을 별도로 체크하여
			// 해당 요소가 포함되어 있을 경우 카운트 변수값을 1 증가시켜
			// 해당 요소가 포함된 갯수를 최종적으로 판별하면 복잡도 검사 가능
			// => 주의! 부분 요소 검사를 위해서는 시작(^)과 끝($) 기호를 패턴에서 제거해야함
			let count = 0; // 카운트 변수 선언
			
			// 1) 영문자 대문자 판별 정규표현식 패턴
			let engUpperRegex = /[A-Z]/;
			// 2) 영문자 소문자 판별 정규표현식 패턴
			let engLowerRegex = /[a-z]/;
			// 3) 숫자 판별 정규표현식 패턴
//			let numRegex = /[0-9]/;
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
//			$("#checkPasswdResult").text("");
//			$("#checkPasswdResult").css("color", "red");
			msg = "영문자, 숫자, 특수문자(!@#$%) 8~16 필수!";
			color = "RED";
			// 비밀번호 체크 결과를 부적합(false) 으로 표시
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
	
	// ================================================================
	// 회원가입 폼의 submit 이벤트 핸들링
	// => required 속성이 걸린 입력요소 체크 후 submit 이벤트 동작
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
		
		// ---------------------------------------------------------------------------------
		// 이메일 주소(email1, email2)를 하나로 결합하여 form 태그 내에 hidden 속성으로 추가
		// => hidden 속성을 활용하여 전송할 email 파라미터를 설정
		// => 이 때, value 속성값은 email1 과 email2 를 결합한 값으로 설정(email1 + "@" + email2)
		let email = $("#email1").val() + "@" + $("#email2").val();
		// 기존 email 입력 항목이 있을 경우를 대비해 해당 항목 제거
		$("input[name=email]").remove();
		$("form").prepend('<input type="hidden" name="email" value="' + email + '">');
		// ---------------------------------------------------------------------------------
		
		// true 값을 리턴하거나 생략 시 submit 동작 수행됨
//		return true;
	});
	
});
























