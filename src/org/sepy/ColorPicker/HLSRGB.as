// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//org.sepy.ColorPicker.HLSRGB

package org.sepy.ColorPicker{
    import org.sepy.ColorPicker.RGB;

    class HLSRGB {

        private var _red:Number = 0;
        private var _green:Number = 0;
        private var _blue:Number = 0;
        private var _hue:Number = 0;
        private var _luminance:Number = 0;
        private var _saturation:Number = 0;


        public function get red():Number{
            return (_red);
        }

        public function set red(_arg1:Number):void{
            _red = _arg1;
            ToHLS();
        }

        public function get green():Number{
            return (_green);
        }

        public function set green(_arg1:Number):void{
            _green = _arg1;
            ToHLS();
        }

        public function get blue():Number{
            return (_blue);
        }

        public function set blue(_arg1:Number):void{
            _blue = _arg1;
            ToHLS();
        }

        public function get luminance():Number{
            return (_luminance);
        }

        public function set luminance(_arg1:Number):void{
            if ((((_arg1 < 0)) || ((_arg1 > 1)))){
                trace((_arg1 + " exceeds luminance bounds.  Luminance must be between 0.0 and 1.0"));
            }
            else {
                _luminance = _arg1;
                ToRGB();
            };
        }

        public function get hue():Number{
            return (_hue);
        }

        public function set hue(_arg1:Number):void{
            if ((((_arg1 < 0)) || ((_arg1 > 360)))){
                trace((_arg1 + " exceeds hue bounds.  Hue must be between 0.0 and 360.0"));
            }
            else {
                _hue = _arg1;
                ToRGB();
            };
        }

        public function get saturation():Number{
            return (_saturation);
        }

        public function set saturation(_arg1:Number):void{
            if ((((_arg1 < 0)) || ((_arg1 > 1)))){
                trace((_arg1 + "exceeds saturation bounds.  Saturation must be between 0.0 and 1.0"));
            }
            else {
                _saturation = _arg1;
                ToRGB();
            };
        }

        public function get color():RGB{
            var _local1:* = new RGB(_red, _green, _blue);
            return (_local1);
        }

        public function getRGB():Number{
            return ((((_red << 16) | (_green << 8)) | _blue));
        }

        public function set color(_arg1:RGB):void{
            _red = _arg1.r;
            _green = _arg1.g;
            _blue = _arg1.b;
            ToHLS();
        }

        public function lightenBy(_arg1:Number):void{
            _luminance = (_luminance * (1 + _arg1));
            if (_luminance > 1){
                _luminance = 1;
            };
            ToRGB();
        }

        public function darkenBy(_arg1:Number):void{
            _luminance = (_luminance * _arg1);
            ToRGB();
        }

        private function ToHLS():void{
            var _local5:Number;
            var _local6:Number;
            var _local7:Number;
            var _local1:Number = Math.min(_red, Math.min(_green, _blue));
            var _local2:Number = Math.max(_red, Math.max(_green, _blue));
            var _local3:Number = (_local2 - _local1);
            var _local4:Number = (_local2 + _local1);
            _luminance = (_local4 / 510);
            if (_local2 == _local1){
                _saturation = 0;
                _hue = 0;
            }
            else {
                _local5 = ((_local2 - _red) / _local3);
                _local6 = ((_local2 - _green) / _local3);
                _local7 = ((_local2 - _blue) / _local3);
                _saturation = (((_luminance)<=0.5) ? (_local3 / _local4) : (_local3 / (510 - _local4)));
                if (_red == _local2){
                    _hue = (60 * ((6 + _local7) - _local6));
                }
                else {
                    if (_green == _local2){
                        _hue = (60 * ((2 + _local5) - _local7));
                    }
                    else {
                        if (_blue == _local2){
                            _hue = (60 * ((4 + _local6) - _local5));
                        };
                    };
                };
                _hue = (_hue % 360);
            };
        }

        private function ToRGB():void{
            var _local1:Number;
            var _local2:Number;
            if (_saturation == 0){
                _red = (_green = (_blue = (_luminance * 0xFF)));
            }
            else {
                if (_luminance <= 0.5){
                    _local2 = (_luminance + (_luminance * _saturation));
                }
                else {
                    _local2 = ((_luminance + _saturation) - (_luminance * _saturation));
                };
                _local1 = ((2 * _luminance) - _local2);
                _red = ToRGB1(_local1, _local2, (_hue + 120));
                _green = ToRGB1(_local1, _local2, _hue);
                _blue = ToRGB1(_local1, _local2, (_hue - 120));
            };
        }

        private function ToRGB1(_arg1:Number, _arg2:Number, _arg3:Number):Number{
            if (_arg3 > 360){
                _arg3 = (_arg3 - 360);
            }
            else {
                if (_arg3 < 0){
                    _arg3 = (_arg3 + 360);
                };
            };
            if (_arg3 < 60){
                _arg1 = (_arg1 + (((_arg2 - _arg1) * _arg3) / 60));
            }
            else {
                if (_arg3 < 180){
                    _arg1 = _arg2;
                }
                else {
                    if (_arg3 < 240){
                        _arg1 = (_arg1 + (((_arg2 - _arg1) * (240 - _arg3)) / 60));
                    };
                };
            };
            return ((_arg1 * 0xFF));
        }

        public function toString():String{
            return ((((((((((((("[R:" + red) + ", G:") + green) + ", B:") + blue) + ", H:") + hue) + ", S:") + saturation) + ", L:") + luminance) + "]"));
        }


    }
}//package org.sepy.ColorPicker

