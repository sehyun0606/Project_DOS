<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>날짜 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .main-container {
            width: 80%;
            margin: 0 auto;
            text-align: center;
        }

        h1, h2 {
            margin: 10px 0;
        }

        .date-picker {
            margin: 20px 0;
        }

        .box-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            justify-content: center;
            margin: 20px auto;
            width: 300px;
        }

        .box {
            width: 80px;
            height: 80px;
            background-color: #d3d3d3;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.5rem;
            font-weight: bold;
            color: black;
            cursor: pointer;
            border: 1px solid #ccc;
            transition: background-color 0.3s;
        }

        .box:hover {
            background-color: #b0b0b0;
        }

        .input-group {
            margin: 15px 0;
        }

        input[type="text"], input[type="password"] {
            width: 200px;
            padding: 8px;
            margin: 10px 0;
            font-size: 1rem;
        }

        .button-group button {
            padding: 10px 20px;
            font-size: 1rem;
            margin: 10px 5px;
            cursor: pointer;
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
    	<form action="ReservationEdit" method="post">
			<h1>${reservation.member_id}</h1>
	        <h2>날짜 수정</h2>
			<input type="hidden" id="idx" value="${reservation.reservation_idx}" name="reservation_idx">
	        <!-- 날짜 선택 -->
	        <div class="date-picker">
	            <label for="date">Date</label>
	            <input type="date" id="date" name="reservation_date" value="${reservation.reservation_date}" >
	        </div>
			<!-- 네모 박스 -->
	        <div class="box-container">
	            <c:forEach var="i" begin="1" end="9">
	            	<c:if test="${reservation.table_num == i}">
			            <div id="${i}" class="box selected">${i}</div>
			        </c:if>
			        <c:if test="${reservation.table_num != i}">
			            <div id="${i}" class="box">${i}</div>
			        </c:if>
	            </c:forEach>
	        </div>
	          <div  class="input-group">
			        <label>인원 선택:</label>
			            <div>
						    <label>
						        <input type="checkbox" name="people_count" value="1"
						               <c:if test="${reservation.people_count eq '1'}">checked</c:if>> 1인
						    </label>
						    <label>
						        <input type="checkbox" name="people_count" value="2"
						               <c:if test="${reservation.people_count eq '2'}">checked</c:if>> 2인
						    </label>
						    <label>
						        <input type="checkbox" name="people_count" value="3"
						               <c:if test="${reservation.people_count eq '3'}">checked</c:if>> 3인
						    </label>
						    <label>
						        <input type="checkbox" name="people_count" value="4"
						               <c:if test="${reservation.people_count eq '4'}">checked</c:if>> 4인
						    </label>
						    <label>
						        <input type="checkbox" name="people_count" value="5~8"
						               <c:if test="${reservation.people_count eq '5~8'}">checked</c:if>> 5인~8인
						    </label>
						</div>
			        
		    </div>
			<div id="result">
			
			</div>
			<!-- 버튼 -->
		    <div class="button-group">
		       <button type="submit">편집</button>
		    </div>

    	</form>
        
    </div>
   <script type="text/javascript">
  	 const reservationIdx = $("#idx").val();
	   $("#date").change(function() {
	       var selectedDate = $(this).val(); // 선택된 날짜 가져오기
	       window.location.href = "MyReservationTableEdit?reservation_date=" + selectedDate +"&reservation_idx=" + reservationIdx;
	   });
	   const reservationDate = `${reservation.reservation_date}`
	   
	   		//기존 시간 선택되어있음
	    	$("#time-select").val($("#time").text());
	    	
	    	//오늘 날짜
	    	const today = new Date().toISOString().split("T")[0];
	    	
	    	 $("#date").attr("min", today);
	    	
	    	$(function () {
	    		
	    		const table_num = $(".selected").text()
	    		
	    		 
                if(table_num == 1 || table_num == 2){
                	$("input[name='people_count']").prop("disabled", true);
                	$("input[name='people_count'][value='5~8']").prop("disabled", false);
                }else{
                	$("input[name='people_count']").prop("disabled", false);
                	$("input[name='people_count'][value='5~8']").prop("disabled", true);
                }
	    		 $.ajax({
						type : "GET",
						url : "ReservationTimeEdit",
						data :{
							date : reservationDate,
							table : table_num
						},
						success : function(response){
							$("#result").html(response);
						},
						error : function() {
							$("#result").html(reservationDate)
						}
					});
	    		$(".box").click(function(){
	    			
	    			$("input[name='people_count']").prop("checked", false);
	    			
	    			// 기존에 선택된 클래스 제거
	                $(".box").removeClass("selected");

	                // 현재 클릭된 요소에 클래스 추가
	                $(this).addClass("selected");
	                
	             	// 선택된 box의 id 값을 가져오기
	                const selectedID = $(this).attr("id"); // 클릭된 박스의 id 가져오기
	                
	                if(selectedID == 1 || selectedID == 2){
	                	alert("5~8인만 앉을 수 있습니다")
	                	$("input[name='people_count']").prop("disabled", true).prop("checked", false);
	                	$("input[name='people_count'][value='5~8']").prop("disabled", false);
	                }else{
	                	$("input[name='people_count']").prop("disabled", false);
	                	$("input[name='people_count'][value='5~8']").prop("disabled", true);
	                }
	                
	                //AJAX
		             $.ajax({
						type : "GET",
						url : "ReservationTimeEdit",
						data :{
							date : reservationDate,
							table : selectedID
						},
						success : function(response){
							$("#result").html(response);
						},
						error : function() {
							$("#result").html(reservationDate)
						}
					});
	    		});
	    		$("input[name='people_count']").click(function () {
	    		     // 모든 체크박스에서 체크 해제
	    		     $("input[name='people_count']").prop("checked", false);
	    		         
	    		     // 현재 클릭된 체크박스를 다시 체크
	    		     $(this).prop("checked", true);
	    		 });
	    		
	    		
			});
   </script>
</body>
</html>
