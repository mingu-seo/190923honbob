$(function(){
	//document.body.style.zoom = "90%";

	var gflag = false; 
	$('.gnb .depth1 > li').bind('mouseover',function(){
		if(gflag == false){
			$(this).find('.depth2').stop().slideDown(400);
			$(this).children('a').addClass('on');
		}
		gflag = true;
	}).bind('mouseleave',function(){
		if(gflag == true){
			$(this).children('a').removeClass('on');
			$(this).find('.depth2').stop().slideUp(400);
		}
		gflag = false;
	});



		$('.menu_btn').bind('click', function () {
			$('.allmenu_mo').stop().animate({'left':'0'},600);
			$('.mbg').addClass('on');
			$('html,body').css({'overflow':'hidden', 'height':'100%'});
			$('.allmenu_mo .mgnb').css({'overflow-y':'auto', 'position':'relative', 'height':'calc(100% - 130px)'});
		});
	
		$('.all_close').bind('click', function () {
			$('.allmenu_mo').stop().animate({'left':'-150%'},600);
			$('.mbg').removeClass('on');
		});
	
		$(function () {
			var $dep1 = $('.depth1'),
				$li = $dep1.find('li'),
				$dep2 = $dep1.find('depth2');
	
			$li.bind('click', function () {
				if ($(this).hasClass('on')) {
					$li.removeClass('on');
					$li.find('a').removeClass('on');
					$(this).removeClass('on');
					$(this).find('a').removeClass('on');
	
				} else {
					$li.removeClass('on');
					$li.find('a').removeClass('on');
					$(this).addClass('on');
					$(this).find('a').addClass('on');
				}
			});
	
		});
	


});

