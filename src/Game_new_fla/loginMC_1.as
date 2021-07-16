// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.loginMC_1

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.text.TextField;
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

    public dynamic class loginMC_1 extends MovieClip 
    {

        public var mcForgotPassword:MovieClip;
        public var mcForgotText:TextField;
        public var il:IteratorMC;
        public var t1:MovieClip;
        public var btnLogin:SimpleButton;
        public var chkPassword:MovieClip;
        public var sl:ServerList;
        public var btnCreate:SimpleButton;
        public var ModalStack:MovieClip;
        public var ni:TextField;
        public var warning:MovieClip;
        public var chkUserName:MovieClip;
        public var pi:TextField;

        public function loginMC_1()
        {
            addFrameScript(0, frame1, 9, frame10, 19, frame20, 29, frame30);
        }
        public function onCreateClick(_arg1:MouseEvent):void
        {
            MovieClip(parent).gotoAndPlay("Account");
            btnCreate.removeEventListener(MouseEvent.CLICK, onCreateClick);
        }
        function frame1()
        {
            ni.condenseWhite = true;
            pi.condenseWhite = true;
            ni.tabIndex = 1;
            pi.tabIndex = 2;
            btnLogin.tabIndex = 3;
            btnCreate.tabIndex = 4;
            btnCreate.addEventListener(MouseEvent.CLICK, onCreateClick, false, 0, true);
            MovieClip(parent).initLogin();
            stop();
        }
        function frame10()
        {
            stop();
        }
        function frame20()
        {
            stop();
        }
        function frame30()
        {
            stop();
        }

    }
}//package Game_new_fla

