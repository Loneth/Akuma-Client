// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.simpleblackbutton2_437

package Game_fla{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.media.*;
    import flash.net.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.ui.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.xml.*;

    public dynamic class simpleblackbutton2_437 extends MovieClip {

        public var bg:MovieClip;
        public var fx:MovieClip;
        public var isSelected:Boolean;

        public function simpleblackbutton2_437(){
            addFrameScript(0, frame1);
        }

        public function select(){
            isSelected = true;
            setCT(bg, 18278);
        }

        public function unselect(){
            isSelected = false;
            setCT(bg, 65793);
        }

        public function onMouseOver(_arg1:MouseEvent){
            if (!isSelected){
                this.fx.visible = true;
            };
        }

        public function onMouseOut(_arg1:MouseEvent){
            this.fx.visible = false;
        }

        public function setCT(_arg1, _arg2){
            var _local3:* = _arg1.transform.colorTransform;
            _local3.color = _arg2;
            _arg1.transform.colorTransform = _local3;
        }

        function frame1(){
            this.buttonMode = true;
            this.fx.visible = false;
            isSelected = false;
            this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
            this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
            stop();
        }


    }
}//package Game_fla

