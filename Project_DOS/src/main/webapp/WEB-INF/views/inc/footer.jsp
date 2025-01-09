<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <title>Footer Example</title>
    
</head>
<body>
    <!-- Top 버튼 -->
    <a href="#top" class="top-btn">Top</a>

    <!-- 푸터 -->
    <footer class="footer">
        <div class="footer-top">
            <div class="footer-links-left">
                <a href="#company-info-form">회사소개</a>
                <a href="#product-info-form">제품안내</a>
                <a href="#new-entry-info-form">신규입점안내</a>
            </div>
            <div class="footer-links-right">
                <a href="#privacy-policy-form">개인정보처리방침</a>
                <a href="#terms-form">이용약관</a>
                <a href="#policy-form">운영정책</a>
                <a href="#customer-center-form">고객센터</a>
            </div>
        </div>
        <div class="footer-info">
            <p>대표이사: XXX | 주소: XXX</p>
            <p>사업자등록번호: XXX-XX-XXXXX</p>
            <p>copyright © XXX all rights reserved.</p>
            <p>홈페이지 관련 문의: XX-XXXX-XXXX</p>
            <p>상담시간: 월~금 10:00~17:00(토/일, 공휴일 휴무, 점심시간 12:00~13:30)</p>
            <p>대표번호: XXXX-XXXX | 딜리버리 주문번호: XXXX-XXXX</p>
        </div>
    </footer>
</body>
</html>