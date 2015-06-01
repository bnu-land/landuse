/**
 * Created by WUCAN on 2015/5/23.
 */



require([
        "esri/map",
        "esri/layers/ArcGISDynamicMapServiceLayer",
        "dojo/on",
        "dojo/domReady!"],
    function (Map, ArcGISDynamicMapServiceLayer,on) {
        var map = new Map("map", {
            center: [-118, 34.5],
            zoom: 8,
            basemap: "topo"
        });

        dojo.connect(map, "onExtentChange", onExtentChange);

        var url = "http://localhost:6080/arcgis/rest/services/binxi2013/MapServer";
        var layer = new ArcGISDynamicMapServiceLayer(url);
        map.addLayer(layer);

        function onExtentChange(delta, extent, levelChange, lod) {
            //console.log(delta);
        }


    });