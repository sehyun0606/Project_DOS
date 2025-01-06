<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴</title>
   
   <link href="${pageContext.request.contextPath}/resources/css/menu.css" rel="stylesheet" type="text/css"/>
   <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
   <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css"/>
    <style>
        /* 'best-tag' 클래스를 위한 스타일 설정 */
        .best-tag {
            background-color: gold; /* 배경색을 금색으로 설정 */
            color: black; /* 글자색을 검정색으로 설정 */
            font-weight: bold; /* 글자를 굵게 설정 */
            position: absolute; /* 부모 요소 기준으로 절대 위치 설정 */
            top: 10px; /* 상단에서 10px 떨어진 위치 */
            right: 10px; /* 오른쪽에서 10px 떨어진 위치 */
            padding: 5px 10px; /* 내부 여백 설정 (상하 5px, 좌우 10px) */
            border-radius: 5px; /* 모서리를 둥글게 설정 */
        }

        /* 'popup' 클래스를 위한 스타일 설정 */
        .popup {
            position: fixed; /* 화면 고정 위치 설정 */
            top: 50%; /* 화면 세로 중앙 위치 */
            left: 50%; /* 화면 가로 중앙 위치 */
            transform: translate(-50%, -50%); /* 중앙 정렬을 위한 이동 설정 */
            background-color:whitesmoke; /* 팝업 배경색을 연한 회색으로 설정 */
            padding: 20px; /* 내부 여백 설정 */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
            border-radius: 10px; /* 팝업 모서리를 둥글게 설정 */
            z-index: 1000; /* 다른 요소 위에 표시되도록 설정 */
            width: 500px; /* 팝업 너비 설정 */
            height:400px; /* 팝업 높이 설정 */
            display: none; /* 기본 상태를 숨김으로 설정 */
        }

        /* 'popup-content' 클래스를 위한 스타일 설정 */
        .popup-content {
            text-align: center; /* 내용을 중앙 정렬 */
            
        }

        /* 'popup' 내부의 닫기 버튼 스타일 설정 */
        .popup .close-btn {
            position: absolute; /* 팝업 기준 절대 위치 설정 */
            top: 10px; /* 상단에서 10px 위치 */
            right: 10px; /* 오른쪽에서 10px 위치 */
            cursor: pointer; /* 마우스를 올리면 커서 변경 (포인터로) */
            font-size: 40px; /* 글자 크기 40px 설정 */
        }
    </style>

</head>
<body>
  <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    <section class="new-menu-intro">
        <h2 style="font-weight: 600;">신메뉴 소개</h2>
        <div class="photo-slider">
            <div class="photo-container">
                <a href="#">
                    <img src="<c:url value='/resources/images/menu1.jpg'/>" class="menu-photo" alt="Black Label 스테이크" style="width: 450px; height: 400px;">
                </a>
                <a href="#">
                    <img src="<c:url value='/resources/images/menu2.jpg'/>" class="menu-photo" alt="Tomahawk & Porterhouse" style="width: 450px; height: 400px;">
                </a>
                <a href="#">
                    <img src="<c:url value='/resources/images/menu3.jpg'/>" class="menu-photo" alt="마라상하이 파스타" style="width: 450px; height: 400px;">
                </a>
            </div>
        </div>
        <div class="search-container" style="display: flex; align-items: center; justify-content: flex-end;">
            <button class="search-button" style="border: none; background: none; cursor: pointer; margin-right: 10px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                </svg>
            </button>
            <input type="text" placeholder="검색" class="search-box" style="margin-right: 150px;"> <!--검색창 옮기기-->
        </div>
        <p class="store-name">Dinner of Steak 메뉴</p>
        <div class="divider"></div>
    </section>
    
    

    <!-- 막대기 아래 텍스트 -->
<div class="menu-links">
    <span data-target="set-menu">Set Menu</span>
    <span data-target="steak">Steak</span>
    <span data-target="pasta">Pasta</span>
    <span data-target="risotto">Risotto&Pilaf</span>
    <span data-target="salads">Salads</span>
    <span data-target="side-dishes">Side dishes</span>
    <span data-target="beverages">Beverages</span>
</div>



    
<div class="menu-container">
    <h2 class="category-title">Set Menu</h2>
    <div class="menu-row">
        <div class="menu-card" onclick="showPopup('')">
            <img src="<c:url value='${menu.imageUrl}'/>"  />
            <h3>${menu.menuName} </h3>
            <span class="details-link">[자세히 보기]</span>
            <p>${menu.price}원</p>
            <div class="best-tag">Signature</div>
        </div>
        <div class="menu-card" onclick="showPopup('')">
            <img src="<c:url value='${menu.imageUrl}'/>" />
            <h3>${menu.menuName}</h3>
            <span class="details-link">[자세히 보기]</span>
            <p>${menu.price}원</p>
        </div>
    </div>
    <div class="menu-row">
        <div class="menu-card" onclick="showPopup('')">
            <img src="<c:url value='${menu.imageUrl}'/>" />
            <h3>${menu.menuName}</h3>
            <span class="details-link">[자세히 보기]</span>
            <p>${menu.price}원</p>
        </div>
        <div class="menu-card" onclick="showPopup('')">
            <img src="<c:url value='${menu.imageUrl}'/>" />
            <h3>${menu.menuName}</h3>
            <span class="details-link">[자세히 보기]</span>
            <p>${menu.price}원</p>
            <div class="best-tag">BEST</div>
        </div>
    </div>
</div>

<div class="menu-container" id="steak">
    <h2 class="category-title">Steak Selection</h2>
    <div class="menu-row">
        <div class="menu-card" onclick="showPopup('')">
            <img src="<c:url value='${menu.imageUrl}'/>" />
            <h3>${menu.menuName}</h3>
            <span class="details-link">[자세히 보기]</span>
            <p>${menu.price} 원</p>
        </div>
        <div class="menu-card" onclick="showPopup('')">
            
            <img src="<c:url value='${menu.imageUrl}'/>" />
            <h3>${menu.menuName}</h3>
            <span class="details-link">[자세히 보기]</span>
            <p>${menu.price}원</p>
            <div class="best-tag">BEST</div>
        </div>
    </div>
    <div class="menu-row">
        -<div class="menu-card" onclick="showPopup('')">
            <img src="<c:url value='${menu.imageUrl}'/>" />
            <h3>${menu.menuName}</h3>
            <span class="details-link">[자세히 보기]</span>
            <p>${menu.price}원</p>
        </div>
        -<div class="menu-card" onclick="showPopup('')">
            <img src="<c:url value='${menu.imageUrl}'/>" />
            <h3>${menu.menuName}</h3>
            <span class="details-link">[자세히 보기]</span>
            <p>${menu.price}원</p>
        </div>
        -<div class="menu-card" onclick="showPopup('')">
            <img src="<c:url value='/resources/images/토미호크.jpg'/>" />
            <h3>토마호크 스테이크</h3>
            <span class="details-link">[자세히 보기]</span>
            <p>${menu.price}원</p>
        </div>
    </div>
</div>
      
    <div class="menu-container" id="pasta">
        <h2 class="category-title">Pasta</h2>
        <div class="menu-row">
            -<div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/토미호크.jpg'/>" />
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
            -<div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/알리오올리오.jpg'/>" />
                <h3>${menu.menuName}</h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
        </div>
        <div class="menu-row">
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/크림파스타.jpg'/>"/>
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
            
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/아라비아따.jpg'/>" />
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
                <div class="best-tag">Hit</div>
                </div>
                </div>
        <div class="menu-row">
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/토마토.jpg'/>"/>
                <h3>${menu.menuName}</h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
            
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/투움바.jpg'/>" />
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
                <div class="best-tag">BEST</div>

          
            </div>
        </div>
    </div>
    <div class="menu-container" id="risotto">
        <h2 class="category-title"> Risotto&Pilaf</h2>
        <div class="menu-row">
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/크림리조또.jpg'/>" />
                <h3>${menu.menuName}</h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/투움바리조또2.jpg'/>" />
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
        </div>
        <div class="menu-row">
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/목살필라프.jpg'/>" />
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
                <div class="best-tag">BEST</div>
            </div>


            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/새우필라프.jpg'/>" />
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
            
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/상하이필라프.jpg'/>" />
                <h3>${menu.menuName}</h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
        </div>
    </div>


    <div class="menu-container" id="salads">
        <h2 class="category-title">Salads</h2>
        <div class="menu-row">
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/콘샐러드.jpg'/>"/>
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/리코타치즈.jpg'/>" />
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
                <div class="best-tag">BEST</div>
            </div>
        </div>
        <div class="menu-row">
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/연어크림치즈.jpg'/>" />
                <h3>${menu.menuName}</h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
            
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/치킨텐더.jpg'/>" />
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
        </div>
    </div>


    <div class="menu-container" id="side-dishes">
        <h2 class="category-title">Side dishes</h2>
        <div class="menu-row">
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/윙봉.jpg'/>" />
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/식전빵.jpg'/>"/>
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
        </div>
        <div class="menu-row">
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/크림수프.jpg'/>"/>
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>


            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/웨지감자.jpg'/>" />
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
            
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/치즈볼.jpg'/>" />
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
        </div>
    </div>
    <div class="menu-container" id="beverages">
        <h2 class="category-title">Beverages</h2>
        <div class="menu-row">
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/콜라.jpg'/>"/>
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/에이드.jpg'/>" />
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
                <div class="best-tag">BEST</div>
            </div>
        </div>
        <div class="menu-row">
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/와인.jpg'/>" />
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
            
            <div class="menu-card" onclick="showPopup('')">
                <img src="<c:url value='/resources/images/하이볼.jpg'/>" />
                <h3>${menu.menuName} </h3>
                <span class="details-link">[자세히 보기]</span>
                <p>${menu.price}원</p>
            </div>
        </div>
    </div>
    <div class="reserve-button-container">
        <button class="reserve-button">예약</button>
    </div>
</div>

<div id="popup" class="popup" style="display: none;">
    <div class="popup-content">
        <span class="close-btn" onclick="closePopup()">&times;</span>
        <h3 id="popup-title"></h3>
        <p id="popup-price"></p>
        <p id="popup-description"></p>
    </div>
</div>
<jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        // 메뉴 링크 클릭 이벤트 추가
        const menuLinks = document.querySelectorAll('.menu-links span');

        menuLinks.forEach(link => {
            link.addEventListener('click', () => {
                const targetId = link.getAttribute('data-target'); // 클릭된 항목의 data-target 값 가져오기
                const targetElement = document.getElementById(targetId); // 해당 ID의 요소 찾기

                if (targetElement) {
                    // 스크롤 이동 애니메이션 적용
                    window.scrollTo({
                        top: targetElement.offsetTop - 20, // 상단 여백 설정
                        behavior: 'smooth' // 부드러운 스크롤
                    });
                }
            });
        });

        // 검색 기능 추가 (엔터 또는 돋보기 클릭 시 실행)
        const searchBox = document.querySelector('.search-box');
        const searchButton = document.querySelector('.search-button');

        function searchItem() {
            const query = searchBox.value.toLowerCase();
            const items = document.querySelectorAll('.menu-card h3');

            for (let item of items) {
                if (item.innerText.toLowerCase().includes(query)) {
                    item.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    break;
                }
            }
        }

        // 엔터 키 입력 처리
        searchBox.addEventListener('keypress', (event) => {
            if (event.key === 'Enter') {
                searchItem();
            }
        });

        // 돋보기 클릭 처리
        searchButton.addEventListener('click', () => {
            searchItem();
        });
    });

    function showPopup(title, price, description) {
        document.getElementById('popup-title').innerText = title;
        document.getElementById('popup-price').innerText = price;
        document.getElementById('popup-description').innerText = description;
        document.getElementById('popup').style.display = 'block';
    }

    function closePopup() {
        document.getElementById('popup').style.display = 'none';
    }
</script>
</body>
</html>