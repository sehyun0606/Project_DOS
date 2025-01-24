<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 관리</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/side.css" rel="stylesheet" type="text/css"/>
     <style>
     	#main{
     		width : 60%;
     		margin-top: 20px;
     		margin-bottom: 10%;
     		margin-left: 5%;
     	}
        h2 {
            text-align: center;
            margin-bottom: 20px;
            margin-top: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .review-list-header {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin-bottom: 20px;
        }
        #review-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
            justify-content: flex-start;
            align-items: center;
        }
        .review-card {
            display: flex;
            flex-direction: row;
            width: 800px;
            max-width: 1000px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            position: relative;
        }
        .review-image {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
            margin-right: 15px;
        }
        .review-content {
            display: flex;
            flex-direction: column;
            width: 100%;
        }
        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .review-name {
            font-size: 1.1em;
            font-weight: bold;
        }
        .review-rating {
            color: #ff9f00;
            display: flex;
            align-items: center;
        }
        .like-button {
            color: #000;
            margin-left: 10px;
            font-size: 1.5em;
            display: flex;
            align-items: center;
        }
        .like-button.liked i {
            color: #fff;
            background-color: #000;
            border-radius: 50%;
            padding: 5px;
            border: 2px solid #000;
        }
        .like-count {
            margin-left: 5px;
            font-size: 1em;
            color: #000;
        }
        .review-text {
            color: #555;
            font-size: 0.9em;
            margin-top: 10px;
        }
        .review-footer {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-top: 10px;
            font-size: 0.9em;
            color: #888;
        }
        .review-footer .review-date {
            margin-right: 5px;
        }
        .pagination {
            justify-content: center;
        }
        .review-list-header {
            margin-top: 20px;
        }
        .sort-button, .write-button {
            display: inline-block;
            
        }
        .review-list-header .sort-button {
            margin-left: 35em;
        }
        .review-list-header .write-button {
            margin-right: 34em;
        }
        .write-button a {
            display: inline-block;
            background-color: #000; /* 검은색 배경 */
            color: #fff; /* 흰색 글자 */
            padding: 10px 20px; /* 버튼 내부 여백 */
            border-radius: 8px; /* 둥근 모서리 */
            text-align: center; /* 글자 가운데 정렬 */
            text-decoration: none; /* 링크 밑줄 제거 */
            font-weight: bold; /* 글씨 굵게 */
             right: 0; /* 오른쪽 고정 */
        }
        .sort-button button {
            background-color: #f0f0f0; /* 연한 회색 배경 */
            color: #000; /* 검은색 글자 */
            border: 1px solid #ddd; /* 경계선 */
            padding: 10px 20px;
            border-radius: 8px; /* 둥근 모서리 */
            font-weight: bold; /* 글씨 굵게 */
            left: 0; /* 왼쪽 고정 */
        }
        #reportModal .modal-title {
            font-size: 2rem;
            font-weight: bold;
        }
        #reportModal textarea {
            height: 300px; /* 기존의 두 배 크기 */
            resize: none; /* 크기 조절 비활성화 */
        }
        
        .sort-button .dropdown-menu { /* 정렬 */
		    border-radius: 8px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		}
		 .main{
        	display: flex;
        	justify-content: center;
    	}
    	#categorySelect{
    		height: fit-content;
    		margin-top: 2%;
    	}
    	.liked{
    		background-color: black;
    		color: white;
    		border-radius: 50%;
    	}
    	.membership{
            background-color: black;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            height: fit-content;
            margin-left: 60%;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>

   <div class="main">
	   
	
	    <div id="main">
	  
	        <div id="review-list">
	           <h3>리뷰</h3>
	           <input type="button" value="리뷰 작성" class="membership" onclick="location.href = 'ReviewWrite'">
			<c:forEach var="review" items="${reviewList}">
			    <div class="review-card" >
			        <img class="review-image" alt="Profile Image" >
			        
			        <div class="review-content">
			            <div class="review-header">
			                <div  class="review-name">${review.member_id}</div> <!-- 작성자 이름 -->
			                
			                <div class="review-rating">
			                	<span id="review-rating${review.review_idx}"></span>
			                    <span class="like-button">
			                    	<span class="review_idx" style="display : none;">${review.review_idx}</span>
			                        <i id="${review.review_idx}" data-auto="true" class="bi bi-hand-thumbs-up" ></i>
			                        <span class="like-count">${review.review_like}</span> <!-- 좋아요 갯수 -->
			                    </span>
			                </div>
			            </div>
			
			            <div class="review-text" onclick="goToReviewInfo(${review.review_idx})">${review.review_content}</div> <!-- 리뷰 내용 -->
			            
			            <div class="review-footer">
			                <div class="review-date"><fmt:formatDate value="${review.review_date}" pattern="yyyy-MM-dd"/></div> <!-- 리뷰 작성 날짜 -->
			                
			            </div>
			        </div>
			    </div>
		</c:forEach>
			 <!-- Pagination -->
			     <div class="pagination">
		        	<input type="button" value="이전"
		        		onclick="location.href='Reveiw?pageNum=${pageInfo.pageNum - 1}'"
		        		<c:if test="${pageInfo.pageNum eq 1}">disabled</c:if>>
			        <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
			        	<c:choose>
			        		<c:when test="${i eq pageInfo.pageNum}">
			        			<strong style="margin-left: 20px;">${i}</strong>
			        		</c:when>
			        		<c:otherwise>
			        			<a href="Review?pageNum=${i}" style="margin-left: 20px;">${i}</a>
			        		</c:otherwise>
			        	</c:choose>
			        </c:forEach>
			        <input type="button" value="다음"
			        onclick="location.href='Review?pageNum=${pageInfo.pageNum+1}'"
			        <c:if test="${pageInfo.pageNum eq pageInfo.maxPage}">disabled</c:if>style="margin-left: 20px;">
		        </div>
	        </div>
	</div>
	<select id="categorySelect">
        <option value="all">전체</option>
        <option value="noRequest">답변안한 리뷰</option>
        <option value="date">날짜순</option>
        <option value="star">별점순</option>
        <option value="like">좋아요순</option>
    </select>
    
   </div>
   
<script>
	$('#categorySelect').on('change', function () {
    const selectedCategory = $(this).val(); // 선택된 값 가져오기
    window.location.href = 'AdminReviewFilter?category=' + selectedCategory;
	})
	
	 $(document).ready(function () {
		 
    	const idxList = ${idxList};
    		
        $("[data-auto='true']").each(function () {
        	const idx = parseInt($(this).siblings(".review_idx").text())
        	console.log(idxList.includes(idx))
    		if (idxList.includes(idx)){
    			$(this).addClass("liked")
    		}
        });
    });
	//리뷰 좋아요 작업
	//좋아요는 한사람당 한번만 눌러야함
	$('.bi').click(function(){
		let likeCount = parseInt($(event.target).siblings(".like-count").text());
		let clickedElement = $(this);
		if($(this).hasClass("liked")){
			
			$(this).removeClass("liked")
			
			$.ajax({
			type : "POST",
			url : "ReviewUnLike",
			data : {
				review_idx : $(event.target).siblings(".review_idx").text()
			}
		}).done(function(result){
			if(result.trim() == "true"){
				console.log("좋아요 취소!");
				clickedElement.siblings(".like-count").text(likeCount - 1)
			} else {
				console.log("실패..")
				
			}
		}).fail(function(){
			console.log("실패...!")
			
		})
		
		} else {
			$(this).addClass("liked")
		
		$.ajax({
			type : "POST",
			url : "ReviewLike",
			data : {
				review_idx : $(event.target).siblings(".review_idx").text()
			}
		}).done(function(result){
			if(result.trim() == "true"){
				console.log("좋아요!");
				clickedElement.siblings(".like-count").text(likeCount + 1)
			} else {
				console.log("실패..")
				
			}
		}).fail(function(){
			console.log("실패...!")
			
		})
		
		
		
		};
	});

	function goToReviewInfo(reviewId) {
	    window.location.href = 'ReviewInfo?review_idx=' + reviewId;  // 리뷰 상세 페이지로 이동
	}
	function getStarRating(rating) {
        let stars = "";
        for (let i = 1; i <= 5; i++) {
            stars += i <= rating ? "★" : "☆";
            
        }
        return stars;
    }
	<c:forEach var="review" items="${reviewList}">
		document.getElementById("review-rating${review.review_idx}").textContent = getStarRating(${review.review_rating});
	</c:forEach>
</script>
	
</body>
</html>
