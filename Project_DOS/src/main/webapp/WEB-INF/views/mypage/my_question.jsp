<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Question</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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

        .main {
            display: flex;
            flex: 1;
        }

        .content {
            flex: 1;
            padding: 20px;
        }

        h2 {
            font-size: 24px;
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
        <!-- 메인 콘텐츠 -->
        <div class="content">
            <h2>My Question</h2>
             <h5 style="margin-top : 50px;">전체 문의사항</h5>
	        <table>
	            <thead>
	                <tr>
	                    <th>제목</th>
	                    <th width="100px">작성자</th>
	                    <th width="150px">작성일</th>
	                    <th width="100px">조회수</th>
	                    <th width="200px">관리</th>
	                </tr>
	            </thead>
	            
	            <c:choose>
	            	<c:when test="${empty questionList}">
	            		<tr><td colspan="5">개시물이 존재하지 않습니다.</td></tr>
	            	</c:when>
	            	<c:otherwise>
	            		<c:forEach var="question" items="${questionList}" varStatus="status">
	            			<tr>
			                    <td class="board_title">
			                    	[${question.qna_type}]${question.qna_title}
			                    </td>
			                    <td class="qna_num" style="display: none;">
			                    	${question.qna_num}
			                    </td>
			                    <td>${question.member_id} </td>
			                    <td><fmt:formatDate value="${question.qna_date}" pattern="yyyy-MM-dd"/>
								</td>
			                    <td>${question.qna_readcount} </td>
			                    <td class="action-buttons">
			                    	<p class="qna_num" style="display : none;">${question.qna_num}</p>
			                    	<c:if test="${question.request_status == 'N'}">
				                        <button class="edit">수정하기</button>
				                        <button class="delete">삭제하기</button>
			                    	</c:if>
			                    </td>
			                </tr>
	            		
	            		</c:forEach>
	            	
	            	</c:otherwise>
	            </c:choose>
	            
	                
	               
	                
	        </table>
            <div class="pagination">
	        	<input type="button" value="이전"
	        		onclick="location.href='MyQuestion?pageNum=${pageInfo.pageNum - 1}'"
	        		<c:if test="${pageInfo.pageNum eq 1}">disabled</c:if>>
		        <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
		        	<c:choose>
		        		<c:when test="${i eq pageInfo.pageNum}">
		        			<strong>${i}</strong>
		        		</c:when>
		        		<c:otherwise>
		        			<a href="MyQuestion?pageNum=${i}">${i}</a>
		        		</c:otherwise>
		        	</c:choose>
		        </c:forEach>
		        <input type="button" value="다음"
		        onclick="location.href='MyQuestion?pageNum=${pageInfo.pageNum+1}'"
		        <c:if test="${pageInfo.pageNum eq pageInfo.maxPage}">disabled</c:if>>
	        </div>
        </div>
    </div>
<script type="text/javascript">
	$(".delete").on("click",function(event){
		let message = confirm("삭제하시겠습니까?");
		if(message){
			let qna_num = $(event.target).siblings(".qna_num").text();
			location.href = "AdminQuestionDelete?qna_num=" + qna_num;
		}
	})
	$(".edit").on("click",function(event){
			let qna_num = $(event.target).siblings(".qna_num").text();
			location.href = "MyQuestionEdit?qna_num=" + qna_num + "&pageNum=${pageInfo.pageNum}";
		})
	$(".board_title").on("click",function(event){
		let qna_num = $(event.target).siblings(".qna_num").text();
		location.href = "QnaDetail?qna_num=" + qna_num
	})
</script>
</body>
</html>
