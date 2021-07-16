// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.mcForgotPassword_25_18

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.net.URLVariables;
    import flash.net.URLRequest;
    import flash.net.URLLoader;
    import flash.events.Event;
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

    public dynamic class mcForgotPassword_25_18 extends MovieClip 
    {

        public var btnContinue:SimpleButton;
        public var txtResponse:TextField;
        public var txtEmail:TextField;
        public var btnSubmit:SimpleButton;
        public var btnCancel:SimpleButton;
        public var btnBack:SimpleButton;
        public var strResponse:Object;
        public var rootClass:Object;

        public function mcForgotPassword_25_18()
        {
            addFrameScript(0, frame1, 10, frame11);
        }
        public function onSubmitClick(_arg1:MouseEvent):void
        {
            if (!rootClass.isValidEmail(txtEmail.text)){
                strResponse = "无效的Email地址，请重新输入。";
                gotoAndPlay("Done");
            } else {
                submitEmail();
            };
        }
        public function onCancelClick(_arg1:MouseEvent):void
        {
            MovieClip(parent).gotoAndPlay("Login");
        }
        public function submitEmail():void
        {
            var _local1:URLVariables;
            var _local2:URLRequest;
            var _local3:URLLoader;
            _local1 = new URLVariables();
            _local1.strEmail = txtEmail.text;
            _local2 = new URLRequest("http://www.qileu.com/tracking/cf-forgotpassword.php");
            _local2.data = _local1;
            _local2.method = URLRequestMethod.POST;
            _local3 = new URLLoader();
            _local3.addEventListener(Event.COMPLETE, onSubmitEmailComplete, false, 0, true);
            _local3.load(_local2);
        }
        public function onSubmitEmailComplete(_arg1:Event):void
        {
            var _local2:URLVariables;
            _local2 = new URLVariables(_arg1.target.data);
            if (_local2.status != "success"){
                strResponse = _local2.reason;
            };
            gotoAndPlay("Done");
        }
        public function onContinueClick(_arg1:MouseEvent):void
        {
            MovieClip(parent).gotoAndPlay("Login");
        }
        public function onBackClick(_arg1:MouseEvent):void
        {
            gotoAndPlay("Init");
        }
        function frame1()
        {
            stop();
            txtEmail.tabIndex = 1;
            btnSubmit.tabIndex = 2;
            btnCancel.tabIndex = 3;
            rootClass = MovieClip(parent.parent);
            strResponse = "";
            btnSubmit.addEventListener(MouseEvent.CLICK, onSubmitClick);
            btnCancel.addEventListener(MouseEvent.CLICK, onCancelClick);
        }
        function frame11()
        {
            stop();
            btnContinue.tabIndex = 3;
            btnBack.tabIndex = 3;
            if (strResponse != ""){
                txtResponse.text = strResponse;
            };
            btnContinue.addEventListener(MouseEvent.CLICK, onContinueClick);
            btnBack.addEventListener(MouseEvent.CLICK, onBackClick);
        }

    }
}//package Game_new_fla

