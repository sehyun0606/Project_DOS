<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>고객 관리</title>
   	<link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container2 {
            width: 80%;
            margin: 0 auto;
            text-align: center;
            margin-top: 30px;
        }

        h1 {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .search-filter {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .search-filter select, .search-filter input {
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        .membership-icon {
            font-size: 24px;
        }

        .button-group {
            margin-top: 20px;
            text-align: right;
        }

        .button-group button {
            padding: 10px 20px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f4f4f4;
            cursor: pointer;
        }

        .button-group button:hover {
            background-color: #ddd;
        }
    </style>
</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <div class="container2">
        <h1>고객 관리</h1>
        <hr>

        <!-- 검색 필터 -->
        <div class="search-filter">
            <label for="filter">검색 필터</label>
            <select id="filter" name="filter">
                <option value="id">ID</option>
                <option value="name">이름</option>
                <option value="birthdate">생년월일</option>
            </select>
            <input type="text" id="searchInput" name="searchInput" placeholder="검색어 입력">
        </div>

        <!-- 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>이름</th>
                    <th>ID</th>
                    <th>생년월일</th>
                    <th>멤버십</th>
                    <th>기능</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="member" items="${userList}" varStatus="status">
           			<tr>
	                    <td class="board_title">${member.member_name}</td>
	                    <td>${member.member_id} </td>
	                    <td>${member.member_birth}
						</td>
	                    <td>${member.membership} </td>
	                    <td class="action-buttons">
	                    	<p class="member_id" style="display : none;">${member.member_id}</p>
	                        <button class="edit" >수정하기</button>
	                        <button class="delete">삭제하기</button>
	                    </td>
	                </tr>
           		</c:forEach>
            </tbody>
        </table>

        <div class="pagination" style="margin-left: 50%;">
	        	<input type="button" value="이전"
	        		onclick="location.href='AdminUser?pageNum=${pageInfo.pageNum - 1}'"
	        		<c:if test="${pageInfo.pageNum eq 1}">disabled</c:if>>
		        <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
		        	<c:choose>
		        		<c:when test="${i eq pageInfo.pageNum}">
		        			<strong>${i}</strong>
		        		</c:when>
		        		<c:otherwise>
		        			<a href="AdminUser?pageNum=${i}">${i}</a>
		        		</c:otherwise>
		        	</c:choose>
		        </c:forEach>
		        <input type="button" value="다음"
		        onclick="location.href='AdminUser?pageNum=${pageInfo.pageNum+1}'"
		        <c:if test="${pageInfo.pageNum eq pageInfo.maxPage}">disabled</c:if>>
	        </div>
    </div>
    <script type="text/javascript">
		$(".edit").on("click",function(event){
			let member_id = $(event.target).siblings(".member_id").text();
			location.href = "MemberModify?memberId=" + member_id;
		})
		$(".delete").on("click",function(event){
			let message = confirm("삭제하시겠습니까?");
			if(message){
				let board_num = $(event.target).siblings(".board_num").text();
				location.href = "AdminNoticeDelete?board_num=" + board_num;
			}
		})
    </script>
</body>
</html>
