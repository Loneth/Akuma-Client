// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.game_1_cnt_2

package Game_fla{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.utils.Dictionary;
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

    public dynamic class game_1_cnt_2 extends MovieClip {

        public var mcTitle:MovieClip;
		public var mcCharacter0:MovieClip;
		public var mcCharacter1:MovieClip;
		public var txtName:TextField;
        public var mcCharacter2:MovieClip;
        public var mcForgotPassword:SimpleButton;
        public var il:MovieClip;
        public var chkUserName:MovieClip;
        public var chkPassword:MovieClip;
        public var ni:TextField;
        //public var btnCreate:SimpleButton;
        public var btn3d:SimpleButton;
        public var mcManageAccount:SimpleButton;
        public var mcPassword:MovieClip;
        public var pi:TextField;
        public var fbConnect:MovieClip;
        public var mcOr:MovieClip;
        public var btnFBLogin:SimpleButton;
        public var sl:ServerList;
        public var ModalStack:MovieClip;
        public var warning:MovieClip;
        public var mcLogo:MovieClip;
        public var btnLogin:SimpleButton;
        public var __setTabDict:Dictionary;
		public var pMC:AvatarMC2
		public var rootClass;

		public var sNews:TextField;
        public var btnDelete:MovieClip;
        public var btnAQW:SimpleButton;
        public var btnCharacterPage:MovieClip;
        public var btnBack:SimpleButton;
        public var btnCreate:SimpleButton;
        public var btnPlay:MovieClip;
		public var btnLogout:MovieClip;
        public var btnUpgrade:MovieClip;
		public var mcAccount:MovieClip
		public var mcDeleteConfirm:MovieClip;

        public function game_1_cnt_2(){
            __setTabDict = new Dictionary(true);
            super();
            addFrameScript(0, frame1, 9, frame10, 27, frame28, 38, frame39, 49, frame50, 60, frame61, 1, frame2, 2, frame3, 3, frame4, 4, frame5, 5, frame6, 6, frame7);
        }

        public function onCreateClick(_arg1:MouseEvent):void{
            MovieClip(parent).gotoAndPlay("Account");
            btnCreate.removeEventListener(MouseEvent.CLICK, onCreateClick);
        }

        function __setTab_btnCreate_game_1_cnt(){
            if ((((__setTabDict[btnCreate] == undefined)) || (!((((int(__setTabDict[btnCreate]) >= 1)) && ((int(__setTabDict[btnCreate]) <= 7))))))){
                __setTabDict[btnCreate] = currentFrame;
                btnCreate.tabIndex = 3;
            };
        }

        function __setTab_btnLogin_game_1_cnt(){
            if ((((__setTabDict[btnLogin] == undefined)) || (!((((int(__setTabDict[btnLogin]) >= 1)) && ((int(__setTabDict[btnLogin]) <= 7))))))){
                __setTabDict[btnLogin] = currentFrame;
                btnLogin.tabIndex = 3;
            };
        }

        function __setTab_btnFBLogin_game_1_cnt(){
            if ((((__setTabDict[btnFBLogin] == undefined)) || (!((((int(__setTabDict[btnFBLogin]) >= 1)) && ((int(__setTabDict[btnFBLogin]) <= 7))))))){
                __setTabDict[btnFBLogin] = currentFrame;
                btnFBLogin.tabIndex = 3;
            };
        }

        function frame1(){
            __setTab_btnFBLogin_game_1_cnt();
            __setTab_btnLogin_game_1_cnt();
            __setTab_btnCreate_game_1_cnt();
            btnCreate.addEventListener(MouseEvent.CLICK, onCreateClick, false, 0, true);
            MovieClip(parent).initLogin();
            stop();
        }

        function frame10(){
            stop();
        }

        function frame28(){
            stop();
        }

        function frame39(){
            stop();
        }
		
		function frame50()
		{
			/*
			rootClass = MovieClip(stage.getChildAt(0));
			if(rootClass.TodaysAnnouncement != null){
				sNews.htmlText = rootClass.TodaysAnnouncement;
			} else {
				sNews.htmlText = "Test Client";
			};
			*/
			MovieClip(parent).initSelect();
			
			stop();
		}
		
		function frame61()
		{
			loadCharacterCreation();
            stop();
		}
		
		public function loadCharacterCreation()
        {
			rootClass = MovieClip(stage.getChildAt(0));
			rootClass.StageFrame = "Signup";
            var ldr:Loader;
            mcAccount.removeChildAt(0);
            ldr = new Loader();
			ldr.load(new URLRequest(this.rootClass.getFilePath() + "/newuser/Signup.swf"), new LoaderContext(false, new ApplicationDomain(null)));
            //ldr.load(new URLRequest(this.rootClass.getFilePath() + "/newuser/" + rootClass.SignupSWF), new LoaderContext(false, new ApplicationDomain(null)));
            mcAccount.addChild(ldr);
        }

        function frame2(){
            __setTab_btnFBLogin_game_1_cnt();
            __setTab_btnLogin_game_1_cnt();
            __setTab_btnCreate_game_1_cnt();
        }

        function frame3(){
            __setTab_btnFBLogin_game_1_cnt();
            __setTab_btnLogin_game_1_cnt();
            __setTab_btnCreate_game_1_cnt();
        }

        function frame4(){
            __setTab_btnFBLogin_game_1_cnt();
            __setTab_btnLogin_game_1_cnt();
            __setTab_btnCreate_game_1_cnt();
        }

        function frame5(){
            __setTab_btnFBLogin_game_1_cnt();
            __setTab_btnLogin_game_1_cnt();
            __setTab_btnCreate_game_1_cnt();
        }

        function frame6(){
            __setTab_btnFBLogin_game_1_cnt();
            __setTab_btnLogin_game_1_cnt();
            __setTab_btnCreate_game_1_cnt();
        }

        function frame7(){
            __setTab_btnFBLogin_game_1_cnt();
            __setTab_btnLogin_game_1_cnt();
            __setTab_btnCreate_game_1_cnt();
        }
		
		public function setColor(_arg1:MovieClip, _arg2:String, _arg3:String, _arg4:String):void
        {
            var _local5:Number = Number(this.pAV.objData[("intColor" + _arg3)]);
            _arg1.isColored = true;
            _arg1.intColor = _local5;
            _arg1.strLocation = _arg3;
            _arg1.strShade = _arg4;
            this.changeColor(_arg1, _local5, _arg4);
        }

        public function changeColor(_arg1:MovieClip, _arg2:Number, _arg3:String, _arg4:String=""):void
        {
            var _local5:ColorTransform = new ColorTransform();
            if (_arg4 == ""){
                _local5.color = _arg2;
            };
            switch (_arg3.toUpperCase()){
                case "LIGHT":
                    _local5.redOffset = (_local5.redOffset + 100);
                    _local5.greenOffset = (_local5.greenOffset + 100);
                    _local5.blueOffset = (_local5.blueOffset + 100);
                    break;
                case "DARK":
                    _local5.redOffset = (_local5.redOffset - 25);
                    _local5.greenOffset = (_local5.greenOffset - 50);
                    _local5.blueOffset = (_local5.blueOffset - 50);
                    break;
                case "DARKER":
                    _local5.redOffset = (_local5.redOffset - 125);
                    _local5.greenOffset = (_local5.greenOffset - 125);
                    _local5.blueOffset = (_local5.blueOffset - 125);
                    break;
            };
            if (_arg4 == "-"){
                _local5.redOffset = (_local5.redOffset * -1);
                _local5.greenOffset = (_local5.greenOffset * -1);
                _local5.blueOffset = (_local5.blueOffset * -1);
            };
            if ((((_arg4 == "")) || (!((_arg1.transform.colorTransform.redOffset == _local5.redOffset))))){
                _arg1.transform.colorTransform = _local5;
            };
        }

		public function mcSetColor(oMC:MovieClip, strLocation:String, strShade:String)
        {
			trace("WENT HERE");
            pMC.setColor(oMC, strLocation, strShade);
        }


    }
}//package Game_fla

