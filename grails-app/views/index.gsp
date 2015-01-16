<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <style type="text/css">
        #body-wrap { }
        #map-canvas { height: 600px; width: 800px; margin: 10px; float: left; border: 1px solid #808080; }
        #map-output { margin: 10px; float: left; border: 1px solid #808080; width: 250px; height: 600px; }
    </style>
    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?libraries=drawing&key=AIzaSyDFNVettz0sCxPVseEbOcutlru2jFirh5E">
    </script>
    <script type="text/javascript">
        var map;
        var markers = [];

        function initialize() {
            var haightAshbury = new google.maps.LatLng(37.7699298, -122.4469157);
            var mapOptions = {
                center: haightAshbury,
                zoom: 15
            };

            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

            var drawingManager = new google.maps.drawing.DrawingManager();
            drawingManager.setMap(map);

            google.maps.event.addListener(map, 'click', function(event) {
                addMarker(event.latLng);
            });
        }

        // Add a marker to the map and push to the array.
        function addMarker(location) {
            var marker = new google.maps.Marker({
                position: location,
                map: map
            });
            markers.push(marker);

            $("map-output").innerHTML = marker.getPosition();
            map.panTo(location);
        }

        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
</head>
<body>

<div id="body-wrap">
    <g:javascript library="application" />
    <r:layoutResources />

    <div id="map-canvas"></div>
    <div id="map-output"></div>
</div>

</body>
</html>