<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>쿠폰 관리</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container2 {
            display: flex;
            justify-content: space-between;
            width: 80%;
            margin: 30px auto;
            margin-top: 10%;
        }

        .section {
            width: 48%;
        }

        h2 {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"] {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-group .submit-btn {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #000;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .form-group .submit-btn:hover {
            opacity: 0.8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th,
        table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            font-size: 14px;
        }

        table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        .delete-btn {
            padding: 5px 10px;
            font-size: 12px;
            background-color: #ff4d4d;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .delete-btn:hover {
            opacity: 0.8;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <div class="container2">
        <!-- 쿠폰 발급 -->
        <div class="section">
            <h2>쿠폰 발급</h2>
            <form action="CouponCreate" method="post">
                <div class="form-group">
                    <label for="couponName">쿠폰 이름</label>
                    <input type="text" id="couponName" name="coupon_name" placeholder="쿠폰 이름 입력" required>
                </div>
                <div class="form-group">
                    <label for="discountValue">할인 가격</label>
                    <input type="text" id="discountValue" name="discount_rate" placeholder="할인 가격 입력 (예: 30)" required>
                </div>
                <button type="submit" class="submit-btn">등록하기</button>
            </form>
        </div>

        <!-- 쿠폰 목록 -->
        <div class="section">
            <h2>쿠폰 목록</h2>
            <table>
                <thead>
                    <tr>
                        <th>쿠폰 이름</th>
                        <th>등록 날짜</th>
                        <th>할인 가격</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
	                <c:choose>
		            	<c:when test="${empty couponList}">
		            		<tr><td colspan="5">쿠폰이 존재하지 않습니다.</td></tr>
		            	</c:when>
		            	<c:otherwise>
		            		<c:forEach var="coupon" items="${couponList}" varStatus="status">
		            			<tr>
				                    <td class="board_title">${coupon.coupon_name}</td>
				                    <td><fmt:formatDate value="${coupon.coupon_date}" pattern="yyyy-MM-dd"/>
									</td>
				                    <td>${coupon.discount_rate}% </td>
				                    <td class="action-buttons">
				                    	<p class="coupon_name" style="display : none;">${coupon.coupon_name}</p>
				                        <button class="delete">삭제하기</button>
				                    </td>
				                </tr>
		            		
		            		</c:forEach>
		            	
		            	</c:otherwise>
		            </c:choose>
                </tbody>
            </table>
        </div>
    </div>

    <script>
	    $(".delete").on("click",function(event){
			let message = confirm("삭제하시겠습니까?");
			if(message){
				let coupon_name = $(event.target).siblings(".coupon_name").text();
				location.href = "AdminCouponDelete?coupon_name=" + coupon_name;
			}
		})
    </script>
</body>
</html>
