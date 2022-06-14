// 모든 a링크에대해서 이동시 부드럽게 애니메이션 작동
$('a').click(function(){
	$('html, body').animate({
		scrollTop: $($.attr(this, 'href')).offset().top
	}, 200);
	return false;
});