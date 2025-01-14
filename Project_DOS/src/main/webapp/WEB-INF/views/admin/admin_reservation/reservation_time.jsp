<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
     
	<c:forEach var="reservation" items="${reservationList}">
		<div class="reservation-item">
		 <span>${reservation.reservation_time}</span>
		 <span>${reservation.member_id}</span>
		 <span>${reservation.member_phone}</span>
			<form action="ReservationEdit" method="get">
				<input type="hidden" name="reservation_date" value="${param.year}-${param.month}-${param.date}">
				<input type="hidden" name="reservation_time" value="${reservation.reservation_time}">
				<input type="hidden" name="member_id" value="${reservation.member_id}">
				<input type="hidden" name="table_num" value="${param.table}">
				<button type="submit" class="edit-button">예약 편집</button>
				
			</form>
			<form action="ReservationDelete" method="get">
				<input type="hidden" name="reservation_date" value="${param.year}-${param.month}-${param.date}">
				<input type="hidden" name="reservation_time" value="${reservation.reservation_time}">
				<input type="hidden" name="member_id" value="${reservation.member_id}">
				<input type="hidden" name="reservation_idx" value="${reservation.reservation_idx}">
				<input type="hidden" name="table_num" value="${param.table}">
				<button class="cancel-button" type="submit">예약 취소</button>
			</form>
		</div>
	</c:forEach>
