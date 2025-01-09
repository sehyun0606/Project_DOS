<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
     <!-- 서버에서 전달된 시간 리스트 -->
	<c:set var="timeList" value="${'12:00,2:00,4:00,6:00,8:00'}" />
	<c:forEach var="time" items="${timeList}">
		<div class="reservation-item">
		 <span	>${time} 예약자 이름</span>
			<div>
				<button class="edit-button" onclick="location.href='ReservationEdit'">편집</button>
				<button class="cancel-button">예약 취소</button>
			</div>
		</div>
	</c:forEach>
