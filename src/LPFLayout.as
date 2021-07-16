// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFLayout

package {
    import flash.display.MovieClip;
    import flash.text.*;

    public class LPFLayout extends MovieClip {

        public var panels:Array;
        public var fData:Object;
        public var w:int;
        public var h:int;
        public var panelID:int = 0;
        public var events:Object;
        public var sMode:String;

        public function LPFLayout():void{
            events = {};
            super();
        }

        public function update(_arg1:Object){
            _arg1 = handleUpdate(_arg1);
            notifyByEventType(_arg1);
        }

        protected function handleUpdate(_arg1:Object):Object{
            return (_arg1);
        }

        public function notifyByEventType(_arg1:Object):void{
            var _local2:Array;
            var _local3:int;
            if (_arg1 != null){
                if (events[_arg1.eventType] != null){
                    _local2 = events[_arg1.eventType];
                    _local3 = 0;
                    while (_local3 < _local2.length) {
                        _local2[_local3].notify(_arg1);
                        _local3++;
                    };
                };
            };
        }

        public function registerForEvents(_arg1:LPFFrame, _arg2:Array):void{
            var _local3:String;
            var _local4:int;
            while (_local4 < _arg2.length) {
                _local3 = _arg2[_local4];
                if (events[_local3] == null){
                    events[_local3] = [];
                };
                if (events[_local3].indexOf(_arg1) == -1){
                    events[_local3].push(_arg1);
                };
                _local4++;
            };
        }

        public function unregisterFrame(_arg1):void{
            var _local2:String;
            var _local3:int;
            while (_local3 < _arg1.eventTypes.length) {
                _local2 = _arg1.eventTypes[_local3];
                if (events[_local2] == null){
                    return;
                };
                while (events[_local2].indexOf(_arg1) > -1) {
                    events[_local2].splice(events[_local2].indexOf(_arg1), 1);
                };
                _local3++;
            };
        }

        public function addPanel(_arg1:Object):MovieClip{
            var _local2:LPFPanel = (addChild(_arg1.panel) as LPFPanel);
            _local2.subscribeTo(this);
            panels.push({
                mc:_local2,
                id:panelID++
            });
            _local2.fOpen(_arg1);
            return (_local2);
        }

        public function delPanel(_arg1):void{
            var _local2:int;
            while (_local2 < panels.length) {
                if (panels[_local2].mc == _arg1){
                    panels.splice(_local2, 1);
                };
                _local2++;
            };
            removeChild(_arg1);
        }

        public function fOpen(_arg1:Object):void{
            var _local2:Object;
            fData = _arg1.fData;
            _local2 = _arg1.r;
            x = _local2.x;
            y = _local2.y;
            w = _local2.w;
            h = _local2.h;
        }

        public function fClose():void{
            var _local1:MovieClip;
            while (panels.length > 0) {
                panels[0].mc.fClose();
                panels.shift();
            };
            if (parent != null){
                _local1 = MovieClip(parent);
                _local1.removeChild(this);
                _local1.onClose();
            };
        }

        protected function tempFill():void{
        }


    }
}//package 

