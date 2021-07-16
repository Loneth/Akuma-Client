// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.Button_507

package Game_fla{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
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

    public dynamic class BuyVIP1 extends MovieClip {

        public var btnButton:SimpleButton;

        public function BuyVIP1(){
            addFrameScript(0, frame1);
        }

        public function onClick(_arg1:MouseEvent):void{
            var _local2:* = MovieClip(this.stage.getChildAt(0));
            navigateToURL(new URLRequest(("http://augoeides.org/upgrade"/*+ _local2.world.myAvatar.objData.guild.GuildID*/)), "_blank");
        }

        function frame1(){
            this.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
        }


    }
}//package Game_fla

