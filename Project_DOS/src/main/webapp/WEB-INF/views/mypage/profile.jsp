<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 페이지</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/side.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }

        /* 메인 레이아웃 설정 */
        .main {
            display: flex;
            margin-top: 60px; /* 상단 메뉴 높이 */
            flex: 1;
        }

        .content {
            flex: 1;
            padding: 20px;
            margin-left: 10%;
        }

        .profile-container {
            display: flex;
            align-items: flex-start;
            justify-content: center;
            margin: 50px 0;
        }

        .profile-image {
            width: 150px;
            height: 150px;
            background-color: #e0e0e0;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: #888;
        }

        .profile-details {
            margin-left: 30px;
            flex: 1;
        }

        .profile-details h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .profile-details ul {
            list-style: none;
            padding: 0;
        }

        .profile-details ul li {
            margin-bottom: 10px;
            font-size: 16px;
        }

        .membership {
            text-align: center;
            margin-top: 20px;
        }

        .membership button {
            background-color: black;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-container {
            margin-top: 20px;
            text-align: center;
        }

        .form-container input[type="text"] {
            padding: 10px;
            width: 70%;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-container input[type="submit"] {
            padding: 10px 20px;
            border: none;
            background-color: black;
            color: white;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
        }

        .reservation {
            margin-top: 20px;
            width: 70%;
        }

        .reservation textarea {
            width: 100%;
            height: 100px;
            resize: none;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .actions {
            display: flex;
            justify-content: end;
            margin-top: 30px;
            width: 50%;
        }

        .actions button {
            margin: 0 10px;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid black;
            background: white;
            cursor: pointer;
        }

        .actions button:hover {
            background: black;
            color: white;
        }
        .gifticon-input {
		    width: 50%; /* 입력창의 너비를 절반으로 설정 */
		    padding: 5px; /* 여백 조정 */
		    font-size: 14px;
		    border: 1px solid #ddd;
		    border-radius: 5px;
		}
        .gift-form{
        	width: 50%;
        	margin-left: 12%;
        }
        .action-buttons {
            gap: 5px;
            width : 20%;
        }

        .action-buttons button {
            padding: 5px 10px;
            font-size: 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .action-buttons .edit {
            background-color: #888;
            color: white;
        }

        .action-buttons .delete {
            background-color: #555;
            color: white;
        }

        .action-buttons .edit:hover {
            background-color: #666;
        }

        .action-buttons .delete:hover {
            background-color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f4f4f4;
            font-weight: bold;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </header>
    <div class="main">
        <!-- 사이드 메뉴 -->
        <div id="side-menu">
            <jsp:include page="/WEB-INF/views/inc/side.jsp"></jsp:include>
        </div>
        <!-- 메인 컨텐츠 -->
        <div class="content">
            <div class="profile-container">
                <div class="profile-image">Image</div>
                <div class="profile-details">
                    <h2>${member.member_name}</h2>
                    <c:set var="formattedPhoneNumber" value="${member.member_phone.substring(0, 3)}-${member.member_phone.substring(3, 7)}-${member.member_phone.substring(7)}" />
                    <input type="text" name="member_id" value=${member.member_id } hidden>
                    <ul>
                        <li>아이디: ${member.member_id}</li>
                        <li>생년월일: ${member.member_birth}</li>
                        <li>이메일: ${member.member_email}</li>
                        <li>전화번호: ${formattedPhoneNumber}</li>
                    </ul>
                    	<c:choose>
							<c:when test="${member.membership eq 'white'}">
	        	            	멤버쉽:&nbsp;&nbsp;&nbsp;<img alt="membership" src="${pageContext.request.contextPath}/resources/images/whiteSun.png">
							</c:when>                    	
							<c:when test="${member.membership eq 'red'}">
	    	                	멤버쉽:&nbsp;&nbsp;&nbsp;<img alt="membership" src="${pageContext.request.contextPath}/resources/images/redSun.png">
							</c:when>                    	
							<c:when test="${member.membership eq 'black'}">
		                    	멤버쉽:&nbsp;&nbsp;&nbsp;<img alt="membership" src="${pageContext.request.contextPath}/resources/images/blackSun.png">
							</c:when>                    	
							<c:otherwise>
		                        <button onclick="location.href='MemberShip'">멤버쉽 가입하기</button>
							</c:otherwise>
                    	</c:choose>
                    <div class="membership">
                    </div>
                    <div class="form-container">
                         <form class="gift-form">
					        <input type="text" placeholder="기프티콘 번호를 입력하시오" class="gifticon-input">
					        <input type="submit" value="등록">
					    </form>
                    </div>
                </div>
            </div>
            <div class="reservation">
                <h3>예약</h3>
                 
                <table>
		            <thead>
		                <tr>
		                    <th>예약일</th>
		                    <th width="150px">예약 시간</th>
		                    <th width="100px">예약 테이블</th>
		                    <th width="200px">인원</th>
		                    <th>기능</th>
		                </tr>
		            </thead>
	            <c:choose>
	            	<c:when test="${empty reservationList}">
	            		<tr><td colspan="5">예약이 존재하지 않습니다.</td></tr>
	            	</c:when>
	            	<c:otherwise>
	            		<c:forEach var="reservation" items="${reservationList}" varStatus="status">
	            			<tr>
			                    <td id="${reservation.reservation_idx}"><fmt:formatDate value="${reservation.reservation_date}" pattern="yyyy-MM-dd"/>
								</td>
								<c:choose>
									<c:when test="${reservation.reservation_time eq '10:00'}">
					                    <td >오전${reservation.reservation_time}</td>
									</c:when>
									<c:otherwise>
					                    <td >오후${reservation.reservation_time}</td>
									</c:otherwise>
								</c:choose>
			                    <td>${reservation.table_num}번 테이블 </td>
			                    <td>${reservation.people_count} 명</td>
			                    <td class="action-buttons" >
			                    	<p class="reservation_num" style="display : none;">${reservation.reservation_idx}</p>
			                        <button class="edit">수정하기</button>
			                        <button class="delete">취소하기</button>
			                    </td>
			                </tr>
	            		</c:forEach>
            		</c:otherwise>
            </c:choose>
           </table>
            </div>
            <div class="actions">
                <button onclick="location.href='MemberModify?member_id=${member.member_id}'">정보 수정</button>
                <button onclick="location.href='MemberLogout'">LogOut</button>
                <button onclick="location.href='MemberWithdraw'">회원 탈퇴</button>
            </div>
        </div>
    </div>
<script type="text/javascript">
	$(function(){
		const today = new Date();
		const minDate = today.toISOString().split('T')[0];
		
		const date = new Date();
		
		date.setDate(date.getDate()+3);
		const maxDate = date.toISOString().split('T')[0];
		
		
		
		
		$('.edit').click(function() {
			let idx = '#' + $(event.target).siblings(".reservation_num").text();
		    
			let reservDate = $(idx).text();
			
			if(minDate <= reservDate && reservDate < maxDate){
				alert("예약 수정은 3일 이내의 기간에만 가능합니다")
				console.log(minDate)
				console.log(reservDate)
				console.log(maxDate)
			}else{
				const popupURL = 'MyReservationEdit?reservation_idx='+ $(event.target).siblings(".reservation_num").text();

	        	window.open(popupURL, '_blank', 'width=550,height=800');
			}
		});
		
	})

</script>
</body>
</html>
