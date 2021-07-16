// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.resMC_461

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

    public dynamic class resMC_461 extends MovieClip 
    {

        public var counter:MovieClip;
        public var bg:MovieClip;

        public function resMC_461()
        {
            addFrameScript(0, frame1, 1, frame2, 4, frame5, 19, frame20, 56, frame57);
        }
        public function clickHandler(_arg1:MouseEvent)
        {
            MovieClip(_arg1.currentTarget.parent.parent.world).resPlayer();
            MovieClip(_arg1.currentTarget).visible = false;
            MovieClip(_arg1.currentTarget).gotoAndStop(1);
        }
        function frame1()
        {
            this.buttonMode = true;
        }
        function frame2()
        {
            stop();
        }
        function frame5()
        {
            this.removeEventListener(MouseEvent.CLICK, clickHandler);
            this.visible = true;
        }
        function frame20()
        {
            stop();
        }
        function frame57()
        {
            this.addEventListener(MouseEvent.CLICK, clickHandler);
            stop();
        }

    }
}//package Game_new_fla

