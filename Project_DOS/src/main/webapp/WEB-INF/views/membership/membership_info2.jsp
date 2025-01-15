<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membership</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>
	<!-- 결제하기 버튼 생성 -->
	<button onclick="requestPay()">결제하기</button>

    <script>
   // 객체 초기화
        var IMP = window.IMP;
        IMP.init("imp65450054");

        function requestPay() {
          // 결제창 호출      
          IMP.request_pay(
            {
              // 파라미터 값 설정 
              pg: "kakaopay.{TC0ONETIME}",
              pay_method: "card",
              merchant_uid: "8804475805073664", // 상점 고유 주문번호
              name: "포트원 테스트",
              amount: 1004,
              buyer_email: "good@portone.io",
              buyer_name: "포트원 기술지원팀", 
              buyer_tel: "010-1234-5678",
              buyer_addr: "서울특별시 강남구 삼성동",
              buyer_postcode: "123-456",
            },
            function (rsp) {
              // callback
              //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
            }
          );
      }
      </script>
</body>
</html>
