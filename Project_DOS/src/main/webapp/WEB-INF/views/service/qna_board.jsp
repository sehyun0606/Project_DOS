<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 날짜 표시 형식을 변경하기 위해 JSTL - fmt 라이브러리 추가 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <!-- 부트스트랩 CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
    </style>
</head>
<body>
	<nav>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</nav>
	
	<div class="d-flex">
        <!-- 사이드바 -->
        <div class="offcanvas offcanvas-start show" style="width: 250px; background-color: #f8f9fa;" tabindex="-1" id="sidebar" aria-labelledby="sidebarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="sidebarLabel">메뉴</h5>
            </div>
            <div class="offcanvas-body">
                <ul class="list-group">
                    <li class="list-group-item"><a href="#">홈</a></li>
                    <li class="list-group-item"><a href="#">게시판</a></li>
                    <li class="list-group-item"><a href="#">문의사항</a></li>
                    <li class="list-group-item"><a href="#">설정</a></li>
                </ul>
            </div>
        </div>
	<div class="flex-grow-1">
	<article class="content">
		<div class="container my-5">
		    <h2 class="text-center mb-4">문의사항</h2>
		    <div class="d-flex justify-content-between mb-3">
		        <!-- 제목 select -->
		        <div class="input-group me-2" style="width: 15%;">
		            <select class="form-control selectpicker" id="noticeselect">
		                <option value="">제목</option>
		                <option value="">내용</option>
		                <option value="">ID</option>
		            </select>
		        </div>
		        <!-- 검색 텍스트 -->
		        <div class="input-group flex-grow-1 me-2">
		            <input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="검색어">
		            <button class="btn btn-outline-secondary" type="button" style="width: 15%">검색</button>
		        </div>
		        <!-- 글쓰기 버튼 -->
		        <div style="width: 15%;">
		            <button class="btn btn-primary w-100" type="button">글쓰기</button>
		        </div>
		    </div>
		    <table class="table table-bordered text-center">
		        <thead class="table-light">
		        <tr>
		            <th style= "width: 5%;">번호</th>
		            <th style= "width: 65%;">제목</th>
		            <th style= "width: 10%;">작성자</th>
		            <th style= "width: 10%;">등록일</th>
		            <th style= "width: 15%;">조회수</th>
		        </tr>
		        </thead>
		        <c:choose>
					<c:when test="${empty qnaList}"> <%-- 게시물 목록이 존재하지 않을 경우 --%>
						<tr><td colspan="5">게시물이 존재하지 않습니다</td></tr>
					</c:when>
					<c:otherwise>
						<%-- List 객체(boardList)를 차례대로 반복하면서 게시물 목록 출력 --%>
						<%-- JSTL - <c:forEach> 과 EL 조합하여 작업 --%>
						<c:forEach var="qna" items="${qnaList}" varStatus="status">
							<%-- List 객체에서 꺼낸 BoardVO 객체(board)에 접근하여 데이터 출력 --%>
							<tr>
								<td class="qna_num" >${qna.qna_num}</td>
								<td class="qna_title">${qna.qna_title}</td>
								<td>${qna.member_id}</td>
								<td>
									<%--
									JSTL - format(fmt) 라이브러리를 활용하여 날짜 및 시각 형식(포맷) 변경
									1) <fmt:formatDate> : Date 타입의 날짜의 날짜 형식(포맷) 변경
									   => <fmt:formatDate value="${날짜 및 시각 객체}" pattern="표현패턴">
									   => 자바의 SimpleDateFormat 등의 포맷팅 클래스와 동일한 역할 수행
									2) <fmt:parseDate> : String 객체의 날짜 형식 변경
									----------------------------------------------------------------------
									[ 날짜 및 시각 형식을 지정하는 패턴 문자 ]
									y : 연도(yy : 연도 2자리, yyyy : 연도 4자리)
									M : 월(MM : 월 2자리)
									d : 일(dd : 일 2자리)
									H : 시(HH : 24시간제, hh : 12시간제)
									m : 분(mm : 분 2자리)
									s : 초(ss : 초 2자리) 
									=> yy-MM-dd HH:mm : 연도2자리-월2자리-일2자리 시2자리:분2자리
									--%>
									<fmt:formatDate value="${qna.qna_date}" pattern="yy-MM-dd HH:mm"/>
								</td>
								<td>${qna.qna_readcount}</td>
							</tr>
						</c:forEach>
					</c:otherwise>					
				</c:choose>
		    </table>
		    <nav class="d-flex justify-content-center">
		        <ul class="pagination">
<!-- 		            <li class="page-item"><a class="page-link" href="#">&#9664;</a></li> -->
<!-- 		            <li class="page-item active"><a class="page-link" href="#">1</a></li> -->
<!-- 		            <li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 		            <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 		            <li class="page-item"><a class="page-link" href="#">4</a></li> -->
<!-- 		            <li class="page-item"><a class="page-link" href="#">&#9654;</a></li> -->
		        
			    <%-- [이전] 버튼 클릭 시 현재 페이지의 이전 페이지 요청(2 페이지 일 경우 1 페이지 요청) --%>
				<%-- 현재 목록의 페이지번호 - 1 값을 파라미터로 전달 --%>
				<%-- 단, 현재 페이지가 1 페이지일 경우 비활성화(disabled) --%>
				<li class="page-item"><a class="page-link" href="Question?pageNum=${pageInfo.pageNum - 1}" <c:if test="${pageInfo.pageNum eq 1}" >disabled</c:if>>
				&#9664;</a></li>
<!-- 				<input type="button" value="이전"  -->
<%-- 					onclick="location.href='BoardList?pageNum=${pageInfo.pageNum - 1}'"  --%>
<%-- 				<c:if test="${pageInfo.pageNum eq 1}" >disabled</c:if> --%>
				
				<%-- 계산된 페이지 번호가 저장된 PageInfo 객체(pageInfo) 를 통해 페이지번호 반복 출력 --%>
				<%-- startPage 부터 endPage 까지 1씩 증가하면서 페이지번호 출력 --%>
				<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
					<%-- 각 페이지번호 마다 하이퍼링크 설정 --%>
					<%-- 단, 현재 페이지(i값과 pageNum 동일)는 하이퍼링크 없이 굵게(<strong>) 표시 --%>
					<c:choose>
						<c:when test="${i eq pageInfo.pageNum}">
							<a class="page-link"><b>${i}</b></a>
						</c:when>
						<c:otherwise>
							<%-- 페이지번호 하이퍼링크 클릭 시 BoardList 서블릿 요청(파라미터 : 페이지번호) --%>
<%-- 							<a href="BoardList?pageNum=${i}">${i}</a> --%>
							<li class="page-item"><a class="page-link" href="Question?pageNum=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<%-- [다음] 버튼 클릭 시 현재 페이지의 다음 페이지 요청(2 페이지 일 경우 3 페이지 요청) --%>
				<%-- 현재 목록의 페이지번호 + 1 값을 파라미터로 전달 --%>
				<%-- 단, 현재 페이지가 최대 페이지 번호와 동일할 경우 비활성화(disabled) --%>
				<li class="page-item"><a class="page-link" href="Question?pageNum=${pageInfo.pageNum + 1}" <c:if test="${pageInfo.pageNum eq pageInfo.maxPage}" >disabled</c:if>>
				&#9654;</a></li>
<!-- 				<input type="button" value="다음"  -->
<%-- 					onclick="location.href='BoardList?pageNum=${pageInfo.pageNum + 1}'"  --%>
				
				</ul>
		    </nav>
		</div>
	</article>
	</div>
	</div>
<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
