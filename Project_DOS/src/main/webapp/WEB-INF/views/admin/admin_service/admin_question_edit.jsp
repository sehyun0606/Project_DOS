<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
		
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f4f4f4;
            font-weight: bold;
        }
        
        .container2 {
            width: 80%;
            margin: 30px auto;
            text-align: center;
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 10px;
        }

        h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: bold;
        }

        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
            resize: none;
        }

        .form-group textarea {
            height: 200px;
        }

        .form-group input[type="file"] {
            display: block;
            margin-top: 10px;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .action-buttons button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: #fff;
        }

        .action-buttons .back {
            background-color: #555;
        }

        .action-buttons .submit {
            background-color: #000;
        }
        .action-buttons .delete {
        	margin-left : 70%;
        	margin-right : 5%;
            background-color: #000;
        }

        .action-buttons button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <div class="container2">
        <form action="AdminQuestionEdit?qna_num=${question.qna_num}" method="post">
            <!-- 제목 입력 -->
            <div class="form-group">
            	<table>
            		<tr>
	                    <th>제목</th>
	                    <th width="100px">작성자</th>
	                    <th width="150px">작성일</th>
	                    <th width="100px">조회수</th>
	                </tr>
	                <tr>
			           <td class="board_title">[${question.qna_type}]${question.qna_title}</td>
			           <td>${question.member_id} </td>
			           <td><fmt:formatDate value="${question.qna_date}" pattern="yyyy-MM-dd"/>
					   </td>
			           <td>${question.qna_readcount} </td>
			        </tr>
            	</table>
            </div>

            <!-- 내용 입력 -->
            <div class="form-group">
                <textarea id="qna_content" readonly>${question.qna_content}</textarea>
            </div>
            
            
            <div class="form-group">
                <label for="content">답변하기</label>
                <textarea id="content" name="request_content" placeholder="답변을 입력하세요" required>${question.request_content}</textarea>
            </div>

			
            <!-- 버튼 -->
            <div class="action-buttons">
                <button type="button" class="back" onclick="location.href='AdminNotice'">뒤로가기</button>
                <button type="button" class="delete">삭제</button>
                <button type="submit" class="submit">수정</button>
            </div>
        </form>
    </div>
</body>
</html>
