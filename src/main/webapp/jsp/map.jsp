<%@include file="include/taglib.jsp"%>
<!doctype html>
<html class="no-js" lang="">


<head>
<%@include file="include/head.jsp"%>
 <style>
      html, body, #map-canvas ,.main-content{
        height: 100%;
        margin: 0px;
        padding: 0px
      }
       .gmnoprint img {
    max-width: none; 
}
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script>
function initialize() {
  var myLatlng = new google.maps.LatLng(31.552111, 74.354389);
  var mapOptions = {
    zoom: 13,
    center: myLatlng
  }
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  <c:forEach var="atm" items="${atms}">
  var latlng = new google.maps.LatLng(${atm.geolocation});
  var marker = new google.maps.Marker({
      position: latlng,
      map: map,
      title: '${atm.name}'
  });
  </c:forEach>
}

	



google.maps.event.addDomListener(window, 'load', initialize);

    </script>



</head>



<body>
	<%@include file="include/topnavigation.jsp"%>
	<%@include file="include/leftnavigation.jsp"%>
	<!-- main content -->
	<section class="main-content">

		<!-- content wrapper -->
		

			<div id="map-canvas"></div>
			
		
		
		<!-- /content wrapper -->
		<a class="exit-offscreen"></a>
	</section>
	<!-- /main content -->

	<%@include file="include/footer.jsp"%>