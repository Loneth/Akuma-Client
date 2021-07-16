// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//GuildHall_fla.simpleblackbutton2_71

package GuildHall_fla{
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
    import flash.desktop.*;
    import flash.globalization.*;
    import flash.net.drm.*;
    import flash.sensors.*;
    import flash.text.ime.*;
    import flash.text.engine.*;

    public dynamic class simpleblackbutton2_71 extends MovieClip {

        public var bg:MovieClip;
        public var fx:MovieClip;
        public var isSelected:Boolean;

        public function simpleblackbutton2_71(){
            addFrameScript(0, this.frame1);
        }

        public function select(){
            this.isSelected = true;
            this.setCT(this.bg, 18278);
        }

        public function unselect(){
            this.isSelected = false;
            this.setCT(this.bg, 65793);
        }

        public function onMouseOver(_arg1:MouseEvent){
            if (!this.isSelected){
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
            this.isSelected = false;
            this.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver, false, 0, true);
            this.addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut, false, 0, true);
            stop();
        }


    }
}//package GuildHall_fla

