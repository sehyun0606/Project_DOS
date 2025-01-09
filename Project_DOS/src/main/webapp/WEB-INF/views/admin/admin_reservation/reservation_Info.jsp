<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 상세</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .main-container {
            width: 80%;
            margin: 0 auto;
        }

        .date-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .date-header h1 {
            font-size: 2rem;
            margin: 0;
        }

        .date-header p {
            font-size: 1.2rem;
            margin: 5px 0;
        }

        .box-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            justify-content: center;
            margin: 20px 0;
        }

        .box {
            width: 100px;
            height: 100px;
            background-color: #d3d3d3;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.5rem;
            font-weight: bold;
            color: black;
            border: 1px solid #ccc;
        }

        #reservation-list {
            margin-top: 30px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
        }

        .reservation-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .reservation-item button {
            padding: 5px 10px;
            margin-left: 10px;
            font-size: 0.9rem;
            cursor: pointer;
        }

        .edit-button {
            background-color: #4CAF50;
            color: white;
            border: none;
        }

        .cancel-button {
            background-color: #f44336;
            color: white;
            border: none;
        }
        .selected {
	        background-color: #007bff; /* 선택된 상태 배경색 */
	        color: white;             /* 선택된 상태 글자색 */
	        border: 2px solid #0056b3;
   		 }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <div class="main-container">
        <div class="date-header">
            <h1>${param.month}월 ${param.date}일</h1>
            <p>예약한 팀 : 0</p>
        </div>

        <div class="box-container">
            <c:forEach var="i" begin="1" end="9">
                <div class="box" id="${i}">${i}</div>
            </c:forEach>
        </div>

        <div id="reservation-list">
            
        </div>
    </div>
<script type="text/javascript">
	$(function(){
		$(".box").click(function(){
			
			// 기존에 선택된 클래스 제거
            $(".box").removeClass("selected");

            // 현재 클릭된 요소에 클래스 추가
            $(this).addClass("selected");
            
         	// 선택된 box의 id 값을 가져오기
            const selectedID = $(this).attr("id"); // 클릭된 박스의 id 가져오기

			$.ajax({
				type : "GET",
				url : "ReservationTime",
				data :{
					month : ${param.month},
					date : ${param.date},
					table : selectedID
				},
				success : function(response){
					$("#reservation-list").html(response);
				},
				error : function() {
					$("#reservation-list").html(selectedID)
				}
			})
		})
	})
	
</script>
</body>
</html>
