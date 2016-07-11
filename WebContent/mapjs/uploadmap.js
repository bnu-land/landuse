var map = new BMap.Map("map");
    map.centerAndZoom(new BMap.Point(126.79451,45.71626), 16);
    map.addControl(new BMap.NavigationControl());    //地图平移缩放控件PC端默认位于地图左上方，它包含控制地图的平移和缩放的功能。移动端提供缩放控件，默认位于地图右下方。
    map.addControl(new BMap.OverviewMapControl());   //添加缩略地图控件，默认位于地图右下方，是一个可折叠的缩略地图。
    map.addControl(new BMap.ScaleControl());     //比例尺控件，默认位于地图左下方，显示地图的比例关系。
    map.addControl(new BMap.MapTypeControl());   //地图类型控件，默认位于地图右上方。
    map.addControl(new BMap.GeolocationControl());   //定位控件，针对移动端开发，默认位于地图左下方。
    map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
    var CenterPoint = new BMap.Point(126.79451,45.71626);
    var WestPoint = new BMap.Point(126.79351,45.71626);
    var NorthPoint = new BMap.Point(126.79451,45.71726);
    var EastPoint = new BMap.Point(126.79551,45.71626);
    var SouthPoint = new BMap.Point(126.79451,45.71526);
    var Centermarker = new BMap.Marker(CenterPoint);
    var Westmarker = new BMap.Marker(WestPoint);
    var Northmarker = new BMap.Marker(NorthPoint);
    var Eastmarker = new BMap.Marker(EastPoint);
    var Southmarker = new BMap.Marker(SouthPoint);
    map.addOverlay(Centermarker);// 将标注添加到地图中
    map.addOverlay(Westmarker);
    map.addOverlay(Northmarker);
    map.addOverlay(Eastmarker);
    map.addOverlay(Southmarker);

    var opts = {
        width : 150,     // 信息窗口宽度
        height: 50,     // 信息窗口高度
        title : "", // 信息窗口标题
        anchor:"ANCHOR_UPPERRIGHT",
        offset: new BMap.Size(0, -13)

    };
    var infoWindow = new BMap.InfoWindow(time, opts);  // 创建信息窗口对象
    infoWindow.enableCloseOnClick();
    map.openInfoWindow(infoWindow, point);
    marker.addEventListener("click", function(){
        map.openInfoWindow(infoWindow,point); //开启信息窗口
    });