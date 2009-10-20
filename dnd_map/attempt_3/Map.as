package{
    import mx.containers.Canvas
    import flash.geom.Point
    import flash.events.MouseEvent
    import com.google.maps.interfaces.IOverlay
    import com.google.maps.interfaces.IControl
    import com.google.maps.LatLng
    import com.google.maps.MapMouseEvent
    import com.google.maps.overlays.Marker
    import com.google.maps.overlays.Polyline
    import com.google.maps.Map
    import com.google.maps.MapEvent
    import com.google.maps.controls.*
    import mx.managers.CursorManager
    public class Map extends com.google.maps.Map{
        public function Map(){
            sensor = "false"
            setupMapEventListeners()
        }
        
        function onReady(e){
            enableContinuousZoom()
            enableScrollWheelZoom()
            addControl(new PositionControl())
            addControl(new ZoomControl())
        }
        
        function setupMapEventListeners(){
            addEventListener(MapEvent.MAP_READY, onReady)
        }
        
        function mapCoordinates(e:MouseEvent):Point{
            return globalToLocal(new Point(e.stageX, e.stageY))
        }
        
        // =========== util functions ====================
        
        var draggedMarker:Marker
        var cursorID:Number
        public function addPolyline(points:Array):void{
            var polyline:Polyline = new Polyline(points)
            polyline.addEventListener(MapMouseEvent.MOUSE_UP, onPolylineMouseUp)
            polyline.addEventListener(MapMouseEvent.ROLL_OVER, onPolylineRollOver)
            addOverlay(polyline)
        }
        
        public function addMarker(point:LatLng):void{
            var marker:Marker = new Marker(point)
            marker.addEventListener(MapMouseEvent.MOUSE_DOWN, onMarkerMouseDown)
            marker.addEventListener(MapMouseEvent.MOUSE_UP, onMarkerMouseUp)
            addOverlay(marker)
        }
        
        // =========== Drag & Drap Machinery =============
        
        function onPolylineMouseUp(e:MapMouseEvent):void{
            trace('polyline moused up') // this works now
        }
        
        function onPolylineRollOver(e:MapMouseEvent):void{
            trace('polyline rolled over') // this works too
        }
        
        function onMarkerMouseDown(e:MapMouseEvent):void{
            draggedMarker = e.feature as Marker
            cursorID = CursorManager.setCursor(MarkerCursor)
        }
        
        function onMarkerMouseUp(e:MapMouseEvent):void{
            if (draggedMarker === e.feature){
                draggedMarker = null
                CursorManager.removeCursor(cursorID)
                cursorID = undefined
            }
        }
        
    }
}

