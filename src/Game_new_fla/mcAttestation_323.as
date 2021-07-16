// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.mcAttestation_323

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.MouseEvent;
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

    public dynamic class mcAttestation_323 extends MovieClip 
    {

        public var btnClose:SimpleButton;
        public var tDesc1:TextField;
        public var tDesc2:TextField;
        public var submit:MovieClip;
        public var bg:MovieClip;
        public var ti:TextField;
        public var mc:MovieClip;
        public var rootClass:MovieClip;
        public var COEFFICIENT:Array;
        public var AUTH:Array;
        public var DIVIDER:int;
        public var LENGTH:int;

        public function mcAttestation_323()
        {
            addFrameScript(0, frame1, 4, frame5, 13, frame14);
        }
        public function submitClick(_arg1:MouseEvent)
        {
            var _local2:MovieClip;
            var _local3:MovieClip;
            _local2 = MovieClip(stage.getChildAt(0));
            _local3 = MovieClip(parent);
            if (tDesc1.text == ""){
                ti.text = "请输入真实姓名";
            } else {
                if (tDesc1.text.length < 2){
                    ti.text = "请输入正确的姓名";
                } else {
                    if (tDesc2.text == ""){
                        ti.text = "请输入身份证号码";
                    } else {
                        if (cardCheck(tDesc2.text)){
                            _local2.world.sendReport(["attestation", _local2.world.myAvatar.objData.strUsername, tDesc1.text, tDesc2.text]);
                            _local3.onClose(null);
                        } else {
                            ti.text = "请输入正确的身份证号码";
                        };
                    };
                };
            };
        }
        public function cardCheck(_arg1:String):Boolean
        {
            var _local2:Array = _arg1.match(/\d{1}/g);
            if ((((_local2.length < LENGTH)) || (!((_arg1.length == (LENGTH + 1)))))){
                return (false);
            };
            var _local3:int;
            var _local4:int;
            while (_local4 < LENGTH) {
                _local3 = (_local3 + (_local2[_local4] * COEFFICIENT[_local4]));
                _local4++;
            };
            var _local5:int = (_local3 % DIVIDER);
            if (String(AUTH[_local5]).toLowerCase() == _arg1.charAt((_arg1.length - 1)).toLowerCase()){
                return (true);
            };
            return (false);
        }
        public function onClose(_arg1:Event=null):void
        {
            if (MovieClip(parent).currentLabel != "Init"){
                rootClass.mixer.playSound("Click");
                MovieClip(parent).gotoAndPlay("Init");
            };
        }
        function frame1()
        {
            COEFFICIENT = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
            AUTH = [1, 0, "X", 9, 8, 7, 6, 5, 4, 3, 2];
            DIVIDER = 11;
            LENGTH = 17;
            mc = MovieClip(this);
            rootClass = (stage.getChildAt(0) as MovieClip);
            gotoAndPlay("full");
        }
        function frame5()
        {
            tDesc1.tabIndex = 1;
            tDesc2.tabIndex = 2;
            (tDesc1.text == "");
            (tDesc2.text == "");
            submit.addEventListener(MouseEvent.CLICK, submitClick, false, 0, true);
            btnClose.addEventListener(MouseEvent.CLICK, onClose, false, 0, true);
            submit.buttonMode = true;
        }
        function frame14()
        {
            stop();
        }

    }
}//package Game_new_fla

