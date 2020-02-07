$(function() {
			$('.depth1 > li').on('mouseenter',function() {
				$(this).find('.depth2').stop().slideDown(300);
			}).on('mouseleave',function(){
				$(this).find('.depth2').stop().slideUp(300);
			});
			
			var swiper = new Swiper('.swiper', {
	            slidesPerView:'auto',
	            loop:true,
	            navigation: {
	            nextEl: '.swiper-button-next',
	            prevEl: '.swiper-button-prev',
	            },
	            pagination: {
	                el: '.swiper-pagination',
	            },
	        });
			
			var popTop = ($(window).height()-$('.divPop').outerHeight())/2+$(window).scrollTop();
			var popLeft = ($(window).width()-$('.divPop').outerWidth())/2+$(window).scrollLeft();
			
			$('.divPop').css({
				'top':popTop+'px',
				'left':popLeft+'px'
			});
			$('.divPop').draggable();
			
			var banner = new Swiper(".banner-swiper",{
				slidesPerView:5,
				sildesPerGroup:1,
				spaceBetween:20,
				loop:true,
				autoplay:{
					delay:2000,
					disableOnInteration:false
				}
			});
			var quick_left = $('.menu>ul:first-child').position().left + 1200;
			$('.quickMenu').css({
				top:112,
				left:quick_left
			});
			$(window).resize(function(){
				quick_left = $('.menu>ul:first-child').position().left + 1200;
				$('.quickMenu').css({
					left:quick_left
				});
				
			});
			$(window).scroll(function(){
				var top=$(window).scrollTop();
				$('.quickMenu').stop().animate({
					'top' : top+112+'px'
				},300);
			});
			$('.goTop').click(function(){
				$("html").animate({scrollTop:0},300);
			});
			$('.board_title').click(function(){
				var idx = $(this).index('.board_title');
				$('.board_title').removeClass('on');
				$(this).addClass('on');
				if(idx==0){
					$('#board_notice').show();
					$('#board_data').hide();
					
				}else{
					$('#board_notice').hide();
					$('#board_data').show();
				}
			});
			$('.main>.size>.section>img').on('mouseenter',function() {
				this.style.margin='0px 0px 0px 0px';
				this.style.border='10px solid #000';
				
			}).on('mouseleave',function(){
				this.style.margin='10px 10px 10px 10px';
				this.style.border='0px';
			});
			$('#popClose').click(function(){
				$('.divPop').hide();
			});
						
		});