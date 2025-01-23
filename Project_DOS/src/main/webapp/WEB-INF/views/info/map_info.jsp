<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	.container2 {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        align-items: center; /* 수직 중앙 정렬 */
        }
	.info {
	    width: 48%; /* 두 개의 열을 나누기 위해 48%로 설정 */
	    margin-bottom: 20px;
	    align-items: center;
	   	align-texts: center;
	   	justify-content: center;
	}
	.map-container {
	    width: 48%; /* 두 개의 열을 나누기 위해 48%로 설정 */
	    height: 300px;
	    background-color: #e9ecef;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	.map-container img {
	    max-width: 100%;
	    max-height: 100%;
	}
</style>
</head>
<body>
	<nav>
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </nav>
	<div class="container2">
	    <div class="info">
	        <h2>위치안내</h2>
	        <h4>주소</h4>
	        <p>XXX</p>
	        <h4>이용시간</h4>
	        <p>월~금 10:00 ~ 17:00 (토/일, 공휴일 휴무, 점심시간 : 12:00~13:00)</p>
	        <h4>오시는 길</h4>
	        <p>부산 서면역 8번 출구 전포초등학교 방향으로 직진(도보 10분)</p>
	        <h4>버스 및 지하철 노선</h4>
	        <p>지하철 : 부산 서면역 8번 출구</p>
	        <p>버스 : 68, 108, 121, 108, 33, 31 마을버스(동구2)</p>
	    </div>
	    <div class="map-container">
	        <h4>지도</h4>
	        <img src="path/to/your/map/image.jpg" alt="지도" />
	    </div>
	</div>

</body>
</html>