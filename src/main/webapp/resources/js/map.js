/**
 * Created with IntelliJ IDEA.
 * User: radu.miron
 * Date: 12/2/15
 * Time: 3:01 PM
 * To change this template use File | Settings | File Templates.
 */
var map;
var myLatLng = {lat: 46.76, lng: 23.59};

function initialize() {
    var mapCanvas = document.getElementById('map');
    var mapOptions = {
        center: new google.maps.LatLng(myLatLng),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }

    map = new google.maps.Map(mapCanvas, mapOptions)
}



// function addStaticMarker() {
//     var pos = getRandomPosition()
//     var marker = new google.maps.Marker({
//         position: pos,
//         map: map,
//         title: 'Hello World!'
//     });
// }

// function getRandomPosition(){
//     var randLatLng = {lat: (myLatLng["lat"] + Math.floor(Math.random() * 5) + 1),
//         lng: (myLatLng["lng"] + Math.floor(Math.random() * 5) + 1)};
//     return randLatLng;
// }