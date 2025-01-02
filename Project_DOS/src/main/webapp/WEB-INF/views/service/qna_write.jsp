<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%-- <%@ include file="../inc/side.jsp" %> --%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>문의사항 게시판</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/side.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
		.custom-select {
		    width: 100%;
		    border: 2px solid #ccc;
		    border-radius: 5px;
		    box-shadow: none;
		    appearance: none;
		    background: transparent;
		    padding-right: 20px;  
		    position: relative;
		}
		
		.dropdown-arrow {
		    position: absolute;
		    right: 20px;
		    top: 50%;
		    transform: translateY(-50%);
		    font-size: 0.9em;
		    color: #333;
		}
        .container {
            margin-top: 30px;
        }

        .board-title {
            font-size: 2rem;
            font-weight: bold;
        }

        .board-meta {
            font-size: 1rem;
            color: #555;
        }

 		.text1 {
 			height: 700px;
 			width: 1110px;
 			resize: none;
 		}


        .board-view-container {
            margin-bottom: 50px;
        }

        .fixed-btn-container {
            position: static;
            bottom: 200px;
            margin-top : 50px;
            margin-left : 1000px;
            transform: translateX(-50%);
            z-index: 10;
            display: flex;
            justify-content: center;
            gap: 10px; 
        }

        .btn-list {
            background-color: white;
            color: black;
            border: 2px solid #ccc;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
        }
		
		.footer {
    	margin-top:100px;
    	}
        
        .btn-list:hover {
            background-color: #f8f9fa;
            border-color: #ddd;
            color: black;
        }
		
		.btn-custom {
		    border: 2px solid #ccc; 
		    border-radius: 5px;
		    box-shadow: none; 
		}

		.btn-custom:focus {
		    outline: none; 
		    border: 2px solid #ccc; 
		    box-shadow: none; 
		}

		.btn-custom:hover {
		    border: 2px solid #ccc;
		    box-shadow: none; 
		}
		
		#search {
			width: 153%;
		    border: 2px solid #ccc; 
		    border-radius: 5px;
		    box-shadow: none;
		}
		
		#search:focus {
		    outline: none; 
		    border: 2px solid #ccc;
		    box-shadow: none; 
		}
		

    </style>
</head>
<body>
    <div class="container">
        <div class="row mb-4">
			<div class="col-md-3">
			    <select class="custom-select btn-custom">
			        <option value="일반문의">일반 문의</option>
			        <option value="예약문의">예약 문의</option>
			    </select>
			    <span class="dropdown-arrow">▽</span>
			</div>
            <div class="col-md-6">
                <input type="text" id="search" class="form-control" value="" placeholder="제목을 입력해주세요.">                
            </div>
        </div>
		<textarea class="text1" id="text1" placeholder="내용을 입력해주세요."></textarea>
 	</div>
 	
    <div class="fixed-btn-container">
       	<button class="btn-list"onclick="location.href=''">등록</button>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
