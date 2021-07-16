// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//KathleenWelcome

package 
{
    import flash.display.MovieClip;
    import flash.events.*;
    import flash.media.*;
    import flash.display.*;
    import flash.utils.*;
    import flash.accessibility.*;
    import flash.errors.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;

    public dynamic class mcLevelUpWings extends MovieClip 
    {

        public var isProp:Boolean;

        public function mcLevelUpWings()
        {
            addFrameScript(0, frame1, 9, frame10);
        }

        function frame1()
        {
            isProp = true;
            mouseEnabled = false;
            mouseChildren = false;
            init();
        }

        function frame10()
        {
            stop();
        }


    }
}//package 

