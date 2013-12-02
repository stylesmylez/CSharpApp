﻿// JScript File
var markers = new fMarkers();
var polylines = new fPolylines();
var polygons = new fPolygons();
var map;
var trafficInfo = null;
var gdir;
//var geocoder = null;
var addressMarker;
var returned_result = null;
var infowindow = null;

//if (GBrowserIsCompatible())
//{
    //map = new GMap2(document.getElementById("GoogleMap_Div"));
    var mylatlng =new google.maps.LatLng(42,-87);
    var myOptions = {
        zoom: 4,
        center: mylatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("GoogleMap_Div"), myOptions);
    infowindow = new google.maps.InfoWindow();
    function MapClickFunction(position) {
        if (position) {
            //Pass latitude longitude values as comma separated
            RaiseEvent('MapClicked', position.latLng.lat() + "," + position.latLng.lng());
        }
    }

    function PolylineClickFunction(latlng) {
        if (latlng) {
            //Pass latitude longitude values as comma separated
            //RaiseEvent('MapClicked', latlng.lat() + "," + latlng.lng());
            alert("Polyline clicked at " + latlng.lat() + "," + latlng.lng());
        }
    }

    function ZoomChangeFunction(overlay, latlng) {
            //alert(map.getZoom());
            RaiseEvent('ZoomChanged', map.getZoom());
    }

    function fGetGoogleObject(result, userContext)
    {
        returned_result = result;
        map.setCenter(new google.maps.LatLng(result.CenterPoint.Latitude, result.CenterPoint.Longitude));
        
        map.setZoom(result.ZoomLevel);

        if(result.ShowMapTypesControl)
        {
            //**map.addControl(new google.maps.GMapTypeControl());
        }

        if(result.ShowZoomControl)
        {
           //** map.addControl(new GLargeMapControl());
        }
        
        
        //map.setMapTypeId(result.MapType);

        google.maps.event.addListener(map, "click", MapClickFunction);
        google.maps.event.addListener(map, "zoomend", ZoomChangeFunction);
        
        var i;
        if(markers!=null)
        {
            for(i=0;i<markers.getLength();i++)
            {
                var cmark = markers.getValue(i);
                if(cmark !=null)
                {
                        cmark.setMap(null);
                }
            }
        }
    //    if(myEventListeners!=null)
    //    {
    //        for(i=0;i<myEventListeners.getLength();i++)
    //        {
    //            var lisnr = myEventListeners.getValue(i);
    //            if(lisnr!=null)
    //            {
    //                GEvent.removeListener(lisnr);
    //            }
    //        }
    //    }  
        markers = new fMarkers();
    //    myEventListeners = new fListeners();

        for(i=0;i<result.Points.length;i++)
        {
            var myIcon_google;

            var myPoint = new google.maps.LatLng(result.Points[i].Latitude, result.Points[i].Longitude);
            
            myIcon_google = null;
            if(result.Points[i].IconImage!='')
            {
                //myIcon_google = new GIcon(G_DEFAULT_ICON);
                myIcon_google = new Object();
                markerOptions = { icon:myIcon_google };
                
                //myIcon_google.iconSize = new GSize(result.Points[i].IconImageWidth,result.Points[i].IconImageHeight);
                myIcon_google.image = result.Points[i].IconImage;
                myIcon_google.shadow = result.Points[i].IconShadowImage;
                //myIcon_google.shadowSize = new GSize(result.Points[i].IconShadowWidth, result.Points[i].IconShadowHeight);
                //myIcon_google.iconAnchor =  new GPoint(result.Points[i].IconAnchor_posX, result.Points[i].IconAnchor_posY);
                //myIcon_google.infoWindowAnchor = new GPoint(result.Points[i].InfoWindowAnchor_posX, result.Points[i].InfoWindowAnchor_posY);
            }
           
            var marker = CreateMarker(myPoint,myIcon_google,result.Points[i].InfoHTML,result.Points[i].Draggable,result.Points[i].ToolTip);
            marker.value = result.Points[i].ID;
            markers.pushValue(marker);
            //map.addOverlay(markers.getLastValue());

        }
        //Add polylines
       // alert('adding polyline');

        polylines = new fPolylines();
        for(i=0;i<result.Polylines.length;i++)
        {
	     var polypoints = new Array();
	     var j;
	     for(j=0;j<result.Polylines[i].Points.length;j++)
 	     {
 	         polypoints.push(new google.maps.LatLng(result.Polylines[i].Points[j].Latitude, result.Polylines[i].Points[j].Longitude));
	     }
            var polyline = CreatePolyline(polypoints,result.Polylines[i].ColorCode,result.Polylines[i].Width,result.Polylines[i].Geodesic);
            polylines.pushValue(polyline,result.Polylines[i].ID);
            //map.addOverlay(polylines.getLastValue());

            //GEvent.addListener(polylines.getLastValue(), "click", function(latlng) { alert("Polyline clicked at " + latlng.lat() + "," + latlng.lng()); });
            
        }
    // var polypoints = new Array();
    // polypoints.push(new GLatLng(43.65669, -79.44268));
    // polypoints.push(new GLatLng(43.66619, -79.44268));
    // var poly = CreatePolyline(polypoints,"#66FF00",10,true);
    // map.addOverlay(poly);

    // var polypoints = new Array();
    // polypoints.push(new GLatLng(43.65669, -79.44268));
    // polypoints.push(new GLatLng(43.66619, -79.44268));
    // polypoints.push(new GLatLng(43.67619, -79.44268));
    // var directions = new GDirections(map,document.getElementById("directions_canvas")); 
    //Clear the mapa nd directions of any old information
    //directions.clear();

    //Load the map and directions from the specified waypoints
    //directions.loadFromWaypoints(polypoints);


        polygons = new fPolygons();
        for(i=0;i<result.Polygons.length;i++)
        {
	     var polypoints = new Array();
	     var j;
	     for(j=0;j<result.Polygons[i].Points.length;j++)
 	     {
	 	    polypoints.push(new google.maps.LatLng(result.Polygons[i].Points[j].Latitude, result.Polygons[i].Points[j].Longitude));
	     }
            var polygon = CreatePolygon(polypoints,result.Polygons[i].StrokeColor,result.Polygons[i].StrokeWeight,result.Polygons[i].StrokeOpacity,result.Polygons[i].FillColor,result.Polygons[i].FillOpacity);
            polygons.pushValue(polygon,result.Polygons[i].ID);
            //map.addOverlay(polygons.getLastValue());
        }


        if (result.ShowTraffic) {
            trafficInfo = new google.maps.TrafficLayer();
            trafficInfo.setMap(map);
        }
        if (result.AutomaticBoundaryAndZoom)
        {
            RecenterAndZoom(true,result);
        }

	    //Direction: if the ShowDirection is true then load the listeners and call the Direction API
        if (result.Directions.Addresses.length > 1) {
            var directionsService = new google.maps.DirectionsService();

            var renderOptions = {suppressMarkers:result.Directions.HideMarkers};
            var directionDisplay = new google.maps.DirectionsRenderer(renderOptions);

            //set the directions display service to the map
            directionDisplay.setMap(map);
            //set the directions display panel
            //panel is usually just and empty div.  
            //This is where the turn by turn directions appear.

        if (result.Directions.ShowDirectionInstructions) {
            //Direction
            //gdir = new GDirections(map, document.getElementById("directions_canvas"));
            directionDisplay.setPanel(document.getElementById("directions_canvas"));
        }

            //GEvent.addListener(gdir, "load", onGDirectionsLoad);
            //GEvent.addListener(gdir, "error", onGDirectionsErrors);
            //gdir.load("from: " + result.Directions.Addresses[0] + " to: " + result.Directions.Addresses[1], { "locale": result.Directions.Locale });

            var waypoints = [];
            var from_address;
            var to_address;
            from_address = result.Directions.Addresses[0];
            to_address = result.Directions.Addresses[result.Directions.Addresses.length-1];
            for (var i = 2; i < result.Directions.Addresses.length-1; i++) {
                    address=result.Directions.Addresses[i];
                    if (address !== "") {
                        waypoints.push({location: address, stopover: true});
                    }
                }

            var request = {
                origin: from_address,
                destination: to_address,
                waypoints: waypoints, //an array of waypoints
                optimizeWaypoints: true, //set to true if you want google to determine the shortest route or false to use the order specified.
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            };

            //get the route from the directions service
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {

                    directionDisplay.setDirections(response);

                }
                else {
                    //handle error
                }
            });
        }
    }

function DrawGoogleMap()
{
    //if (GBrowserIsCompatible())
    //{
    map = new google.maps.Map(document.getElementById("GoogleMap_Div"), myOptions);
    //geocoder = new GClientGeocoder();
  
     GService.GetGoogleObject(fGetGoogleObject);
    //} 
} 

 
function fGetGoogleObjectOptimized(result, userContext)
{
    returned_result = result;
    if (result.RecenterMap)
    {
        map.setCenter(new google.maps.LatLng(result.CenterPoint.Latitude, result.CenterPoint.Longitude));
        GService.RecenterMapComplete();
    }
    
    //**map.setMapType(eval(result.MapType));

    if(result.ShowTraffic)
    {
        trafficInfo = new google.maps.TrafficLayer();
        trafficInfo.setMap(map);
    }
    else
    {
        if(trafficInfo!=null) {
            
            trafficInfo.setMap(null);
        }
    }

    var i;
    for(i=0;i<result.Points.length;i++)
    {
        //Create icon
        var myIcon_google;

        var myPoint = new google.maps.LatLng(result.Points[i].Latitude, result.Points[i].Longitude);
        
        myIcon_google = null;
        if(result.Points[i].IconImage!='')
        {
            //myIcon_google = new GIcon(G_DEFAULT_ICON);
            myIcon_google = new Object();
            markerOptions = { icon: myIcon_google };

            //myIcon_google.iconSize = new GSize(result.Points[i].IconImageWidth,result.Points[i].IconImageHeight);
            myIcon_google.image = result.Points[i].IconImage;
            myIcon_google.shadow = result.Points[i].IconShadowImage;
            //myIcon_google.shadowSize = new GSize(result.Points[i].IconShadowWidth, result.Points[i].IconShadowHeight);
            //myIcon_google.iconAnchor =  new GPoint(result.Points[i].IconAnchor_posX, result.Points[i].IconAnchor_posY);
            //myIcon_google.infoWindowAnchor = new GPoint(result.Points[i].InfoWindowAnchor_posX, result.Points[i].InfoWindowAnchor_posY);
        }
        //Existing marker, but changed.
        if(result.Points[i].PointStatus=='C')
        {
            var marker = markers.getValueById(result.Points[i].ID);
            if(marker!=null)
            {
                ChangeMarker(marker, myPoint, myIcon_google, result.Points[i].InfoHTML, result.Points[i].Draggable, result.Points[i].ToolTip);
                //marker.value = result.Points[i].ID;
                //markers.pushValue(marker);
            }
            //map.addOverlay(markers.getLastValue());
        }
        //New Marker
        if(result.Points[i].PointStatus=='N')
        {
            var marker = CreateMarker(myPoint,myIcon_google,result.Points[i].InfoHTML,result.Points[i].Draggable,result.Points[i].ToolTip);
            marker.value = result.Points[i].ID;
            markers.pushValue(marker);
            //map.addOverlay(markers.getLastValue());
        }
        //Existing marker, but deleted.
        if(result.Points[i].PointStatus=='D')
        {
            var marker = markers.getValueById(result.Points[i].ID);
            if(marker!=null)
            {
                markers.removeValueById(result.Points[i].ID);
                //map.removeOverlay(marker);
                marker.setMap(null);
            }
        }
    }
    
    //Get Polylines
    for(i=0;i<result.Polylines.length;i++)
    {
        //Existing marker, but changed.
        
        if(result.Polylines[i].LineStatus=='C')
        {
        
            var polyline = polylines.getValueById(result.Polylines[i].ID);
            if(polyline!=null)
            {
                polylines.removeValueById(result.Polylines[i].ID);
                //map.removeOverlay(polyline);
                polyline.setMap(null);
            }
	        var polypoints = new Array();
	        var j;
	        for(j=0;j<result.Polylines[i].Points.length;j++)
 	        {
 	            polypoints.push(new google.maps.LatLng(result.Polylines[i].Points[j].Latitude, result.Polylines[i].Points[j].Longitude));
	        }
            var polyline = CreatePolyline(polypoints,result.Polylines[i].ColorCode,result.Polylines[i].Width,result.Polylines[i].Geodesic);
            polylines.pushValue(polyline,result.Polylines[i].ID);
            //map.addOverlay(polylines.getLastValue());
        }
        //New Marker

        if(result.Polylines[i].LineStatus=='N')
        {
	        var polypoints = new Array();
	        var j;
	        for(j=0;j<result.Polylines[i].Points.length;j++)
 	        {
 	            polypoints.push(new google.maps.LatLng(result.Polylines[i].Points[j].Latitude, result.Polylines[i].Points[j].Longitude));
	        }
            var polyline = CreatePolyline(polypoints,result.Polylines[i].ColorCode,result.Polylines[i].Width,result.Polylines[i].Geodesic);
            polylines.pushValue(polyline,result.Polylines[i].ID);
            //map.addOverlay(polylines.getLastValue());
        }
        //Existing marker, but deleted.
        if(result.Polylines[i].LineStatus=='D')
        {
            var polyline = polylines.getValueById(result.Polylines[i].ID);
            if(polyline!=null)
            {
                polylines.removeValueById(result.Polylines[i].ID);
                //map.removeOverlay(polyline);
                polyline.setMap(null);
            }
        }
    }
    
        //Get Polygons
    for(i=0;i<result.Polygons.length;i++)
    {
        //Existing marker, but changed.

        if(result.Polygons[i].Status=='C')
        {
        
            var polygon = polygons.getValueById(result.Polygons[i].ID);
            if(polygon!=null)
            {
                polygons.removeValueById(result.Polygons[i].ID);
                //map.removeOverlay(polygon);
                polygon.setMap(null);
            }
	        var polypoints = new Array();
	        var j;
	        for(j=0;j<result.Polygons[i].Points.length;j++)
 	        {
 	            polypoints.push(new google.maps.LatLng(result.Polygons[i].Points[j].Latitude, result.Polygons[i].Points[j].Longitude));
	        }
            var polygon = CreatePolygon(polypoints,result.Polygons[i].StrokeColor,result.Polygons[i].StrokeWeight,result.Polygons[i].StrokeOpacity,result.Polygons[i].FillColor,result.Polygons[i].FillOpacity);
            polygons.pushValue(polygon,result.Polygons[i].ID);
            //map.addOverlay(polygons.getLastValue());
        }
        //New Marker

        if(result.Polygons[i].Status=='N')
        {
	        var polypoints = new Array();
	        var j;
	        for(j=0;j<result.Polygons[i].Points.length;j++)
 	        {
 	            polypoints.push(new google.maps.LatLng(result.Polygons[i].Points[j].Latitude, result.Polygons[i].Points[j].Longitude));
	        }
            var polygon = CreatePolygon(polypoints,result.Polygons[i].StrokeColor,result.Polygons[i].StrokeWeight,result.Polygons[i].StrokeOpacity,result.Polygons[i].FillColor,result.Polygons[i].FillOpacity);
            polygons.pushValue(polygon,result.Polygons[i].ID);
            //map.addOverlay(polygons.getLastValue());
            polygon.setMap(null);
        }
        //Existing marker, but deleted.
        if(result.Polygons[i].Status=='D')
        {
            var polygon = polygons.getValueById(result.Polygons[i].ID);
            if(polygon!=null)
            {
                polygons.removeValueById(result.Polygons[i].ID);
                //map.removeOverlay(polygon);
                polygon.setMap(null);
            }
        }
    }
    
    if(result.AutomaticBoundaryAndZoom)
    {
        RecenterAndZoom(true,result);
    }

    //Direction: if the ShowDirection is true then load the listeners and call the Direction API
    if (result.Directions.Addresses.length > 1) {
        var directionsService = new google.maps.DirectionsService();

        var renderOptions = { suppressMarkers: result.Directions.HideMarkers };
        var directionDisplay = new google.maps.DirectionsRenderer(renderOptions);

        //set the directions display service to the map
        directionDisplay.setMap(map);
        //set the directions display panel
        //panel is usually just and empty div.  
        //This is where the turn by turn directions appear.

        if (result.Directions.ShowDirectionInstructions) {
            //Direction
            //gdir = new GDirections(map, document.getElementById("directions_canvas"));
            directionDisplay.setPanel(document.getElementById("directions_canvas"));
        }

        //GEvent.addListener(gdir, "load", onGDirectionsLoad);
        //GEvent.addListener(gdir, "error", onGDirectionsErrors);
        //gdir.load("from: " + result.Directions.Addresses[0] + " to: " + result.Directions.Addresses[1], { "locale": result.Directions.Locale });

        var waypoints = [];
        var from_address;
        var to_address;
        from_address = result.Directions.Addresses[0];
        to_address = result.Directions.Addresses[result.Directions.Addresses.length - 1];
        for (var i = 2; i < result.Directions.Addresses.length - 1; i++) {
            address = result.Directions.Addresses[i];
            if (address !== "") {
                waypoints.push({ location: address, stopover: true });
            }
        }

        var request = {
            origin: from_address,
            destination: to_address,
            waypoints: waypoints, //an array of waypoints
            optimizeWaypoints: true, //set to true if you want google to determine the shortest route or false to use the order specified.
            travelMode: google.maps.DirectionsTravelMode.DRIVING
        };

        //get the route from the directions service
        directionsService.route(request, function (response, status) {
            if (status == google.maps.DirectionsStatus.OK) {

                directionDisplay.setDirections(response);

            }
            else {
                //handle error
            }
        });
    }
}
//}

//This function causes Recentering of map. It finds all visible markers on map and decides center point and zoom level based on these markers.
function RecenterAndZoom(bRecenter,result)
{
    if(bRecenter)
    {
        //Check if there is any visible pushpin on map.
        var cnt = 0;
        bounds = new google.maps.LatLngBounds();
        for(var i=0;i<markers.getLength();i++)
        {
            if (markers.markers[i].getVisible())
                {
                    bounds.extend(markers.markers[i].getPosition());
                    //Increment visible pushpin count
                    cnt++;
                }
        }
        //var iZoomLevel = map.getBoundsZoomLevel(bounds);
        //var point = bounds.getCenter();
        
        //if(iZoomLevel>14)
       // {
       //     iZoomLevel = 14;
       // }
        
        if (!AreMarkersWithinMapBounds()) {
            //map.setZoom(iZoomLevel);
            if (cnt > 0) {
                map.fitBounds(bounds);
                //map.panToBounds(bounds);
                //map.setZoom(map.getZoom() + 1);
            }
            //map.setCenter(point);
        }
    }
}

function AreMarkersWithinMapBounds() {
var map_bounds = map.getBounds();
//for ( var i = 0; i<map_bounds.length; ++i)
if (map_bounds)
{

    for ( var j = 0; j < markers.markers.length; ++j)
    {
        var lat = markers.markers[j].getPosition().lat();
        var lng = markers.markers[j].getPosition().lng();
        if (lat > map_bounds.getSouthWest().lat()   && lat < map_bounds.getNorthEast().lat() &&
            lng > map_bounds.getSouthWest().lng() && lng < map_bounds.getNorthEast().lng()) {

       }
       else {
           return false;
       }
       
       // marker within cell, do whatever you need to do
    }
}
return true;
}

function onGDirectionsErrors() {
    if (gdir.getStatus().code == G_GEO_UNKNOWN_ADDRESS)
        alert("No corresponding geographic location could be found for one of the specified addresses. This may be due to the fact that the address is relatively new, or it may be incorrect.\nError code: " + gdir.getStatus().code);
    else if (gdir.getStatus().code == G_GEO_SERVER_ERROR)
        alert("A geocoding or directions request could not be successfully processed, yet the exact reason for the failure is not known.\n Error code: " + gdir.getStatus().code);

    else if (gdir.getStatus().code == G_GEO_MISSING_QUERY)
        alert("The HTTP q parameter was either missing or had no value. For geocoder requests, this means that an empty address was specified as input. For directions requests, this means that no query was specified in the input.\n Error code: " + gdir.getStatus().code);

    //   else if (gdir.getStatus().code == G_UNAVAILABLE_ADDRESS)  <--- Doc bug... this is either not defined, or Doc is wrong
    //     alert("The geocode for the given address or the route for the given directions query cannot be returned due to legal or contractual reasons.\n Error code: " + gdir.getStatus().code);

    else if (gdir.getStatus().code == G_GEO_BAD_KEY)
        alert("The given key is either invalid or does not match the domain for which it was given. \n Error code: " + gdir.getStatus().code);

    else if (gdir.getStatus().code == G_GEO_BAD_REQUEST)
        alert("A directions request could not be successfully parsed.\n Error code: " + gdir.getStatus().code);

    else alert("An unknown error occurred.");
}

function onGDirectionsLoad() {
    if (this.getStatus().code == G_GEO_SUCCESS)  //200
    {
    //If HideMarkers property is true
        if (returned_result.Directions.HideMarkers) {
            //Remove default icons and markers that comes with direction
            for (var i = 0; i < this.getNumGeocodes(); i++) {
                //Store first and last marker for GPX download
                if (this.getMarker(i) != undefined) {
                    this.getMarker(i).showMapBlowup = false;
                    //markers.getValue(i).showMapBlowup = false;
                    this.getMarker(i).getIcon().image = "";
                    this.getMarker(i).getIcon().shadow = "";
                    this.getMarker(i).getIcon().iconSize = new GSize(0, 0);
                    this.getMarker(i).getIcon().shadowSize = new GSize(0, 0);
                }
            }
        }
        var polyline = this.getPolyline();
        polyline.color = returned_result.Directions.PolylineColor;
        polyline.opacity = returned_result.Directions.PolylineOpacity;
        polyline.weight = returned_result.Directions.PolylineWeight;
        //polyline.redraw(true);
        polyline.setStrokeStyle({ color: returned_result.Directions.PolylineColor, weight: returned_result.Directions.PolylineWeight, opacity: returned_result.Directions.PolylineOpacity });
    }
    // Use this function to access information about the latest load()
    // results.

    //var distanceMeter = gdir.getDistance().meters;
    //var distanceHtml = gdir.getDistance().html;
    //var durationSec = gdir.getDuration().seconds;
    //var durationHtml = gdir.getDuration().html;

    //alert(distanceHtml);
}

function endRequestHandler(sender, args)
{
    GService.GetOptimizedGoogleObject(fGetGoogleObjectOptimized);
}
function pageLoad()
{
    if(!Sys.WebForms.PageRequestManager.getInstance().get_isInAsyncPostBack())
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequestHandler);
}

function IgnoreZeroLatLongs(bIgnore) {
    //Check if there is any visible pushpin on map.
    var cnt = 0;
    bounds = new GLatLngBounds();
    for (var i = 0; i < markers.getLength(); i++) {
        var ignoremarker = false;
        var point1 = markers.markers[i].getPoint();
        if (bIgnore) {
            if ((point1.x == 0) && (point1.y == 0)) {
                ignoremarker = true;
            }
        }
        if (!ignoremarker) {
            if (!markers.markers[i].isHidden()) {
                bounds.extend(markers.markers[i].getPoint());
                //Increment visible pushpin count
                cnt++;
            }
        }

    }
    var iZoomLevel = map.getBoundsZoomLevel(bounds);
    var point = bounds.getCenter();

    map.setZoom(iZoomLevel);
    map.setCenter(point);

}

function ShowFullScreenMap() {

    var objButton = document.getElementById('btnFullScreen');
    if (objButton.value == 'Full Screen') {
        var objMap = document.getElementById('GoogleMap_Div');
        var objDiv = document.getElementById('GoogleMap_Div_Container');
        objMap.style.width = '100%';
        objMap.style.height = '100%';

        objDiv.style.position = 'absolute';
        objDiv.style.left = '0px';
        objDiv.style.top = '0px';
        objDiv.style.width = '99%';
        objDiv.style.height = '95%';
        objDiv.style.backgroundColor = 'LightGrey';

        objButton.value = 'Close Fullscreen';
        DrawGoogleMap();
    }
    else {
        var objMap = document.getElementById('GoogleMap_Div');
        var objDiv = document.getElementById('GoogleMap_Div_Container');
        objMap.style.width = '<%=GoogleMapObject.Width %>';
        objMap.style.height = '<%=GoogleMapObject.Height %>';

        objDiv.style.position = '';
        objDiv.style.left = '';
        objDiv.style.top = '';
        objDiv.style.width = '';
        objDiv.style.height = '';

        objButton.value = 'Full Screen';
        //DrawGoogleMap();
    }
}


//function fListeners()
//{
//    this.listeners = new Array();
//    this.getLength = function() { return this.listeners.length; };
//    this.pushValue = function(v) { this.listeners.push(v); }
//    this.getValue = function(i)  { return this.listeners[i]; }
//}
function fMarkers() {
    this.markers = new Array();
    this.getLength = function() { return this.markers.length; };
    this.pushValue = function(v) { this.markers.push(v); }
    this.getValue = function(i) { return this.markers[i]; }
    this.getLastValue = function() { return this.markers[this.markers.length - 1]; }
    this.getValueById = function(ID) {
        var i;
        for (i = 0; i < this.markers.length; i++) {
            if (this.markers[i].value == ID) {
                // alert('marker found : '+this.markers[i].value);
                return this.markers[i];
            }
        }
        return null;
    }
    this.removeValueById = function(ID) {
        var i;
        for (i = 0; i < this.markers.length; i++) {
            if (this.markers[i].value == ID) {
                // alert('marker found : '+this.markers[i].value);
                this.markers.splice(i, 1);
                //alert('changed marker removed');

            }
        }
        return null;
    }
}

function fPolylines() {
    this.polylines = new Array();
    this.polylinesID = new Array();
    this.getLength = function() { return this.polylines.length; };
    this.pushValue = function(v, ID) { this.polylines.push(v); this.polylinesID.push(ID); }
    this.getValue = function(i) { return this.polylines[i]; }
    this.getLastValue = function() { return this.polylines[this.polylines.length - 1]; }
    this.getValueById = function(ID) {
        var i;
        for (i = 0; i < this.polylinesID.length; i++) {
            if (this.polylinesID[i] == ID) {
                // alert('polyline found : '+this.polylines[i].value);
                return this.polylines[i];
            }
        }
        return null;
    }
    this.removeValueById = function(ID) {
        var i;
        for (i = 0; i < this.polylinesID.length; i++) {
            if (this.polylinesID[i] == ID) {
                this.polylines.splice(i, 1);
                this.polylinesID.splice(i, 1);
            }
        }
        return null;
    }
}

function fPolygons() {
    this.polygons = new Array();
    this.polygonsID = new Array();
    this.getLength = function() { return this.polygons.length; };
    this.pushValue = function(v, ID) { this.polygons.push(v); this.polygonsID.push(ID); }
    this.getValue = function(i) { return this.polygons[i]; }
    this.getLastValue = function() { return this.polygons[this.polygons.length - 1]; }
    this.getValueById = function(ID) {
        var i;
        for (i = 0; i < this.polygonsID.length; i++) {
            if (this.polygonsID[i] == ID) {
                return this.polygons[i];
            }
        }
        return null;
    }
    this.removeValueById = function(ID) {
        var i;
        for (i = 0; i < this.polygonsID.length; i++) {
            if (this.polygonsID[i] == ID) {
                this.polygons.splice(i, 1);
                this.polygonsID.splice(i, 1);
            }
        }
        return null;
    }
}

function CreateMarker(point, icon1, InfoHTML, bDraggable, sTitle) {
    var marker;
    var icon2 = null;
    if (icon1 != null)
        icon2 = icon1.image;
    marker = new google.maps.Marker({position: point, map: map, icon: icon2, draggable: bDraggable, title: sTitle });
    if (InfoHTML != '') {
        google.maps.event.addListener(marker, "click", function () { OpenInfoWindow(this.value, InfoHTML); RaiseEvent('PushpinClicked', this.value); });
    }
    google.maps.event.addListener(marker, "dragend", function () { GService.SetLatLon(this.value, this.position.lat(), this.position.lng()); RaiseEvent('PushpinDrag', this.value); });
    return marker;
}

function ChangeMarker(marker, point, icon1, InfoHTML, bDraggable, sTitle) {
    var icon2 = null;
    if (icon1 != null)
        icon2 = icon1.image;
    marker.setPosition(point);
    marker.setIcon(icon2);
    marker.setDraggable(bDraggable);
    marker.setTitle(sTitle);
    if (InfoHTML != '') {
        google.maps.event.addListener(marker, "click", function () { OpenInfoWindow(this.value, InfoHTML); RaiseEvent('PushpinClicked', this.value); });
    }
    else {
        google.maps.event.clearListeners(marker, 'click');
    }
}

function OpenInfoWindow(id, InfoHTML) {

    var marker = markers.getValueById(id);
    if (marker != null) {
        OpenInfoWindowUsingLatLng(marker.getPosition(),InfoHTML);
    }
}

function CreatePolyline(points, color, width, isgeodesic) {
    var polyline = new google.maps.Polyline({
        path: points,
        strokeColor: color,
        strokeOpacity: 1.0,
        strokeWeight: width
    });

    polyline.setMap(map); return polyline;
}

function CreatePolygon(points, strokecolor, strokeweight, strokeopacity, fillcolor, fillopacity) {
    var polygon;

   // var polygon = new GPolygon(points, strokecolor, strokeweight, strokeopacity, fillcolor, fillopacity);
    polygon = new google.maps.Polygon({
        paths: points,
        strokeColor: strokecolor,
        strokeOpacity: strokeopacity,
        strokeWeight: strokeweight,
        fillColor: fillcolor,
        fillOpacity: fillopacity
    });

    polygon.setMap(map);
    return polygon;
}

function OpenInfoWindowUsingLatLng(latlng, contentString) {
    infowindow.setContent(contentString);
    infowindow.setPosition(latlng);
    infowindow.open(map);
}