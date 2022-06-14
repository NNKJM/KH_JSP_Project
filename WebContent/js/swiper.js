const swiper = new Swiper('.swiper', {
  
  spacebBetween: 30, // 슬라이드 간격
  centeredSlides: true, // true인 경우 활성 슬라이드는 왼쪽이아닌 항상 가운데 배치
  autoplay:{ // 자동으로 페이징을 넘겨주는 작업 
	delay: 2500, // 넘겨주는 시간 주기 설정 2.5초
	disableOnInteraction: false,
  }, 

  // If we need pagination
  pagination: {
    el: '.swiper-pagination',
	type: "fraction",
  },

  // Navigation arrows
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
});