//<span style="white-space:pre">				</span>function addBoundary(){                                require(["esri/graphic","esri/tasks/FeatureSet",                                        "esri/symbols/SimpleMarkerSymbol", "esri/symbols/SimpleLineSymbol",                                        "esri/symbols/PictureFillSymbol", "esri/symbols/CartographicLineSymbol",                                         "esri/Color", "dojo/dom", "dojo/on", "dojo/domReady!"                                ], function(Graphic,FeatureSet,                                        SimpleMarkerSymbol, SimpleLineSymbol,                                        PictureFillSymbol, CartographicLineSymbol,                                         Color, dom, on                                      ) {                                    var fillSymbol = new PictureFillSymbol("images/mangrove.png",new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID,new Col<span style="white-space:pre">					</span>or('#000'), 1),42,42);                                    //排序：老挝、印度尼西亚、文莱、新加坡、柬埔寨、泰国、缅甸、菲律宾、越南、马来西亚                                    map.graphics.add(new esri.Graphic(getlaowo(), fillSymbol));                                    map.graphics.add(new esri.Graphic(getmalaixiya(), fillSymbol));                                })                            }
//备用的，在rings后面直接加上在地图服务中浏览器上post传入的Json里中括号以及中括号以内的东东就成功了！
var BoundaryJsonlaowo = {
    "geometry": {
        "rings": 这里写Json,
        "spatialReference": {
            "wkid": 4326
        }
    },
    "symbol": {
        "color": [0, 255, 0, 0],
        "outline": {
            "color": [0, 255, 0, 255],
            "width": 1.5,
            "type": "esriSLS",
            "style": "esriSLSSolid"
        },
        "type": "esriSFS",
        "style": "esriSFSSolid"
    }
};
