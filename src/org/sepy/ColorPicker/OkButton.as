// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//org.sepy.ColorPicker.OkButton

package org.sepy.ColorPicker{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.events.*;

    public class OkButton extends MovieClip {

        public function OkButton(){
            addFrameScript(0, frame1);
            useHandCursor = false;
            this.addEventListener(MouseEvent.MOUSE_OVER, onRollOver, false, 0, true);
            this.addEventListener(MouseEvent.MOUSE_OUT, onRollOut, false, 0, true);
            this.addEventListener(MouseEvent.MOUSE_DOWN, onPress, false, 0, true);
            this.addEventListener(MouseEvent.MOUSE_UP, onRelease, false, 0, true);
        }

        private function onRollOver(_arg1:MouseEvent):void{
            this.gotoAndStop(1);
        }

        private function onRollOut(_arg1:MouseEvent):void{
            gotoAndStop(1);
        }

        function onPress(_arg1:MouseEvent):void{
            gotoAndStop(2);
        }

        function onRelease(_arg1:MouseEvent):void{
            gotoAndStop(1);
            MovieClip(parent).click(this);
        }

        function frame1(){
            stop();
        }


    }
}//package org.sepy.ColorPicker

