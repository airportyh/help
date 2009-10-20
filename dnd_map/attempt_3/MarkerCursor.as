package{
    
    import flash.display.Sprite;
    import flash.display.Graphics
    public class MarkerCursor extends Sprite{
        public function MarkerCursor(){
            draw()
        }
        
        function draw(){
            var g:Graphics = graphics
            var color:uint = 0x000000
            g.lineStyle(2, color, 0.5, false, 'normal', 'rounded')
            g.drawCircle(0, 0, 10)
            color = 0xff766a
            g.beginFill(color, 0.8)
            g.drawCircle(0, 0, 10)
        }
    }
    
}