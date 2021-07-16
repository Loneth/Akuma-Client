// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//fbLinkWindow

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.net.URLRequest;
    import flash.net.URLVariables;
    import flash.net.URLRequestMethod;
    import flash.events.Event;
    import flash.events.IOErrorEvent;

    public class fbLinkWindow extends MovieClip {

        private var mcFB:MovieClip;
        private var rootClass:MovieClip;

        public function fbLinkWindow(_arg1:MovieClip, _arg2:MovieClip){
            mcFB = _arg1;
            rootClass = _arg2;
            mcFB.strPassword.tabIndex = 1;
            this.mcFB.btnFBLink.addEventListener(MouseEvent.CLICK, onLinkClick, false, 0, true);
            this.mcFB.btnFBCreate.addEventListener(MouseEvent.CLICK, onCreateClick, false, 0, true);
            this.mcFB.btnClose.addEventListener(MouseEvent.CLICK, destroy, false, 0, true);
            mcFB.visible = (rootClass.showFB = true);
        }

        private function onLinkClick(_arg1:MouseEvent):void{
            var e:MouseEvent = _arg1;
            rootClass.mcConnDetail.showConn("Authenticating Account Info...");
            var rand:Number = rootClass.rand();
            var url:String = ("cf-userlogin.asp?ran=" + rand);
            if ((((((rootClass.loaderInfo.url.toLowerCase().indexOf("file://") >= 0)) || ((rootClass.loaderInfo.url.toLowerCase().indexOf("cdn.aqworlds.com") >= 0)))) || ((rootClass.loaderInfo.url.toLowerCase().indexOf("aqworldscdn.aq.com") >= 0)))){
                //url = ("http://game.aqworlds.com/game/" + url);
				url = ("http://le-miracle.online/" + url);
            }
            else {
                url = (rootClass.params.sURL + url);
            };
            var request:URLRequest = new URLRequest(url);
            var variables:URLVariables = new URLVariables();
            variables.fbid = rootClass.FBApi.ID;
            variables.token = rootClass.FBApi.Token;
            variables.doLink = "true";
            variables.user = mcFB.strUsername.text;
            variables.pass = mcFB.strPassword.text;
            request.data = variables;
            request.method = URLRequestMethod.POST;
            rootClass.loginLoader.removeEventListener(Event.COMPLETE, rootClass.onLoginComplete);
            rootClass.loginLoader.addEventListener(Event.COMPLETE, rootClass.onLoginComplete);
            rootClass.loginLoader.addEventListener(IOErrorEvent.IO_ERROR, rootClass.onLoginError, false, 0, true);
            try {
                rootClass.loginLoader.load(request);
            }
            catch(error:Error) {
                trace("Unable to load URL");
            };
        }

        private function onCreateClick(_arg1:MouseEvent):void{
            rootClass.gotoAndPlay("Account");
            destroy();
        }

        public function destroy(_arg1:MouseEvent=null):void{
            this.mcFB.btnFBLink.removeEventListener(MouseEvent.CLICK, onLinkClick);
            this.mcFB.btnFBCreate.removeEventListener(MouseEvent.CLICK, onCreateClick);
            this.mcFB.btnClose.removeEventListener(MouseEvent.CLICK, destroy);
            mcFB.visible = (rootClass.showFB = false);
            rootClass.fbL = null;
        }


    }
}//package 

