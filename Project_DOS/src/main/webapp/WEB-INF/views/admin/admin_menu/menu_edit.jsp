<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴 등록</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        /* 공통 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
        }

        .form-container {
            width: 60%;
            margin: 0 auto;
            padding: 20px;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .form-group label {
            flex: 1;
            font-weight: bold;
        }

        .form-group input[type="text"], 
        .form-group textarea {
            flex: 2;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group input[type="checkbox"] {
            margin-left: 10px;
        }

        .form-group textarea {
            height: 100px;
        }

        .form-group img {
            width: 30px;
            height: 30px;
            margin-right: 15px;
        }

        .form-actions {
            text-align: center;
            margin-top: 20px;
        }

        .form-actions button {
            padding: 10px 20px;
            font-size: 16px;
            border: 1px solid #ddd;
            background-color: #f5f5f5;
            cursor: pointer;
            border-radius: 5px;
        }

        .form-actions button:hover {
            background-color: #ddd;
        }
    </style>
   	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <!-- 본문 내용 -->
    <h1>메뉴 등록</h1>

    <div class="form-container">
        <form action="MenuEdit" method="post" enctype="multipart/form-data">
            <!-- 메뉴 이름 -->
            <div class="form-group">
                <label for="menuName">메뉴 이름</label>
                <input type="text" id="menuName" name="menu_name" value="${menu.menu_name}" required>
            </div>

            <!-- 가격 -->
            <div class="form-group">
                <label for="menuPrice">가격</label>
                <input type="text" id="menuPrice" name="menu_price" value="${menu.menu_price}" required>
            </div>

             <div class="form-group">
                <label for="menuCategory">카테고리</label>
                <select id="menuCategory" name="menu_category" style="margin-right: 23%;">
                	<option id="set" value="set">세트메뉴</option>
                	<option id="steak" value="steak">스테이크</option>
                	<option id="pasta" value="pasta">파스타</option>
                	<option id="salad" value="salad">셀러드</option>
                	<option id="riz&phi" value="riz&phi">리조또&필라프</option>
                	<option id="side" value="side">사이드</option>
                	<option id="drink" value="drink">주류</option>
                </select>
            </div>
			
			<c:choose>
				<c:when test="${not empty menu.menu_img}">
					<div class="form-group">
						<label for="menuImg">이미지</label>
						<span id="file">${menu.menu_img}<a href="javascript:deleteFile()"><img src="${pageContext.request.contextPath}/resources/images/delete-icon.png"></a></span>
						<input type="file" name="menuImg" hidden>
					</div>
				</c:when>
				<c:otherwise>
					<div class="form-group">
		                <label for="menuImg">이미지</label>
		                <input type="file" id="menuImage" name="menuImg" >
	            	</div>
				</c:otherwise>
			</c:choose>

            <!-- 키워드 표시 -->
            <div class="form-group">
                <label>키워드 표시</label>
                <div>
                    <input type="checkbox" id="newKeyword" name="newKeyword" value="Y">
                    <label for="newKeyword">신메뉴 키워드 표시</label>
                    <input type="checkbox" id="popularKeyword" name="popularKeyword" value="Y">
                    <label for="popularKeyword">인기메뉴 키워드 표시</label>
                </div>
            </div>

            <!-- 메뉴 소개 -->
            <div class="form-group">
                <label for="menuDescription">메뉴 소개</label>
                <textarea id="menuDescription" name="menu_description" required>${menu.menu_description}</textarea>
            </div>

            <!-- 버튼 -->
            <div class="form-actions">
                <button type="submit">수정 완료 버튼</button>
            </div>
        </form>
    </div>
    
    <script type="text/javascript">
    	$(function(){
    		$('#menuCategory option[value="${menu.menu_category}"]').prop('selected',true)
    		
    		if(${menu.new_menu eq 'Y'}){
    			$('#newKeyword').prop('checked',true)
    		}
    		if(${menu.populer_menu eq 'Y'}){
    			$('#popularKeyword').prop('checked',true)
    		}
    	})
    	
    	function deleteFile(){
    		if(confirm("파일 삭제?")){
    			$.ajax({
    				type : "POST",
    				url : "MenuDeleteFile",
    				data : {
    					menu_img : $("#file").text()
    				}
    			}).done(function(result){
    				if(result.trim() == "true"){
    					console.log("삭제 성공")
    					let fileElem = $("input[name=menu_img]")
    					$(fileElem).parent().find("span").remove();
    					
    					$(fileElem).prop("hidden",false);
    					
    				}else{
    					console.log("실패..")
    				}
    			}).fail(function(){
    				alert("파일 삭제 오류 발생!")
    			})
    		}
    	}
    </script>
</body>
</html>
