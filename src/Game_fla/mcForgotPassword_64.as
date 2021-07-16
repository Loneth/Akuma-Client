// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.mcForgotPassword_64

package Game_fla{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.utils.Dictionary;
    import flash.net.URLVariables;
    import flash.net.URLRequest;
    import flash.net.URLRequestMethod;
    import flash.net.URLLoader;
    import flash.events.Event;
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

    public dynamic class mcForgotPassword_64 extends MovieClip {

        public var btnContinue:SimpleButton;
        public var txtResponse:TextField;
        public var txtEmail:TextField;
        public var btnSubmit:SimpleButton;
        public var btnCancel:SimpleButton;
        public var btnBack:SimpleButton;
        public var __setTabDict:Dictionary;
        public var rootClass;
        public var strResponse;

        public function mcForgotPassword_64(){
            __setTabDict = new Dictionary(true);
            super();
            addFrameScript(0, frame1, 10, frame11, 1, frame2, 2, frame3, 3, frame4, 4, frame5, 5, frame6, 6, frame7, 7, frame8, 8, frame9, 9, frame10, 11, frame12, 12, frame13, 13, frame14, 14, frame15, 15, frame16, 16, frame17, 17, frame18, 18, frame19, 19, frame20, 20, frame21, 21, frame22);
        }

        public function submitEmail():void{
            var _local1:URLVariables = new URLVariables();
            _local1.strEmail = txtEmail.text;
            trace(("Sending: " + _local1));
            var _local2:URLRequest = new URLRequest((rootClass.params.sURL + "cf-forgotpassword.asp"));
            _local2.data = _local1;
            _local2.method = URLRequestMethod.POST;
            var _local3:URLLoader = new URLLoader();
            _local3.addEventListener(Event.COMPLETE, onSubmitEmailComplete, false, 0, true);
            _local3.load(_local2);
        }

        public function onSubmitEmailComplete(_arg1:Event):void{
            trace(("onDataComplete:" + _arg1.target.data));
            var _local2:URLVariables = new URLVariables(_arg1.target.data);
            if (_local2.status != "success"){
                strResponse = _local2.reason;
            };
            gotoAndPlay("Done");
        }

        public function onSubmitClick(_arg1:MouseEvent):void{
            if (!rootClass.isValidEmail(txtEmail.text)){
                strResponse = "Invalid Email";
                gotoAndPlay("Done");
            }
            else {
                submitEmail();
            };
        }

        public function onCancelClick(_arg1:MouseEvent):void{
            MovieClip(parent).gotoAndPlay("Login");
        }

        public function onContinueClick(_arg1:MouseEvent):void{
            MovieClip(parent).gotoAndPlay("Login");
        }

        public function onBackClick(_arg1:MouseEvent):void{
            gotoAndPlay("Init");
        }

        function __setTab_txtEmail_mcForgotPassword_Layer3_0(){
            if ((((__setTabDict[txtEmail] == undefined)) || (!((((int(__setTabDict[txtEmail]) >= 1)) && ((int(__setTabDict[txtEmail]) <= 10))))))){
                __setTabDict[txtEmail] = currentFrame;
                txtEmail.tabIndex = 1;
            };
        }

        function __setTab_btnSubmit_mcForgotPassword_Layer3_0(){
            if ((((__setTabDict[btnSubmit] == undefined)) || (!((((int(__setTabDict[btnSubmit]) >= 1)) && ((int(__setTabDict[btnSubmit]) <= 10))))))){
                __setTabDict[btnSubmit] = currentFrame;
                btnSubmit.tabIndex = 3;
            };
        }

        function __setTab_btnCancel_mcForgotPassword_Layer3_0(){
            if ((((__setTabDict[btnCancel] == undefined)) || (!((((int(__setTabDict[btnCancel]) >= 1)) && ((int(__setTabDict[btnCancel]) <= 10))))))){
                __setTabDict[btnCancel] = currentFrame;
                btnCancel.tabIndex = 3;
            };
        }

        function __setTab_btnContinue_mcForgotPassword_Layer3_10(){
            if ((((__setTabDict[btnContinue] == undefined)) || (!((((int(__setTabDict[btnContinue]) >= 11)) && ((int(__setTabDict[btnContinue]) <= 22))))))){
                __setTabDict[btnContinue] = currentFrame;
                btnContinue.tabIndex = 3;
            };
        }

        function __setTab_btnBack_mcForgotPassword_Layer3_10(){
            if ((((__setTabDict[btnBack] == undefined)) || (!((((int(__setTabDict[btnBack]) >= 11)) && ((int(__setTabDict[btnBack]) <= 22))))))){
                __setTabDict[btnBack] = currentFrame;
                btnBack.tabIndex = 3;
            };
        }

        function frame1(){
            __setTab_btnCancel_mcForgotPassword_Layer3_0();
            __setTab_btnSubmit_mcForgotPassword_Layer3_0();
            __setTab_txtEmail_mcForgotPassword_Layer3_0();
            rootClass = MovieClip(parent.parent);
            strResponse = "";
            btnSubmit.addEventListener(MouseEvent.CLICK, onSubmitClick);
            btnCancel.addEventListener(MouseEvent.CLICK, onCancelClick);
            stop();
        }

        function frame11(){
            __setTab_btnBack_mcForgotPassword_Layer3_10();
            __setTab_btnContinue_mcForgotPassword_Layer3_10();
            if (strResponse != ""){
                txtResponse.text = strResponse;
            };
            btnContinue.addEventListener(MouseEvent.CLICK, onContinueClick);
            btnBack.addEventListener(MouseEvent.CLICK, onBackClick);
            stop();
        }

        function frame2(){
            __setTab_btnCancel_mcForgotPassword_Layer3_0();
            __setTab_btnSubmit_mcForgotPassword_Layer3_0();
            __setTab_txtEmail_mcForgotPassword_Layer3_0();
        }

        function frame3(){
            __setTab_btnCancel_mcForgotPassword_Layer3_0();
            __setTab_btnSubmit_mcForgotPassword_Layer3_0();
            __setTab_txtEmail_mcForgotPassword_Layer3_0();
        }

        function frame4(){
            __setTab_btnCancel_mcForgotPassword_Layer3_0();
            __setTab_btnSubmit_mcForgotPassword_Layer3_0();
            __setTab_txtEmail_mcForgotPassword_Layer3_0();
        }

        function frame5(){
            __setTab_btnCancel_mcForgotPassword_Layer3_0();
            __setTab_btnSubmit_mcForgotPassword_Layer3_0();
            __setTab_txtEmail_mcForgotPassword_Layer3_0();
        }

        function frame6(){
            __setTab_btnCancel_mcForgotPassword_Layer3_0();
            __setTab_btnSubmit_mcForgotPassword_Layer3_0();
            __setTab_txtEmail_mcForgotPassword_Layer3_0();
        }

        function frame7(){
            __setTab_btnCancel_mcForgotPassword_Layer3_0();
            __setTab_btnSubmit_mcForgotPassword_Layer3_0();
            __setTab_txtEmail_mcForgotPassword_Layer3_0();
        }

        function frame8(){
            __setTab_btnCancel_mcForgotPassword_Layer3_0();
            __setTab_btnSubmit_mcForgotPassword_Layer3_0();
            __setTab_txtEmail_mcForgotPassword_Layer3_0();
        }

        function frame9(){
            __setTab_btnCancel_mcForgotPassword_Layer3_0();
            __setTab_btnSubmit_mcForgotPassword_Layer3_0();
            __setTab_txtEmail_mcForgotPassword_Layer3_0();
        }

        function frame10(){
            __setTab_btnCancel_mcForgotPassword_Layer3_0();
            __setTab_btnSubmit_mcForgotPassword_Layer3_0();
            __setTab_txtEmail_mcForgotPassword_Layer3_0();
        }

        function frame12(){
            __setTab_btnBack_mcForgotPassword_Layer3_10();
            __setTab_btnContinue_mcForgotPassword_Layer3_10();
        }

        function frame13(){
            __setTab_btnBack_mcForgotPassword_Layer3_10();
            __setTab_btnContinue_mcForgotPassword_Layer3_10();
        }

        function frame14(){
            __setTab_btnBack_mcForgotPassword_Layer3_10();
            __setTab_btnContinue_mcForgotPassword_Layer3_10();
        }

        function frame15(){
            __setTab_btnBack_mcForgotPassword_Layer3_10();
            __setTab_btnContinue_mcForgotPassword_Layer3_10();
        }

        function frame16(){
            __setTab_btnBack_mcForgotPassword_Layer3_10();
            __setTab_btnContinue_mcForgotPassword_Layer3_10();
        }

        function frame17(){
            __setTab_btnBack_mcForgotPassword_Layer3_10();
            __setTab_btnContinue_mcForgotPassword_Layer3_10();
        }

        function frame18(){
            __setTab_btnBack_mcForgotPassword_Layer3_10();
            __setTab_btnContinue_mcForgotPassword_Layer3_10();
        }

        function frame19(){
            __setTab_btnBack_mcForgotPassword_Layer3_10();
            __setTab_btnContinue_mcForgotPassword_Layer3_10();
        }

        function frame20(){
            __setTab_btnBack_mcForgotPassword_Layer3_10();
            __setTab_btnContinue_mcForgotPassword_Layer3_10();
        }

        function frame21(){
            __setTab_btnBack_mcForgotPassword_Layer3_10();
            __setTab_btnContinue_mcForgotPassword_Layer3_10();
        }

        function frame22(){
            __setTab_btnBack_mcForgotPassword_Layer3_10();
            __setTab_btnContinue_mcForgotPassword_Layer3_10();
        }


    }
}//package Game_fla

