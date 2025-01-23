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
            flex-direction: row;
            justify-content: space-between;
            align-items: flex-start;
            margin: auto;
            max-width: 1200px; /* 최대 너비 설정 */
        }
        .info {
        	width:250px;
        	margin-top: 50px;
        	margin-bottom: 50px;
            flex: auto; /* 비율에 따라 너비 조절 */
            margin-right: 20px;
            background-color: #e9ecef;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .map-container {
        	margin-top: 50px;
        	margin-bottom: 50px;
            flex: 1; /* 비율에 따라 너비 조절 */
            height: 433px;
            background-color: #e9ecef;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .map-container img {
            max-width: 100%;
            max-height: 100%;
            border-radius: 8px; /* 이미지 모서리 둥글게 */
        }
        h2, h4 {
            text-align: start; /* 제목 중앙 정렬 */
        }
        .title {
            display: flex;
            align-items: center; /* 수직 중앙 정렬 */
            margin-top: 10px; /* 위쪽 여백 추가 */
        }
        .title img {
            width: 20px; /* 아이콘 크기 조정 */
            height: 20px; /* 아이콘 크기 조정 */
            margin-right: 10px; /* 아이콘과 텍스트 간격 */
        }
        #map {
        	margin-top: 50px;
        	margin-bottom: 50px;
        }
    </style>
    <script type="text/javascript" 
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=g4ajmpgz60"></script>
</head>
<body>
	<nav>
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </nav>
	<div class="container2">
    <div class="info">
    	<div class="title">
            <img src="${pageContext.request.contextPath}/resources/images/LocationPin.png" alt="위치 아이콘" /><b>주소</b> <!-- 위치 아이콘 경로 -->
        </div>
        <p>부산진구 동천로 109</p>
        
    	<div class="title">
            <img src="${pageContext.request.contextPath}/resources/images/FastforwardClock.png" alt="위치 아이콘" /><b>이용시간</b> <!-- 위치 아이콘 경로 -->
        </div>
        <p>월요일 휴무, 매일 10:00 ~ 22:00 (점심시간 : 12:00~13:00)</p>
        
    	<div class="title">
            <img src="${pageContext.request.contextPath}/resources/images/StreetSign.png" alt="위치 아이콘" /><b>오시는 길</b> <!-- 위치 아이콘 경로 -->
        </div>
        <p>부산 서면역 8번 출구 전포초등학교 방향으로 직진(도보 10분)</p>
        
    	<div class="title">
            <img src="${pageContext.request.contextPath}/resources/images/Bus.png" alt="위치 아이콘" /><b>버스 및 지하철 노선</b> <!-- 위치 아이콘 경로 -->
        </div>
        <p>지하철 : 부산 서면역 8번 출구
        <br>버스 : 68, 108, 121, 108, 33, 31 마을버스(동구2)</p>
    </div>
        <div id="map" style="width:50%; height:331px;"></div>
	</div>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
	</footer>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fd22db90a9e424f26a5fd19cf8eefbd3"></script>
	<script>

        var map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(35.1584, 129.0620), // 잠실 롯데월드를 중심으로 하는 지도
            zoom: 15
        });

        var marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(35.1584, 129.0620),
            map: map
        });

    </script>
</body>
</html>