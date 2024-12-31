<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 상세 답변</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css"/>
    <style>
        /* 팝업 배경색 연한 회색 */
        .modal-content {
            background-color: #f2f2f2;
        }

        /* '리뷰 신고하기' 텍스트 크기 및 굵게 설정 */
        .modal-title {
            font-size: 2.0rem; /* 기본 크기보다 한 단계 크게 설정 */
            font-weight: bold; /* 굵게 설정 */
        }

        /* 추가 사유 입력칸 크기 늘리기 (높이를 2배로 늘림) */
       .form-control.large {
        height: 240px; /* 높이를 240px로 늘림 */
        resize: none; /* 마우스로 크기 조정 비활성화 */
        width: calc(100% - 30px); /* 가로 너비를 약간 줄임 */
        margin: 0 auto; /* 가운데 정렬 */
        display: block; /* 블록 요소로 설정 */
    }

        /* 체크박스와 추가 사유 입력칸 간격을 두 배로 */
        .form-check {
            margin-bottom: 16px; /* 체크박스와 추가 사유 입력칸 사이의 간격을 두 배로 */
        }

        /* 버튼 스타일 */
        .btn-secondary {
            background-color: #d3d3d3; /* 덜진한 회색 */
        }
        .btn-danger {
            background-color: #000000; /* 검정색 */
            color: #ffffff;
        }

        /* 글자수 100글자 제한 */
        .limit-textarea {
            max-length: 100;
        }
    </style>
</head>
<body>
    <!-- 헤더 포함 (top.jsp) -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>

    <!-- 리뷰 페이지 본문 -->
    <div class="container mt-5">
        <!-- 신고 버튼 -->
      <!-- review_info 내에 있는 신고 버튼 -->
<div class="review_info">
    <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#reportModal">리뷰 신고하기</button>
</div>

<!-- 신고 모달 -->
<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reportModalLabel">리뷰 신고하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <label for="reportReason" class="form-label">신고 사유를 선택하세요:</label>
                    <div>
                        <input type="checkbox" id="reason1" name="reason" value="매장과 관련 없는 내용"> 매장과 관련 없는 내용<br>
                        <input type="checkbox" id="reason2" name="reason" value="욕설"> 욕설<br>
                        <input type="checkbox" id="reason3" name="reason" value="허위사실"> 허위사실<br>
                        <input type="checkbox" id="reason4" name="reason" value="광고/스팸"> 광고/스팸<br>
                    </div>
                    <textarea class="form-control large" placeholder="추가 사유를 작성하세요" maxlength="100"></textarea>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-dark">신고</button>
            </div>
        </div>
    </div>
</div>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        document.querySelectorAll('#rating .bi-star').forEach(star => {
            star.addEventListener('click', function() {
                const value = this.getAttribute('data-value');
                document.querySelectorAll('#rating .bi-star').forEach((s, i) => {
                    if (i < value) {
                        s.classList.add('bi-star-fill');
                        s.classList.remove('bi-star');
                    } else {
                        s.classList.add('bi-star');
                        s.classList.remove('bi-star-fill');
                    }
                });
                document.getElementById('ratingInput').value = value;
            });
        });
    </script>
    	<jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
</body>
</html>
