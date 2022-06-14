// TOP버튼이 스크롤 이벤트를 감지하여 생겻다가 사라지는 애니메이션 구현


window.addEventListener('scroll', ()=>{
	console.log(scrollY);
	
	if(scrollY >= 1800){
		$('.top_button').css("display","block");
	} else if(scrollY <= 100){
		$('.top_button').css("display","none");
	}

});