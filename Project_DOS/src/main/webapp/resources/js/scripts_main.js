const slides = document.querySelector('.slides');
const slideButtons = document.querySelectorAll('.slider-buttons button');
let currentSlide = 0;
const totalSlides = slideButtons.length;

// 슬라이드 이동 함수
function updateSlider() {
    const slideWidth = slides.offsetWidth;
    slides.style.transform = `translateX(-${currentSlide * slideWidth}px)`;

    // 활성화된 하단 버튼 표시
    slideButtons.forEach((button, index) => {
        button.classList.toggle('active', index === currentSlide);
    });
}

// 다음 슬라이드로 이동
document.getElementById('next-slide').addEventListener('click', () => {
    currentSlide = (currentSlide + 1) % totalSlides; // 무한 루프
    updateSlider();
});

// 이전 슬라이드로 이동
document.getElementById('prev-slide').addEventListener('click', () => {
    currentSlide = (currentSlide - 1 + totalSlides) % totalSlides; // 무한 루프
    updateSlider();
});

// 하단 버튼 클릭으로 이동
slideButtons.forEach((button, index) => {
    button.addEventListener('click', () => {
        currentSlide = index;
        updateSlider();
    });
});

// 초기 슬라이드 설정
updateSlider();

// 창 크기 조정 시 슬라이드 갱신
window.addEventListener('resize', updateSlider);

// 메뉴 소개 슬라이드
const menuSlides = document.querySelector('.menu-slides');
let currentMenuSlide = 1;

function updateMenuSlider() {
    menuSlides.style.transform = `translateX(-${currentMenuSlide * 100}%)`;
}

document.getElementById('menu-next').addEventListener('click', () => {
    currentMenuSlide = (currentMenuSlide + 1) % 3;
    updateMenuSlider();
});

document.getElementById('menu-prev').addEventListener('click', () => {
    currentMenuSlide = (currentMenuSlide - 1 + 3) % 3;
    updateMenuSlider();
});