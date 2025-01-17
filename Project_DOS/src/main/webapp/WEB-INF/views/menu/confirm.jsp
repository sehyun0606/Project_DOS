<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- 한글 문서 설정 및 문자 인코딩 설정 -->
    <meta charset="UTF-8">
    <!-- 모바일 및 다양한 화면 크기 대응을 위한 뷰포트 설정 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 웹페이지 제목 설정 -->
    <title>예약 완료</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: Arial, sans-serif; /* 글꼴 설정 */
     		margin: 0; /* 외부 여백 제거 */
   			padding: 0; /* 내부 여백 제거 */
   			box-sizing: border-box; /* 박스 크기 설정 */
            height: 100vh; /* 화면 높이 100% 설정 */
            background-color: #fff; /* 배경색 흰색 설정 */
        }
        
        /* 헤더 제목 스타일 설정 */
        .header-link {
            font-size: 30px; /* 글자 크기 설정 */
            margin-bottom: 20px; /* 아래 여백 추가 */
            color: black; /* 글자색 검정 설정 */
        }
        /* 정보 표시 영역 스타일 설정 */
        .info-text {
            width: 93%; /* 너비 설정 */
            padding: 10px; /* 내부 여백 추가 */
            font-size: 16px; /* 글꼴 크기 설정 */
            margin-bottom: 10px; /* 아래 여백 설정 */
            background-color: #e0e0e0; /* 배경색 회색 설정 */
            border: 1px solid #ccc; /* 테두리 색상 설정 */
        }
        /* 예약 완료 페이지 전용 컨테이너 */
		.reservation-container {
		    width: 450px; /* 예약 완료 페이지의 고정 너비 */
		    padding: 20px; /* 내부 여백 설정 */
		    box-sizing: border-box; /* 크기 계산 포함 */
		    margin: 0 auto; /* 중앙 정렬 */
		}
		
		/* 예약 완료 섹션 스타일 */
		.reservation-header {
		    font-size: 30px;
		    margin-bottom: 20px;
		    text-align: center;
		    color: black;
		}
		
		/* 예약 정보 스타일 */
		.reservation-info {
		    background-color: #e0e0e0;
		    padding: 15px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    margin-bottom: 20px;
		    color: #555;
		}
        /* 예약 변경 및 취소 버튼 스타일 설정 */
        .action-buttons button {
            width: 100%; /* 버튼 너비 100% 설정 */
            padding: 10px; /* 내부 여백 추가 */
            margin-bottom: 10px; /* 아래 여백 설정 */
            border: 1px solid black; /* 테두리 색상 설정 */
            background-color: gray; /* 배경색 회색 설정 */
            cursor: pointer; /* 마우스 오버 시 포인터 모양 변경 */
            color: white; /* 글자 색상 흰색 설정 */
        }
        /* 드롭다운 버튼 스타일 설정 */
        .dropdown-btn {
            width: 48%; /* 버튼 너비 설정 */
            padding: 10px; /* 내부 여백 추가 */
            font-size: 14px; /* 글꼴 크기 설정 */
            background-color: gray; /* 배경색 회색 설정 */
            border: 1px solid black; /* 테두리 색상 설정 */
            cursor: pointer; /* 마우스 오버 시 포인터 변경 */
            color: white; /* 글자 색상 흰색 설정 */
        }
        /* 드롭다운 버튼 컨테이너 스타일 설정 */
        .dropdown-container {
            display: flex; /* Flexbox 설정으로 정렬 */
            justify-content: space-between; /* 버튼 사이 균일 간격 설정 */
        }
        .mypage-btn {
            width: 60%; /* 버튼의 너비를 컨테이너의 60%로 설정 */
            padding: 12px; /* 내부 여백 설정 */
            font-size: 16px; /* 글자 크기 설정 */
            background-color: gray; /* 배경색 회색 설정 */
            border: 1px solid black; /* 테두리 검정색 설정 */
            border-radius: 20px; /* 둥근 모서리 처리 */
            cursor: pointer; /* 마우스 오버 시 포인터 모양 변경 */
            margin: 10px auto; /* 상하 여백 10px, 좌우 자동 중앙 정렬 */
            display: block; /* 블록 요소로 배치하여 중앙 정렬 적용 */
            color: white; /* 글자색 흰색 설정 */
        }

        /* 팝업 창 스타일 설정 */
        .popup {
            position: fixed; /* 화면 고정 위치 설정 */
            top: 50%; /* 화면 세로 중앙 위치 */
            left: 50%; /* 화면 가로 중앙 위치 */
            transform: translate(-50%, -50%); /* 중앙 정렬을 위한 이동 설정 */
            background-color: whitesmoke; /* 팝업 배경색 설정 */
            padding: 20px; /* 내부 여백 설정 */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 설정 */
            border-radius: 10px; /* 둥근 테두리 설정 */
            z-index: 1000; /* 다른 요소 위에 표시되도록 설정 */
            width: 500px; /* 팝업 너비 설정 */
            height: 400px; /* 팝업 높이 설정 */
            display: none; /* 기본 상태에서 숨김 설정 */
        }
        /* 팝업 내용 중앙 정렬 */
        .popup-content {
            text-align: center; /* 텍스트 중앙 정렬 */
        }
        /* 팝업 닫기 버튼 스타일 설정 */
        .popup .close-btn {
            position: absolute; /* 팝업 기준 절대 위치 설정 */
            top: 10px; /* 상단 여백 10px 설정 */
            right: 10px; /* 오른쪽 여백 10px 설정 */
            cursor: pointer; /* 마우스 오버 시 포인터 모양 변경 */
            font-size: 20px; /* 글자 크기 설정 */
        }
    </style>
</head>
<body>
    <!-- 컨테이너 시작 -->

    <div class="reservation-container">
        <!-- 예약 완료 제목 -->
        <p class="reservation-header">예약 완료</p>
        <!-- 예약 정보 표시 -->
        <p class="info-text">예약 정보</p>

        <!-- 예약 세부 정보 섹션 -->
          <div class="reservation-info">
            <div>
                <span>NO.${myReservation.reservation_idx}</span> <!-- 예약 번호 -->
                <span class="status">예약 완료</span> <!-- 예약 상태 -->
            </div>
            <div>
                <p>일정:${myReservation.reservation_date} ${myReservation.reservation_time}</p> <!-- 일정 정보 -->
                <p>테이블: ${myReservation.table_num}</p> <!-- 테이블 정보 -->
                <p>인원: ${myReservation.people_count}</p> <!-- 인원 정보 -->
            </div>
        </div>

        <!-- 예약 변경 및 취소 버튼 섹션 -->
        <div class="action-buttons">
            <button onclick="location.href = MyReservationEdit">예약변경</button> <!-- 예약 변경 버튼 -->
        </div>


        <!-- 마이페이지 버튼 -->
        <button class="mypage-btn" onclick="redirectToMypage()">마이페이지</button> <!-- 마이페이지 이동 버튼 -->
    </div>


    <script>
    	function redirectToMypage() {
    	    // 부모 창의 URL 변경
    	    window.opener.location.href = 'Mypage'; // 메인 페이지 URL로 변경
    	    // 팝업 창 닫기
    	    window.close();
    	}
    </script>
</body>
</html>
