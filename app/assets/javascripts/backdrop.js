
	function backdrop( button ){
		button.click(function(event){
			event.preventDefault();
			$('.backdrop').addClass('cover');
		})

		$('.close').click(function(){
				$('.backdrop').removeClass('cover');
		})

			$('.mockupButton').click(function(){
				$(this).css('z-index', '-1');
				$('#archiveModal').css('overflow', 'scroll-y');
				$('.close').css('top', '20px');
				$('.archive-all').css({'opacity': '1', 'z-index': '1'});
				$('.archive-one').css({'opacity': '0', 'z-index': '-1'}).empty();
		})
	}