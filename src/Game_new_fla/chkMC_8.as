// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.chkMC_8

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
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

    public dynamic class chkMC_8 extends MovieClip 
    {

        public var chkBtn:SimpleButton;
        public var checkmark:MovieClip;
        public var bitChecked:Boolean;

        public function chkMC_8()
        {
            addFrameScript(0, frame1);
        }
        public function onClick(_arg1:MouseEvent)
        {
            MovieClip(stage.getChildAt(0)).mixer.playSound("Click");
            bitChecked = !(bitChecked);
            checkmark.visible = bitChecked;
        }
        function frame1()
        {
            checkmark.mouseEnabled = false;
            chkBtn.addEventListener(MouseEvent.CLICK, onClick, false, 1, true);
        }

    }
}//package Game_new_fla

