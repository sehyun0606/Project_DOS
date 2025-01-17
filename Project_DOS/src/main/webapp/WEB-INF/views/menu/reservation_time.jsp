<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
 <!-- 입력 폼 -->
        <div class="input-group">
        	<h1>가능 시간 선택</h1>
            <select id="time-select" name="reservation_time" >
	            <c:forEach var="time" items="${timeList}">
	            	<option value="${time}">${time}</option>
	            </c:forEach>
   			 </select>
   			 <input type="hidden" value="${table}" name="table_num">
        </div>
      
