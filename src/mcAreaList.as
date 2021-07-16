// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//mcAreaList

package {
    import flash.display.MovieClip;
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

    public dynamic class mcAreaList extends MovieClip {

        public var cntMask:MovieClip;
        public var cnt:MovieClip;
        public var title:MovieClip;

        public function mcAreaList(){
            addFrameScript(0, frame1, 1, frame2, 4, frame5, 19, frame20, 24, frame25);
        }

        function frame1(){
            title.gotoAndStop(1);
        }

        function frame2(){
            stop();
        }

        function frame5(){
            title.gotoAndPlay("in");
            MovieClip(Game.root).areaListGet();
        }

        function frame20(){
            stop();
        }

        function frame25(){
            title.gotoAndPlay("out");
        }


    }
}//package 

