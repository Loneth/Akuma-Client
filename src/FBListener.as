// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//FBListener

package {
    import flash.display.MovieClip;
    import flash.display.Bitmap;
    import flash.display.Loader;
    import flash.system.Security;
    import flash.net.URLRequest;
    import flash.net.URLVariables;
    //import flash.external.ExternalInterface;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.net.URLRequestMethod;
    import flash.external.*;

    public class FBListener {

        private var rootClass:MovieClip;
        private var fbID:Number = 0;
        private var strToken:String;
        private var fbName:String;
        private var fbEmail:String;
        private var fbIP:String;
        private var imgURL:String;
        private var fbImg:Bitmap;
        private var imgLoader:Loader;
        private var imgLoaded:Boolean = false;

        public function FBListener(_arg1:MovieClip){
            imgLoader = new Loader();
            super();
            rootClass = _arg1;
            Security.allowDomain("fbcdn-profile-a.akamaihd.net");
            Security.loadPolicyFile("https://fbcdn-profile-a.akamaihd.net/crossdomain.xml");
        }

        public function handleFBEvent(_arg1:String, _arg2){
            var tokens:Array;
            var rand:Number;
            var url:String;
            var request:URLRequest;
            var variables:URLVariables;
            var cmd:String = _arg1;
            var fbData:* = _arg2;
            trace(("fb callback received, cmd: " + cmd));
            switch (cmd){
                case "linkAccount":
                    //ExternalInterface.call("GetCurrentUser");
                    return;
                case "GetCurrentUserComplete":
                    tokens = fbData.split(",");
                    fbID = Number(tokens[0]);
                    fbName = tokens[1];
                    fbEmail = tokens[2];
                    strToken = tokens[4];
                    fbIP = tokens[5];
                    trace(((((((((("HANDLE FB EVENT USER DATA:   fbID: " + fbID) + " strToken: ") + strToken) + " fbName: ") + fbName) + " fbEMail: ") + fbEmail) + " fbIP: ") + fbIP));
                    if ((((fbID > 0)) && (!((strToken == null))))){
                        rootClass.sfc.sendXtMessage("zm", "fbCmd", ["linkAccount", fbID, fbName, fbEmail, fbIP], "str", 1);
                    };
                    if (rootClass.mcO != null){
                        rootClass.mcO.checkFBStatus();
                    };
                    return;
                case "GetCurrentUserLogin":
                    tokens = fbData.split(",");
                    fbID = Number(tokens[0]);
                    fbName = tokens[1];
                    fbEmail = tokens[2];
                    strToken = tokens[4];
                    fbIP = tokens[5];
                    imgURL = tokens[6];
                    trace(("imgURL: " + imgURL));
                    if (imgURL != null){
                        imgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, imgComplete, false, 0, true);
                        imgLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, imgError, false, 0, true);
                        imgLoader.load(new URLRequest(imgURL));
                    };
                    return;
                case "fbLogin":
                    if (fbData.indexOf("status:undefined") > -1){
                        return;
                    };
                    tokens = fbData.split(";");
                    fbID = Number(tokens[1].split(":")[1]);
                    strToken = String(tokens[2].split(":")[1]);
                    if (fbID < 1) break;
                    //ExternalInterface.call("GetCurrentUserLogin");
                    rootClass.mcConnDetail.showConn("Authenticating Account Info...");
                    rand = rootClass.rand();
                    url = ("cf-userlogin.asp?ran=" + rand);
                    if ((((((rootClass.loaderInfo.url.toLowerCase().indexOf("file://") >= 0)) || ((rootClass.loaderInfo.url.toLowerCase().indexOf("cdn.aqworlds.com") >= 0)))) || ((rootClass.loaderInfo.url.toLowerCase().indexOf("aqworldscdn.aq.com") >= 0)))){
                        //url = ("http://game.aqworlds.com/game/" + url);
						//url = ("http://augoeides.org/" + url);
                    }
                    else {
                        //url = (rootClass.params.sURL + url);
                    };
                    request = new URLRequest(url);
                    variables = new URLVariables();
                    variables.fbid = fbID;
                    variables.token = strToken;
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
                    return;
                case "Logout":
                    fbID = 0;
                    strToken = "";
                    if (rootClass.mcO != null){
                        rootClass.mcO.checkFBStatus();
                    };
                    return;
            };
        }

        private function imgComplete(_arg1:Event):void{
            fbImg = Bitmap(_arg1.target.content);
            fbImg.width = 62;
            fbImg.height = 60;
            imgLoaded = true;
        }

        private function imgError(_arg1:IOErrorEvent):void{
        }

        public function handleEvent(_arg1:Array):void{
            switch (_arg1[2]){
                case "Link":
                    if (_arg1[3] == "false"){
                        //ExternalInterface.call("fbLogout", "Logout");
                    };
                    return;
                case "unlink":
                    if (_arg1[3] == "true"){
                        //ExternalInterface.call("fbLogout", "Logout");
                        fbID = 0;
                    };
                    if (rootClass.mcO != null){
                        rootClass.mcO.checkFBStatus();
                        rootClass.mcO.closeUnlink();
                    };
                    return;
            };
        }

        public function fbLogout():void{
            fbID = 0;
            strToken = "";
        }

        public function logoutFromFB():void{
            //ExternalInterface.call("fbLogout", "Logout");
        }

        public function get isLoggedIn():Boolean{
            return ((fbID > 0));
        }

        public function get ID():Number{
            return (fbID);
        }

        public function get Token():String{
            return (strToken);
        }

        public function get Loaded():Boolean{
            return (imgLoaded);
        }

        public function get FBImage():Bitmap{
            return (fbImg);
        }

        public function get Name():String{
            return (fbName);
        }


    }
}//package 

