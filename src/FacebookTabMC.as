// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//FacebookTabMC

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.display.DisplayObject;
    import flash.text.*;

    public class FacebookTabMC extends MovieClip {

        private var args:Object;
        private var clicked:Boolean = false;

        public function FacebookTabMC(){
            args = {};
            super();
            buttonMode = true;
            addEventListener(MouseEvent.CLICK, onShareClick, false, 0, true);
        }

        public function init(_arg1:Object=null):void{
            clicked = false;
            buttonMode = true;
            args = _arg1;
        }

        private function onShareClick(_arg1:MouseEvent):void{
            var _local2:FacebookShareEvent = new FacebookShareEvent(FacebookShareEvent.SHARE);
            _local2.args = args;
            dispatchEvent(_local2);
        }

        public function positionBy(_arg1:Object){
            var _local3:DisplayObject;
            _arg1.position = _arg1.position.split(" ").join("");
            var _local2:Array = _arg1.position.split(",");
            trace(("positionBy() > " + _local2.toString()));
            if ((((_local2.length > 5)) && (!((_local2[5] == "none"))))){
                trace(((_arg1.parent + ", ") + _local2[5]));
                _local3 = _arg1.parent.getChildByName(_local2[5]);
                if (_local2[2] == "inside"){
                    if (_local2[0] == "left"){
                        x = (_local3.x + _local2[3]);
                    }
                    else {
                        if (_local2[0] == "right"){
                            x = (((_local3.x + _local3.width) - width) - _local2[3]);
                        }
                        else {
                            if (_local2[0] == "center"){
                                x = ((((_local3.x + _local3.width) / 2) - (width / 2)) + _local2[3]);
                            };
                        };
                    };
                    if (_local2[1] == "top"){
                        y = (_local3.y + _local2[4]);
                    }
                    else {
                        if (_local2[1] == "bottom"){
                            y = (((_local3.y + _local3.height) - height) - _local2[4]);
                        }
                        else {
                            if (_local2[1] == "center"){
                                y = ((((_local3.y + _local3.height) / 2) - (height / 2)) + _local2[4]);
                            };
                        };
                    };
                }
                else {
                    if (_local2[0] == "left"){
                        x = ((_local3.x - width) - _local2[3]);
                    }
                    else {
                        if (_local2[0] == "right"){
                            x = ((_local3.x + _local3.width) + _local2[3]);
                        }
                        else {
                            if (_local2[0] == "center"){
                                x = ((((_local3.x + _local3.width) / 2) - (width / 2)) + _local2[3]);
                            };
                        };
                    };
                    if (_local2[1] == "top"){
                        y = ((_local3.y - height) - _local2[4]);
                    }
                    else {
                        if (_local2[1] == "bottom"){
                            y = ((_local3.y + _local3.height) + _local2[4]);
                        }
                        else {
                            if (_local2[1] == "center"){
                                y = ((((_local3.y + _local3.height) / 2) - (height / 2)) + _local2[4]);
                            };
                        };
                    };
                };
            }
            else {
                if (_local2[0] == "absolute"){
                    x = _local2[3];
                };
                if (_local2[1] == "absolute"){
                    y = _local2[4];
                };
            };
            x = int(x);
            y = int(y);
            trace(((x + ", ") + y));
        }


    }
}//package 

