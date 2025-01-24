<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>History</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/side.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .main {
            display: flex;
        }

        .content {
        	margin-top: 20px;
        	display: flex; 
            flex: 1;
            padding: 20px;
	        flex-direction: column; /* 수직으로 배치 */
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        table th, table td {
            border-bottom: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        table th {
            font-weight: bold;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            margin: 0 5px;
            padding: 8px 12px;
            text-decoration: none;
            border: 1px solid #ccc;
            border-radius: 5px;
            color: #333;
        }

        .pagination a:hover {
            background-color: #007bff;
            color: white;
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
            <h2>Purchase History</h2>
            <table>
                <tr>
                    <th>상품</th>
                    <th>가격</th>
                    <th>결제 방식</th>
                    <th>결제일</th>
                </tr>
                <c:choose>
                  <c:when test="${empty purchaseHistory}">
                      <tr><td colspan="5">구매내역이 존재하지 않습니다</td></tr>
                  </c:when>
                  <c:otherwise>
                      <c:forEach var="history" items="${purchaseHistory}" varStatus="status">
                          <tr>
                              <td>${history.product_name}</td>
                              <td>${history.pay_amount}</td>
                              <td>${history.pay_method}</td>
                              <td>
                                  <fmt:formatDate value="${history.pay_date}" pattern="yy-MM-dd HH:mm"/>
                              </td>
                          </tr>
                      </c:forEach>
                  </c:otherwise>
				</c:choose>
            </table>
            <!-- 페이지네이션 -->
            <div class="pagination">
            	<a href="History?pageNum=${pageInfo.pageNum - 1}" <c:if test="${pageInfo.pageNum eq 1}" ></c:if>>&laquo;</a>
        			<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
			            <c:choose>
			                <c:when test="${i eq pageInfo.pageNum}">
			                    <a><b>${i}</b></a>
			                </c:when>
			                <c:otherwise>
			                    <a href="History?pageNum=${i}">${i}</a>
			                </c:otherwise>
			            </c:choose>
			        </c:forEach>
	            <a href="History?pageNum=${pageInfo.pageNum + 1}" 
	                <c:if test="${pageInfo.pageNum eq pageInfo.maxPage}" ></c:if>>&raquo;</a>
            </div>
        </div>
        
    </div>
</body>
</html>
