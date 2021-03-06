// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//org.sepy.ColorPicker.AdvancedColorButton

package org.sepy.ColorPicker{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.events.*;

    public class AdvancedColorButton extends MovieClip {

        public function AdvancedColorButton(){
            addFrameScript(0, frame1);
            useHandCursor = false;
            this.addEventListener(MouseEvent.MOUSE_OVER, onRollOver, false, 0, true);
            this.addEventListener(MouseEvent.MOUSE_OUT, onRollOut, false, 0, true);
            this.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
        }

        private function onRollOver(_arg1:MouseEvent):void{
            gotoAndStop(2);
        }

        private function onRollOut(_arg1:MouseEvent):void{
            gotoAndStop(1);
        }

        private function onClick(_arg1:MouseEvent):void{
            MovieClip(parent.parent).click(this);
        }

        function frame1(){
            stop();
        }


    }
}//package org.sepy.ColorPicker

