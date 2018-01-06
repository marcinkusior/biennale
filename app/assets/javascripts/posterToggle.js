function posterOnOpen(){
	var poster = $('.poster');
	var url_length = $('.url').data('url').length
	var counter = 0;


	poster.ready( setPoster( ) )
	window.onresize = setPoster;

	$('.poster').click(function(){
		if( $(window).scrollTop() < 200 ){
			poster.css('transition', '1.2s');
			posterUp();
		}
	})



	$('body').bind('wheel', function(e){
		poster.css('transition', '1.2s');


		if( e.originalEvent.wheelDelta < 0 ){ counter = 0 }


		if ($(window).scrollTop() === 0 && e.originalEvent.wheelDelta > 0){
			counter > 3 ? posterDown() : counter = counter +1;
		}

		if( $('.down') && e.originalEvent.wheelDelta < 0 ){
			posterUp();
		}

		if( Math.round(poster.offset().top) > -(poster.height() ) && isFirefox === false ){
			window.onwheel = function(){ return false; }
		}

		if( Math.round( poster.offset().top ) == -(poster.height()) ){
			window.onwheel = function(){ return true; }
		}
	})


//	HELPERS
	function setPoster(callback){
		if(url_length > 4){
			posterUp();
		}else{
			posterDown();
		}

		if (callback && typeof(callback) === "function") { callback(); }
	}

	function posterUp(){
		value = '-' + poster.height().toString() +'px'
		poster.css('margin-top', value)
		poster.removeClass('down')


	}

	function posterDown(){
		poster.css('margin-top', '0')
		poster.addClass('down')
	}




}

