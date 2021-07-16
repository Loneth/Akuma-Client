// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Projectile

package {
    import flash.display.MovieClip;
    import flash.geom.Point;
    import flash.utils.getTimer;
    import flash.events.Event;

    public class Projectile extends MovieClip {

        private const velocity:Number = 1500;

        private var rootClass:MovieClip;
        private var interPoint:Point;
        private var pointStart:Point;
        private var mc:MovieClip;
        private var startTime:Number = 0;
        private var curTime:Number;
        private var timeTotal:Number;
        private var mcParent:MovieClip;
        private var xPos:Number;
        private var yPos:Number;
        private var tempPoint:Point;

        public function Projectile(_arg1:Point, _arg2:Point, _arg3:MovieClip, _arg4:MovieClip){
            interPoint = new Point();
            super();
            rootClass = _arg4;
            trace(((("start x: " + _arg1.x) + " y: ") + _arg1.y));
            trace(((("end x: " + _arg2.x) + " y: ") + _arg2.y));
            pointStart = _arg1;
            interPoint.x = (_arg2.x - _arg1.x);
            trace(("inter.x: " + interPoint.x));
            interPoint.y = (_arg2.y - _arg1.y);
            mc = _arg3;
            mc.scaleX = (((interPoint.x)<0) ? (mc.scaleX * -1) : mc.scaleX);
            mcParent = MovieClip(mc.parent);
            var _local5:Number = (_arg2.x - _arg1.x);
            var _local6:Number = (_arg2.y - _arg1.y);
            var _local7:Number = Math.sqrt(((_local5 * _local5) + (_local6 * _local6)));
            timeTotal = (1000 * (_local7 / velocity));
            trace(("total time: " + timeTotal));
            startTime = getTimer();
            trace("projectile set up");
            this.addEventListener(Event.ENTER_FRAME, onEnter, false, 0, true);
        }

        private function onEnter(_arg1:Event):void{
            curTime = (getTimer() - startTime);
            curTime = (((curTime)>=timeTotal) ? timeTotal : curTime);
            xPos = (pointStart.x + (interPoint.x * (curTime / timeTotal)));
            yPos = (pointStart.y + (interPoint.y * (curTime / timeTotal)));
            trace(((("global x: " + xPos) + " y: ") + yPos));
            mc.x = (pointStart.x + (interPoint.x * (curTime / timeTotal)));
            mc.y = (pointStart.y + (interPoint.y * (curTime / timeTotal)));
            if (curTime >= timeTotal){
                mc.visible = false;
                trace("removing projectile");
                mcParent.removeChild(mc);
                this.removeEventListener(Event.ENTER_FRAME, onEnter);
                return;
            };
        }


    }
}//package 

