// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFElementScrollBar

package {
    import flash.display.MovieClip;
    import flash.geom.ColorTransform;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFElementScrollBar extends MovieClip {

        public var h:MovieClip;
        public var a1:MovieClip;
        public var a2:MovieClip;
        public var b:MovieClip;
        public var hit:MovieClip;
        private var mDown:Boolean = false;
        private var subjectMask:MovieClip;
        private var subject:MovieClip;
        private var hRun:int = 0;
        private var dRun:int = 0;
        private var mbY:int = 0;
        private var mhY:int = 0;
        private var mbD:int = 0;
        private var qly:int = 70;
        private var qdy:int = 58;
        private var defaultCT:ColorTransform;
        private var greyCT:ColorTransform;
        public var fParent:LPFFrame;

        public function LPFElementScrollBar():void{
            defaultCT = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
            greyCT = new ColorTransform(0.4, 0.4, 0.4, 1, -20, -20, -20, 0);
            super();
            hit.buttonMode = true;
            a1.buttonMode = true;
            a2.buttonMode = true;
        }

        public function fOpen(_arg1:Object):void{
            subjectMask = _arg1.subjectMask;
            subject = _arg1.subject;
            hRun = (b.height - h.height);
            dRun = ((subject.height - subjectMask.height) + 20);
            if (((_arg1.reset) || (!(("oy" in subject))))){
                subject.oy = subject.y;
                h.y = 0;
            };
            h.removeEventListener(Event.ENTER_FRAME, hEF);
            hit.removeEventListener(MouseEvent.MOUSE_DOWN, onMDown);
            a1.removeEventListener(MouseEvent.CLICK, onUpArrowClick);
            a2.removeEventListener(MouseEvent.CLICK, onDnArrowClick);
            hit.alpha = 0;
            if (subject.height > subjectMask.height){
                h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
                hit.addEventListener(MouseEvent.MOUSE_DOWN, onMDown, false, 0, true);
                a1.addEventListener(MouseEvent.CLICK, onUpArrowClick, false, 0, true);
                a2.addEventListener(MouseEvent.CLICK, onDnArrowClick, false, 0, true);
                transform.colorTransform = defaultCT;
            }
            else {
                transform.colorTransform = greyCT;
            };
        }

        public function fClose():void{
            removeEventListener(MouseEvent.MOUSE_DOWN, onMDown);
            removeEventListener(MouseEvent.MOUSE_UP, onMUp);
            a1.removeEventListener(MouseEvent.CLICK, onUpArrowClick);
            a2.removeEventListener(MouseEvent.CLICK, onDnArrowClick);
            stage.removeEventListener(MouseEvent.MOUSE_UP, onMUp);
            parent.removeChild(this);
        }

        protected function fDraw():void{
        }

        public function subscribeTo(_arg1:LPFFrame):void{
            fParent = _arg1;
        }

        private function onUpArrowClick(_arg1:MouseEvent):void{
            var _local2:int = (subject.height / (subject.numChildren - 1));
            var _local3:int = (hRun * (_local2 / subject.height));
            h.y = (h.y - _local3);
            if ((h.y + h.height) > b.height){
                h.y = int((b.height - h.height));
            };
            if (h.y < 0){
                h.y = 0;
            };
        }

        private function onDnArrowClick(_arg1:MouseEvent):void{
            var _local2:int = ((1.1 * subject.height) / subject.numChildren);
            var _local3:int = Math.ceil((hRun * (_local2 / subject.height)));
            h.y = (h.y + _local3);
            if ((h.y + h.height) > b.height){
                h.y = int((b.height - h.height));
            };
            if (h.y < 0){
                h.y = 0;
            };
        }

        private function onMDown(_arg1:MouseEvent){
            if (!h.hitTestPoint(mouseX, mouseY)){
                h.y = (mouseY - int((h.height / 2)));
                if ((h.y + h.height) > b.height){
                    h.y = int((b.height - h.height));
                };
                if (h.y < 0){
                    h.y = 0;
                };
            };
            mbY = int(mouseY);
            mhY = int(h.y);
            mDown = true;
            stage.addEventListener(MouseEvent.MOUSE_UP, onMUp, false, 0, true);
        }

        private function onMUp(_arg1:MouseEvent){
            mDown = false;
            stage.removeEventListener(MouseEvent.MOUSE_UP, onMUp);
        }

        private function hEF(_arg1:Event){
            if (mDown){
                mbD = (int(mouseY) - mbY);
                h.y = (mhY + mbD);
                if ((h.y + h.height) > b.height){
                    h.y = int((b.height - h.height));
                };
                if (h.y < 0){
                    h.y = 0;
                };
            };
            var _local2:* = (-(h.y) / hRun);
            var _local3:* = (int((_local2 * dRun)) + subject.oy);
            if (Math.abs((_local3 - subject.y)) > 0.2){
                subject.y = (subject.y + ((_local3 - subject.y) / 1.1));
            }
            else {
                subject.y = _local3;
            };
        }


    }
}//package 

