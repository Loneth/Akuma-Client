// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.mcSkillUp_388_467

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

    public dynamic class mcSkillUp_388_467 extends MovieClip 
    {

        public var c:int;
        public var t:int;
        public var rootClass:MovieClip;

        public function mcSkillUp_388_467()
        {
            addFrameScript(0, frame1, 1, frame2, 10, frame11, 41, frame42);
        }
        public function onSkillUpClick(_arg1:MouseEvent):void
        {
            rootClass.toggleCharpanel("spend");
            fClose();
        }
        public function fClose():void
        {
            this.gotoAndStop("reset");
        }
        function frame1()
        {
            stop();
            this.visible = false;
            this.x = 961;
            rootClass = (stage.getChildAt(0) as MovieClip);
            c = 0;
            t = 60;
            this.addEventListener(MouseEvent.CLICK, onSkillUpClick, false, 0, true);
            this.buttonMode = true;
        }
        function frame2()
        {
            this.visible = false;
            this.x = 961;
            stop();
        }
        function frame11()
        {
            this.visible = true;
            this.x = 766;
            c = 0;
        }
        function frame42()
        {
            if (++c < t){
                this.gotoAndPlay((this.currentFrame - 1));
            } else {
                fClose();
            };
        }

    }
}//package Game_new_fla

