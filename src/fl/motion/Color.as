// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//fl.motion.Color

package fl.motion{
    import flash.geom.ColorTransform;
    import flash.display.*;

    public class Color extends ColorTransform {

        private var _tintColor:Number = 0;
        private var _tintMultiplier:Number = 0;

        public function Color(_arg1:Number=1, _arg2:Number=1, _arg3:Number=1, _arg4:Number=1, _arg5:Number=0, _arg6:Number=0, _arg7:Number=0, _arg8:Number=0){
            super(_arg1, _arg2, _arg3, _arg4, _arg5, _arg6, _arg7, _arg8);
        }

        public static function fromXML(_arg1:XML):Color{
            return (Color(new (Color)().parseXML(_arg1)));
        }

        public static function interpolateTransform(_arg1:ColorTransform, _arg2:ColorTransform, _arg3:Number):ColorTransform{
            var _local4:Number = (1 - _arg3);
            var _local5:ColorTransform = new ColorTransform(((_arg1.redMultiplier * _local4) + (_arg2.redMultiplier * _arg3)), ((_arg1.greenMultiplier * _local4) + (_arg2.greenMultiplier * _arg3)), ((_arg1.blueMultiplier * _local4) + (_arg2.blueMultiplier * _arg3)), ((_arg1.alphaMultiplier * _local4) + (_arg2.alphaMultiplier * _arg3)), ((_arg1.redOffset * _local4) + (_arg2.redOffset * _arg3)), ((_arg1.greenOffset * _local4) + (_arg2.greenOffset * _arg3)), ((_arg1.blueOffset * _local4) + (_arg2.blueOffset * _arg3)), ((_arg1.alphaOffset * _local4) + (_arg2.alphaOffset * _arg3)));
            return (_local5);
        }

        public static function interpolateColor(_arg1:uint, _arg2:uint, _arg3:Number):uint{
            var _local4:Number = (1 - _arg3);
            var _local5:uint = ((_arg1 >> 24) & 0xFF);
            var _local6:uint = ((_arg1 >> 16) & 0xFF);
            var _local7:uint = ((_arg1 >> 8) & 0xFF);
            var _local8:uint = (_arg1 & 0xFF);
            var _local9:uint = ((_arg2 >> 24) & 0xFF);
            var _local10:uint = ((_arg2 >> 16) & 0xFF);
            var _local11:uint = ((_arg2 >> 8) & 0xFF);
            var _local12:uint = (_arg2 & 0xFF);
            var _local13:uint = ((_local5 * _local4) + (_local9 * _arg3));
            var _local14:uint = ((_local6 * _local4) + (_local10 * _arg3));
            var _local15:uint = ((_local7 * _local4) + (_local11 * _arg3));
            var _local16:uint = ((_local8 * _local4) + (_local12 * _arg3));
            var _local17:uint = ((((_local13 << 24) | (_local14 << 16)) | (_local15 << 8)) | _local16);
            return (_local17);
        }


        public function get brightness():Number{
            return (((this.redOffset) ? (1 - this.redMultiplier) : (this.redMultiplier - 1)));
        }

        public function set brightness(_arg1:Number):void{
            if (_arg1 > 1){
                _arg1 = 1;
            }
            else {
                if (_arg1 < -1){
                    _arg1 = -1;
                };
            };
            var _local2:Number = (1 - Math.abs(_arg1));
            var _local3:Number = 0;
            if (_arg1 > 0){
                _local3 = (_arg1 * 0xFF);
            };
            this.redMultiplier = (this.greenMultiplier = (this.blueMultiplier = _local2));
            this.redOffset = (this.greenOffset = (this.blueOffset = _local3));
        }

        public function setTint(_arg1:uint, _arg2:Number):void{
            this._tintColor = _arg1;
            this._tintMultiplier = _arg2;
            this.redMultiplier = (this.greenMultiplier = (this.blueMultiplier = (1 - _arg2)));
            var _local3:uint = ((_arg1 >> 16) & 0xFF);
            var _local4:uint = ((_arg1 >> 8) & 0xFF);
            var _local5:uint = (_arg1 & 0xFF);
            this.redOffset = Math.round((_local3 * _arg2));
            this.greenOffset = Math.round((_local4 * _arg2));
            this.blueOffset = Math.round((_local5 * _arg2));
        }

        public function get tintColor():uint{
            return (this._tintColor);
        }

        public function set tintColor(_arg1:uint):void{
            this.setTint(_arg1, this.tintMultiplier);
        }

        private function deriveTintColor():uint{
            var _local1:Number = (1 / this.tintMultiplier);
            var _local2:uint = Math.round((this.redOffset * _local1));
            var _local3:uint = Math.round((this.greenOffset * _local1));
            var _local4:uint = Math.round((this.blueOffset * _local1));
            var _local5:uint = (((_local2 << 16) | (_local3 << 8)) | _local4);
            return (_local5);
        }

        public function get tintMultiplier():Number{
            return (this._tintMultiplier);
        }

        public function set tintMultiplier(_arg1:Number):void{
            this.setTint(this.tintColor, _arg1);
        }

        private function parseXML(_arg1:XML=null):Color{
            var _local3:XML;
            var _local4:String;
            var _local5:uint;
            if (!_arg1){
                return (this);
            };
            var _local2:XML = _arg1.elements()[0];
            if (!_local2){
                return (this);
            };
            for each (_local3 in _local2.attributes()) {
                _local4 = _local3.localName();
                if (_local4 == "tintColor"){
                    _local5 = (Number(_local3.toString()) as uint);
                    this.tintColor = _local5;
                }
                else {
                    this[_local4] = Number(_local3.toString());
                };
            };
            return (this);
        }


    }
}//package fl.motion

