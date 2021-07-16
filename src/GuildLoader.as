// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//GuildLoader

package {
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.display.LoaderInfo;

    public class GuildLoader {

        private var lContent:MovieClip;
        private var lClass:Class;
        private var fct:Function;
        private var fctError:Function;
        private var fileName:String;
        private var Linkage:String;
        private var ItemID:int;
        private var bLoaded:Boolean = false;
        private var swfLoader:Loader;

        public function GuildLoader(_arg1:Function, _arg2:String, _arg3:String, _arg4:int=-1, _arg5:Function=null){
            this.swfLoader = new Loader();
            super();
            trace(((((((("f: " + _arg1) + " file: ") + _arg2) + " link: ") + _arg3) + " ID: ") + _arg4));
            this.fct = _arg1;
            this.fctError = _arg5;
            this.fileName = _arg2;
            this.Linkage = _arg3;
            this.ItemID = _arg4;
            this.swfLoader.load(new URLRequest(this.fileName));
            this.swfLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onswfLoadComplete, false, 0, true);
            this.swfLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.onswfLoadError, false, 0, true);
        }

        private function onswfLoadComplete(_arg1:Event):void{
            trace("onswfLoadComplete");
            this.lClass = (LoaderInfo(_arg1.target).applicationDomain.getDefinition(this.Linkage) as Class);
            this.lContent = MovieClip(_arg1.target.content);
            this.bLoaded = true;
            this.fct(this);
        }

        private function onswfLoadError(_arg1:IOErrorEvent):void{
            trace(("guild loader error: " + _arg1));
            if (this.fctError != null){
                this.fctError();
            };
        }

        public function getClass(_arg1:String):Class{
            return ((this.swfLoader.contentLoaderInfo.applicationDomain.getDefinition(_arg1) as Class));
        }

        public function get Loaded():Boolean{
            return (this.bLoaded);
        }

        public function get swfClass():Class{
            return (this.lClass);
        }

        public function get swfContent():MovieClip{
            return (this.lContent);
        }

        public function get ID():int{
            return (this.ItemID);
        }


    }
}//package 

