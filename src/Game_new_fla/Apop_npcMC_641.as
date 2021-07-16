// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.Apop_npcMC_641

package Game_new_fla
{
    import flash.display.MovieClip;
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

    public dynamic class Apop_npcMC_641 extends MovieClip 
    {

        public var npc:MovieClip;

        public function Apop_npcMC_641()
        {
            addFrameScript(0, frame1, 1, frame2, 9, frame10, 27, frame28, 30, frame31, 37, frame38, 45, frame46, 53, frame54, 56, frame57, 63, frame64, 71, frame72);
        }
        function frame1()
        {
            npc.visible = false;
        }
        function frame2()
        {
            stop();
        }
        function frame10()
        {
            npc.visible = true;
        }
        function frame28()
        {
            stop();
        }
        function frame31()
        {
            npc.visible = true;
        }
        function frame38()
        {
            gotoAndPlay("init");
        }
        function frame46()
        {
            npc.visible = true;
        }
        function frame54()
        {
            stop();
        }
        function frame57()
        {
            npc.visible = true;
        }
        function frame64()
        {
            gotoAndPlay("init");
        }
        function frame72()
        {
            gotoAndStop("hold");
        }

    }
}//package Game_new_fla

