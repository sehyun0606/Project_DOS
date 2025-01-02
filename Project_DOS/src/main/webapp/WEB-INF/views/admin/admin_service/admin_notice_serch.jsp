<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>공지사항 관리</title>
   	<link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/side.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container2 {
            width: 70%;
            margin: 0 auto;
            margin-top: 30px;
            text-align: center;
        }

        h1 {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
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

        .search-bar {
            display: inline-flex;
            justify-content: center;
            margin-bottom: 20px;
            gap: 10px;
            width: 90%;
        }

        .search-bar select, .search-bar input[type="text"] {
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .search-bar button {
            padding: 8px 16px;
            background-color: #000;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .search-bar button:hover {
            background-color: #333;
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

        .create-button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #000;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .create-button:hover {
            background-color: #333;
        }

        .pagination {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .pagination a {
            text-decoration: none;
            color: #000;
            padding: 5px 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .pagination a:hover {
            background-color: #f4f4f4;
        }
        #side-menu{
        	width: 200px;
        }
        .main{
        	display: flex;
        }
    </style>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>
	<div class="main">
		<div id="side-menu">
			<jsp:include page="/WEB-INF/views/inc/admin_service_side.jsp"></jsp:include>
		</div>
		
	    <div class="container2">
	        <h1>공지사항 관리</h1>
	
	        <!-- 검색 바 -->
	        <form class="search-bar" action="AdminNoticeSerch" method="get">
	            <select name="searchType">
	                <option value="name">name</option>
	                <option value="date">date</option>
	            </select>
	            <input type="text" name="searchQuery" placeholder="검색어를 입력하세요" style="width : 50%;">
	            <button type="submit">검색</button>
	            <button type="button" onclick="location.href='AdminNotice'">전체목록보기</button>
	        </form>
	        <!-- 공지사항 테이블 -->
	        <table>
	            <thead>
	                <tr>
	                    <th>제목</th>
	                    <th width="150px">작성일</th>
	                    <th width="100px">조회수</th>
	                    <th width="200px">관리</th>
	                </tr>
	            </thead>
	            
	            <c:choose>
	            	<c:when test="${empty noticeList}">
	            		<tr><td colspan="5">개시물이 존재하지 않습니다.</td></tr>
	            	</c:when>
	            	<c:otherwise>
	            		<c:forEach var="notice" items="${noticeList}" varStatus="status">
	            			<tr>
			                    <td class="board_title">${notice.board_title}</td>
			                    <td><fmt:formatDate value="${notice.board_date}" pattern="yyyy-MM-dd"/>
								</td>
			                    <td>${notice.board_readcount} </td>
			                    <td class="action-buttons">
			                    	<p class="board_num" style="display : none;">${notice.board_num}</p>
			                        <button class="edit">수정하기</button>
			                        <button class="delete">삭제하기</button>
			                    </td>
			                </tr>
	            		
	            		</c:forEach>
	            	
	            	</c:otherwise>
	            </c:choose>
	            
	                
	               
	                
	        </table>
	
	       
	
	        
	
	</div>
	<script type="text/javascript">
		$(".edit").on("click",function(event){
			let board_num = $(event.target).siblings(".board_num").text();
			location.href = "AdminNoticeEdit?board_num=" + board_num + "&pageNum=${pageInfo.pageNum}";
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
