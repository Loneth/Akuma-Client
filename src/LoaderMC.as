// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LoaderMC

package {
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.*;

    public class LoaderMC extends MovieClip {
	
		public var mcTitle:MovieClip;
        public var mcPct:TextField;
        public var btnCancel:SimpleButton;
        public var strLoad:TextField;
        var mcDest:MovieClip;
        var isEvent:Boolean = false;
        private var rootClass:MovieClip;
        public var history:Object;

        public function LoaderMC(_arg1:MovieClip){
            history = {};
            super();
            btnCancel.addEventListener(MouseEvent.CLICK, onCancelClick);
            rootClass = _arg1;
        }

        public function loadFile(_arg1:MovieClip, _arg2:String, _arg3:String, _arg4:Boolean=false):void{
            var _local5:Number = new Date().getTime();
            if ((((_arg2.indexOf("http://") == -1)) && ((_arg2.indexOf("file://") == -1)))){
                _arg2 = (Game.serverFilePath + _arg2);
            };
            isEvent = _arg4;
            if (_arg3 != "Inline Asset"){
                MovieClip(Game.root).addChild(this);
            };
            mcDest = _arg1;
            var _local6:* = new Loader();
            _local6.load(new URLRequest(_arg2), new LoaderContext(false, new ApplicationDomain(ApplicationDomain.currentDomain)));
            _local6.contentLoaderInfo.addEventListener(Event.COMPLETE, onFileLoadComplete, false, 0, true);
            _local6.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onFileLoadProgress, false, 0, true);
            history[_arg2] = {
                ts:_local5,
                ldr:_local6
            };
        }

        private function onFileLoadComplete(_arg1:Event):void{
            var _local5:String;
            var _local6:Object;
            var _local2:* = rootClass.world;
            var _local3:Loader = Loader(_arg1.target.loader);
            try {
                for each (_local5 in history) {
                    if (history[_local5].ldr == _local3){
                        delete history[_local5];
                    };
                };
            }
            catch(e:Error) {
            };
            _local3.contentLoaderInfo.removeEventListener(Event.COMPLETE, onFileLoadComplete);
            _local3.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onFileLoadProgress);
            var _local4:* = MovieClip(_local3.content);
            mcDest.addChild(_local4);
            if (((isEvent) && (("eventTrigger" in _local2.map)))){
                _local6 = {
                    cmd:"fileLoaded",
                    args:{loc:"default"}
                };
                _local2.map.eventTrigger(_local6);
            };
            mcDest = null;
            try {
                MovieClip(parent).removeChild(this);
            }
            catch(e:Error) {
            };
        }

        private function onFileLoadProgress(_arg1:ProgressEvent):void{
            var _local2:int = Math.floor(((_arg1.bytesLoaded / _arg1.bytesTotal) * 100));
            if (_arg1.bytesTotal <= 0){
                _local2 = 0;
            };
            strLoad.text = "Loading!";
            mcPct.text = (_local2 + "%");
        }

        public function closeHistory():void{
            var _local1:String;
            for each (_local1 in history) {
                try {
                    history[_local1].ldr.close();
                }
                catch(e:Error) {
                };
                delete history[_local1];
            };
            history = {};
        }

        private function onCancelClick(_arg1:MouseEvent):void{
            MovieClip(Game.root).logout();
            MovieClip(parent).removeChild(this);
        }


    }
}//package 

