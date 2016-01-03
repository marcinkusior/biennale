function gmap(){

	var map;
	var info = $('#map-info');
	var lat = parseFloat(info.data('lat'));
	var lng = parseFloat( info.data('lng'));
	var zoom = info.data('zoom');
	console.log( lat );

	function initMap() {
	  map = new google.maps.Map(document.getElementById('map'), {
	    center: {lat: lat,  lng: lng },
	    zoom: zoom,
	    scrollwheel: false,
	    streetViewControl: false,
	    mapTypeControl: false,
	    zoomControlOptions: {
	      position: google.maps.ControlPosition.RIGHT_CENTER
	    },
	  });

	  $('#markers').children().each( function(idx, marker){
	    console.log(typeof parseFloat($(marker).data('lat')) )
	    addMarker( parseFloat($(marker).data('lat')), parseFloat( $(marker).data('lng') ), $(marker).data('desc') )
	  } )
	}

	initMap();

	var marker;
	function addMarker(lat, lng, title){
	  marker = new google.maps.Marker({
	    position: {lat: lat, lng: lng},
	    map: map,
	    title: title
	  })
	}

}