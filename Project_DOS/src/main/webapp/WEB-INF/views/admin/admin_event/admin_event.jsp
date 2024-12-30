<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트 목록</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        #top-menu {
            width: 100%;
            background-color: #f4f4f4;
            border-bottom: 1px solid #ddd;
        }

        .main-layout {
            display: flex;
            flex: 1;
            overflow: auto;
        }

        #side-menu {
            width: 200px;
            box-sizing: border-box;
        }

        .content {
            flex: 1;
            padding: 5%;
            box-sizing: border-box;
            overflow: auto;
            padding-top: 2%;
        }

        .title {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        /* 카테고리 탭 스타일 */
        .category-tabs {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
        }

        .category-tab {
            margin: 0 10px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            padding: 5px 10px;
            border: 1px solid transparent;
            border-radius: 5px;
        }


        /* 상품 컨테이너 */
        .product-container {
            display: none;
        }

        .product-container.active {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
        }

        .product-card {
            width: 30%;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            text-align: center;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .product-image {
            width: 100%;
            height: 150px;
            background-color: #eaeaea;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px;
        }

        .product-name {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .product-price {
            font-size: 16px;
            color: #555;
            margin-bottom: 10px;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
        }

        .button {
            padding: 10px 15px;
            font-size: 14px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
        }

        .button.delete {
            background-color: #dc3545;
        }
        /* 카테고리 탭 스타일 */
		.category-tabs {
		    display: flex;
		    justify-content: center;
		    margin-bottom: 20px;
		    border-bottom: 2px solid #ddd;
		    padding-bottom: 10px;
		}
		
		.category-tab {
		    margin: 0 10px;
		    font-size: 18px;
		    font-weight: bold;
		    cursor: pointer;
		    padding: 5px 10px;
		    border: 1px solid transparent;
		    border-radius: 5px;
		    transition: all 0.3s ease; /* 부드러운 애니메이션 효과 */
		}
		
		.category-tab.active {
		    transform: scale(1.05); /* 살짝 확대 효과 */
		}
		
		.category-tab:hover {
		    background-color: #e9f5ff; /* 마우스 오버 시 배경색 */
		    border-color: #007bff;
		}
        
    </style>
</head>
<body>
    <div id="top-menu">
        <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>
    </div>

    <div class="main-layout">

        <div class="content">
            <div class="title">이벤트 목록</div>
            <div><input type="button" value="추가하기" onclick="location.href='EventEdit'"></div>
            <!-- 카테고리 탭 -->
            <div class="category-tabs">
            <h3>상시 이벤트</h3>
            </div>

            <!-- 카테고리별 상품 -->
	        <div class="event-list">
				<div class="product-container active" id="category1">
	                <div class="product-card">
	                    <div class="product-name">이벤트 제목</div>
	                    <div class="button-group">
	                        <button class="button edit">수정하기</button>
	                        <button class="button delete">삭제하기</button>
	                    </div>
	                </div>
	                <div class="product-card">
	                    <div class="product-name">이벤트 제목</div>
	                    <div class="button-group">
	                        <button class="button edit">수정하기</button>
	                        <button class="button delete">삭제하기</button>
	                    </div>
	                </div>
	                <div class="product-card">
	                    <div class="product-name">이벤트 제목</div>
	                    <div class="button-group">
	                    	<button class="button edit">수정하기</button>
	                    	<button class="button delete">삭제하기</button>
	                	</div>
	           		</div>
				</div>
            </div>
            
            <div class="category-tabs" style="margin-top: 3%;" >
            <h3>기간 이벤트</h3>
            </div>
            
	        <div class="event-list">
				<div class="product-container active" id="category1">
	                <div class="product-card">
	                    <div class="product-name">이벤트 제목</div>
	                    <div class="button-group">
	                        <button class="button edit">수정하기</button>
	                        <button class="button delete">삭제하기</button>
	                    </div>
	                </div>
	                <div class="product-card">
	                    <div class="product-name">이벤트 제목</div>
	                    <div class="button-group">
	                        <button class="button edit">수정하기</button>
	                        <button class="button delete">삭제하기</button>
	                    </div>
	                </div>
	                <div class="product-card">
	                    <div class="product-name">이벤트 제목</div>
	                    <div class="button-group">
	                    	<button class="button edit">수정하기</button>
	                    	<button class="button delete">삭제하기</button>
	                	</div>
	           		</div>
	                <div class="product-card">
	                    <div class="product-name">이벤트 제목</div>
	                    <div class="button-group">
	                    	<button class="button edit">수정하기</button>
	                    	<button class="button delete">삭제하기</button>
	                	</div>
	           		</div>
				</div>
            </div>

            
        </div>
    </div>
</body>
</html>
