﻿// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//mcFBPassword

package {
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;

    public class mcFBPassword extends MovieClip {

        public var btnClose:SimpleButton;
        public var frame:MovieClip;
        public var btnPassClick:SimpleButton;
        public var btnManage:SimpleButton;
        public var mcPassRecovery:SimpleButton;
        public var txtCharName:TextField;
        public var txtFBName:TextField;
        var rootClass:MovieClip;
        var callBack:Function;
        var errorFunction:Function;

        public function mcFBPassword(_arg1:MovieClip){
            rootClass = _arg1;
            txtCharName.text = rootClass.world.myAvatar.objData.strUsername;
            txtFBName.text = ("Linked to Facebook account " + rootClass.strToProperCase(rootClass.FBApi.Name));
            btnPassClick.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
            mcPassRecovery.addEventListener(MouseEvent.CLICK, onForgotClick, false, 0, true);
            btnManage.addEventListener(MouseEvent.CLICK, onManageClick, false, 0, true);
        }

        private function onForgotClick(_arg1:MouseEvent):void{
            navigateToURL(new URLRequest("http://le-miracle.online/?contact-recover"), "_blank");
        }

        private function onManageClick(_arg1:MouseEvent):void{
            navigateToURL(new URLRequest("http:///le-miracle.online/?account"), "_blank");
        }

        private function onClick(_arg1:MouseEvent):void{
            rootClass.sfc.sendXtMessage("zm", "fbCmd", ["unlinkAccount", rootClass.FBApi.ID], "str", 1);
        }

        private function onCloseClick(_arg1:MouseEvent):void{
            rootClass.ui.removeChild(this);
        }


    }
}//package 

