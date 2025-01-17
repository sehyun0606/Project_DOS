<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membership</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- 포트원 결제 -->
    <script>
//         // 객체 초기화
//         var IMP = window.IMP;
//         IMP.init("imp65450054");

//         function requestPay() {
//             // 결제창 호출      
//             IMP.request_pay(
//                 {
//                     pg: "kakaopay.TC0ONETIME",
//                     pay_method: "card",
//                     merchant_uid: "880447580-5073667", // 상점 고유 주문번호
//                     name: "포트원 테스트",
//                     amount: 1004,
//                     buyer_email: "good@portone.io",
//                     buyer_name: "포트원 기술지원팀", 
//                     buyer_tel: "010-1234-5678",
//                     buyer_addr: "서울특별시 강남구 삼성동",
//                     buyer_postcode: "123-456",
//                 },
//                 function (rsp) {
//                     // callback
//                     if (rsp.success) {
//                         alert('결제가 성공했습니다.');
//                     } else {
//                         alert('결제 실패: ' + rsp.error_msg);
//                     }
//                 } // 콜백 함수 끝
//             );
//         }

		var IMP = window.IMP;
		IMP.init("imp65450054");
		
		function certification() {
		    // IMP.certification(param, callback) 호출
		    IMP.certification(
		        {
		            // param
		            channelKey: "channel-key-0ff2dd57-d9b3-4f25-b95e-7664f4e2f266",
		            // 주문 번호
		            merchant_uid: "ORD20180131-0000011",
		            
		            m_redirect_url: "https://your.redirect.url/here",
		            // PC환경에서는 popup 파라미터가 무시되고 항상 true로 적용됨
		            popup: false,
		        },
		        function (rsp) {
		            // callback
		            if (rsp.success) {
		                // 인증 성공 시 로직
		                alert('인증 성공: ' + rsp.imp_uid);
		            } else {
		                // 인증 실패 시 로직
		                alert('인증 실패: ' + rsp.error_msg);
		            }
		        }
		    );
		}

    </script>
</head>
<body>
    <!-- 결제하기 버튼 생성 -->
    <button onclick="certification()" class="btn btn-primary">본인인증</button>
</body>
</html>
