// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.mcAreaList_240

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

    public dynamic class mcAreaList_240 extends MovieClip {

        public var t1:TextField;
        public var bMinMax:MovieClip;

        public function mcAreaList_240(){
            addFrameScript(0, frame1, 9, frame10);
        }

        function frame1(){
            t1.mouseEnabled = false;
            bMinMax.a1.visible = false;
            bMinMax.a2.visible = true;
            stop();
        }

        function frame10(){
            bMinMax.a1.visible = true;
            bMinMax.a2.visible = false;
            stop();
        }


    }
}//package Game_fla

