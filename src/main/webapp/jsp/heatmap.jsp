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
      <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=visualization"></script>

    <script>
 // Adding 500 Data Points
    var map, pointarray, heatmap;

    var taxiData = [
                    <c:forEach var="log" items="${logs}">
      new google.maps.LatLng(${log.deviceLocation}),
      </c:forEach>
      new google.maps.LatLng(37.782745, -122.444586)
     
    ];

    function initialize() {
      var mapOptions = {
        zoom: 12,
        center: new google.maps.LatLng(31.552111, 74.354389)
        
      };

      map = new google.maps.Map(document.getElementById('map-canvas'),
          mapOptions);

      var pointArray = new google.maps.MVCArray(taxiData);

      heatmap = new google.maps.visualization.HeatmapLayer({
        data: pointArray
      });

      heatmap.setMap(map);
      heatmap.set('radius', 20);
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