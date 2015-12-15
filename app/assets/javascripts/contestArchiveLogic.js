function contestArchiveLogic(){

	alldata = [];
	text = [];
	var locale = $('body').data('locale');
	var body = $('.recordBody').empty();
	var moreImg = $('#more-images');

	$('.archive_select').click(function(){
		var val = $(this).val();
		$('.archive_select').val(val);
	})


	$('.archive button:not(#more-images)').click(function( ){ 
		var val = $(this).prev().val() ;
  	body.attr('current', val)
  	var more = $('#more-images');
		more.css('opacity', '0')
		more.animate({
			'opacity': '1'
		}, 900)
		$.ajax( {
		  type: "GET",
		  url: "/archives/fetch_contest_records",
		  dataType: "JSON",
		  data: { 'archive_id': val, 'limit': 5, 'offset': 0},
		  success: function(data) {
		  	body.empty();
		    alldata = data;
		    data.length < 5 ? moreImg.css('display', 'none') : moreImg.css('display', 'block');
		    data.forEach( function(object){
					body.append("<img class='archive-image' data-toggle='modal' data-target='#archiveModal' style= 'order: -1; -webkit-order: -1;background-image: url("+ object.src.gallery.url +")' data-id="+ object.contest_record_id +" >");
		    })
		    for(i=0; i<4; i++){
		    	body.append("<img class='blank'>")
		    }

		   imageHandlers();
	    } // end success:
		  }
		);
	})


	moreImg.click(function(event){
		val =  body.attr('current');
		var offset = $('.recordBody').children('.archive-image').length;
		console.log(offset);
		$.ajax( {
		  type: "GET",
		  url: "/archives/fetch_contest_records",
		  dataType: "JSON",
		  data: { 'archive_id': val, 'limit': 5, 'offset': offset},
		  success: function(data) {	
		  	console.log(data);
		    alldata = data;
		    data.length < 5 ? moreImg.css('display', 'none') : moreImg.css('display', 'block');
		    data.forEach( function(object){
					body.append("<img class='archive-image' data-toggle='modal' data-target='#archiveModal' style= 'background-image: url("+ object.src.gallery.url +")' data-id="+ object.contest_record_id +" >");
		    } )
		   imageHandlers();
	    } // end success:
		  }
		);
	})


	function imageHandlers(){
		var one = $('.archive-one')
		var topOffset;
		$('.archive-image').click(function(){
			var modal = $('#archiveModal')
			topOffset = (modal.scrollTop()).toString() + 'px';
			var modalHeight = (modal.height()).toString() + 'px';
			modal.data('topOffset', topOffset);
			var val = $(this).data('id');
			$('.archive-all').css({'opacity': '0', 'z-index': '-10', 'max-height': '210px' });

			one.css({'opacity': '1', 'z-index': '1', 'top':  topOffset});
			$('.mockupButton').css({'z-index': '11', 'top': topOffset});
			$('.close').css('top', topOffset);
			archiveOneFill(val, one);
		})
	}

	function archiveOneFill(val, one){
		console.log($('body').data('locale'));
		$.ajax( {
		  type: "GET",
		  url: "/archives/fetch_record_images",
		  dataType: "JSON",
		  data: { 'record_id': val, 'locale': $('body').data('locale') },
		  success: function(data) {
		  	one.empty();
		  	one.append( data[0] );
		    data[1].forEach( function(object){
					one.append("<img class='one-image' src= '"+ object.src.big.url +"'>");
		    } )
	    } // end success:
	  })
	}

}