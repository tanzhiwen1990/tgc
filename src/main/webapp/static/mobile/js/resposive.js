

    document.addEventListener('DOMContentLoaded', function () {
        var html = document.documentElement;
        var windowWidth = html.clientWidth;
        html.style.fontSize = windowWidth / 7.5 + 'px';
		// html.style.fontSize = windowWidth / 640 * 100 + 'px';
    }, false);


$(function(){
	$('.nav-btn').click(function(){
		$('.heard-nav').hasClass('active')?$('.heard-nav').removeClass('active'):$('.heard-nav').addClass('active')
	})
	$(window).scroll(function(){
			if($(window).scrollTop()>($(window).height()/2)){
				$('.heard-nav').removeClass('active')
			}else{
				$('.m-top-btn').removeClass('fixed');
			}
		})
		$('.m-top-btn').click(function(){
			$('body,html').animate({ scrollTop: 0 }, 500);
		})
})