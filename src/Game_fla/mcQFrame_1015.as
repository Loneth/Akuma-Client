// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.mcQFrame_1015

package Game_fla{
    import flash.display.MovieClip;
    import flash.text.TextField;
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

    public dynamic class mcQFrame_1015 extends MovieClip {

        public var aMask:MovieClip;
        public var bMask:MovieClip;
        public var qList:MovieClip;
        public var strTitle:TextField;
        public var bg:MovieClip;
        public var core:MovieClip;
        public var scr:MovieClip;
        public var btns:MovieClip;
        public var mc;

        public function mcQFrame_1015(){
            addFrameScript(4, frame5, 9, frame10, 10, frame11, 14, frame15, 21, frame22, 35, frame36, 46, frame47, 52, frame53, 57, frame58, 66, frame67);
        }

        function frame5(){
            stop();
        }

        function frame10(){
            MovieClip(parent).showQuestList();
            bg.resizeTo(326, 379);
        }

        function frame11(){
            stop();
        }

        function frame15(){
            MovieClip(parent).showQuestList();
        }

        function frame22(){
            stop();
        }

        function frame36(){
            MovieClip(parent).showQuestDetail();
            bg.resizeTo(326, 379);
        }

        function frame47(){
            stop();
        }

        function frame53(){
            stop();
        }

        function frame58(){
            MovieClip(parent).killDetailUI();
        }

        function frame67(){
            mc = MovieClip(parent);
            if (mc.qData != null){
                gotoAndPlay("detail");
            }
            else {
                gotoAndPlay("list");
            };
        }


    }
}//package Game_fla

