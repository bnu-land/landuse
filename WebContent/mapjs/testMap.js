/**
 * Created by WUCAN on 2015/5/18.
 */

require(["esri/map", "dojo/domReady!"], function(Map) {
    var map = new Map("map", {
        center: [-118, 34.5],
        zoom: 8,
        basemap: "topo"
    });
});