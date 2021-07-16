// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.simpleblackbutton2_334_394

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.net.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import flash.ui.*;
    import flash.external.*;
    import flash.accessibility.*;
    import flash.errors.*;

    public dynamic class simpleblackbutton2_334_394 extends MovieClip 
    {

        public var bg:MovieClip;
        public var fx:MovieClip;
        public var isSelected:Boolean;

        public function simpleblackbutton2_334_394()
        {
            addFrameScript(0, frame1);
        }
        public function onMouseOver(_arg1:MouseEvent)
        {
            if (!isSelected){
                this.fx.visible = true;
            };
        }
        public function select()
        {
            isSelected = true;
            setCT(bg, 18278);
        }
        public function setCT(_arg1, _arg2)
        {
            var _local3:*;
            _local3 = _arg1.transform.colorTransform;
            _local3.color = _arg2;
            _arg1.transform.colorTransform = _local3;
        }
        public function onMouseOut(_arg1:MouseEvent)
        {
            this.fx.visible = false;
        }
        public function unselect()
        {
            isSelected = false;
            setCT(bg, 65793);
        }
        function frame1()
        {
            stop();
            isSelected = false;
            this.buttonMode = true;
            this.fx.visible = false;
            this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
            this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
        }

    }
}//package Game_new_fla

