// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//org.sepy.ColorPicker.RGB

package org.sepy.ColorPicker{
    public class RGB {

        private var _r:Number;
        private var _g:Number;
        private var _b:Number;

        public function RGB(_arg1:Number, _arg2:Number, _arg3:Number){
            _r = _arg1;
            _g = _arg2;
            _b = _arg3;
        }

        public function set r(_arg1:Number):void{
            _r = _arg1;
        }

        public function get r():Number{
            return (_r);
        }

        public function set g(_arg1:Number):void{
            _g = _arg1;
        }

        public function get g():Number{
            return (_g);
        }

        public function set b(_arg1:Number):void{
            _b = _arg1;
        }

        public function get b():Number{
            return (_b);
        }

        public function getRGB():Number{
            return ((((r << 16) | (g << 8)) | b));
        }

        public function toString():String{
            return ((((((("[R:" + r) + ", G:") + g) + ", B:") + b) + "]"));
        }


    }
}//package org.sepy.ColorPicker

