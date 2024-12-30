<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 페이지</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/side.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }

        /* 메인 레이아웃 설정 */
        .main {
            display: flex;
            margin-top: 60px; /* 상단 메뉴 높이 */
            flex: 1;
        }

        .content {
            flex: 1;
            padding: 20px;
        }

        .profile-container {
            display: flex;
            align-items: flex-start;
            justify-content: center;
            margin: 50px 0;
        }

        .profile-image {
            width: 150px;
            height: 150px;
            background-color: #e0e0e0;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: #888;
        }

        .profile-details {
            margin-left: 30px;
            flex: 1;
        }

        .profile-details h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .profile-details ul {
            list-style: none;
            padding: 0;
        }

        .profile-details ul li {
            margin-bottom: 10px;
            font-size: 16px;
        }

        .membership {
            text-align: center;
            margin-top: 20px;
        }

        .membership button {
            background-color: black;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-container {
            margin-top: 20px;
            text-align: center;
        }

        .form-container input[type="text"] {
            padding: 10px;
            width: 70%;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-container input[type="submit"] {
            padding: 10px 20px;
            border: none;
            background-color: black;
            color: white;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
        }

        .reservation {
            margin-top: 20px;
        }

        .reservation textarea {
            width: 100%;
            height: 100px;
            resize: none;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .actions {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .actions button {
            margin: 0 10px;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid black;
            background: white;
            cursor: pointer;
        }

        .actions button:hover {
            background: black;
            color: white;
        }
        .gifticon-input {
		    width: 50%; /* 입력창의 너비를 절반으로 설정 */
		    padding: 5px; /* 여백 조정 */
		    font-size: 14px;
		    border: 1px solid #ddd;
		    border-radius: 5px;
		}
        .gift-form{
        	width: 50%;
        	margin-left: 12%;
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
        <!-- 메인 컨텐츠 -->
        <div class="content">
            <div class="profile-container">
                <div class="profile-image">Image</div>
                <div class="profile-details">
                    <h2>NAME</h2>
                    <ul>
                        <li>아이디: example123</li>
                        <li>생년월일: 1990-01-01</li>
                        <li>이메일: example@example.com</li>
                        <li>전화번호: 010-1234-5678</li>
                    </ul>
                    <div class="membership">
                        <button>멤버쉽 가입하기</button>
                    </div>
                    <div class="form-container">
                         <form class="gift-form">
					        <input type="text" placeholder="기프티콘 번호를 입력하시오" class="gifticon-input">
					        <input type="submit" value="등록">
					    </form>
                    </div>
                </div>
            </div>
            <div class="reservation">
                <h3>예약</h3>
                <textarea placeholder="예약 내용을 입력하세요"></textarea>
            </div>
            <div class="actions">
                <button>정보 수정</button>
                <button>LogOut</button>
                <button>회원 탈퇴</button>
            </div>
        </div>
    </div>
</body>
</html>
