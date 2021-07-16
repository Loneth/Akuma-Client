// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//org.sepy.ColorPicker.AdvColorPanel

package org.sepy.ColorPicker{
    import flash.display.MovieClip;
    import flash.geom.ColorTransform;
    import flash.events.*;
    import flash.geom.*;

    public class AdvColorPanel extends MovieClip {

        private var _color:Object;
        private var color_map:MovieClip;
        private var color_slider:MovieClip;
        private var color_display:MovieClip;
        private var ok_btn:MovieClip;
        private var close_btn:MovieClip;
        private var _hue:Number;
        private var _saturation:Number;
        private var _luminosity:Number;
        private var _red:Number;
        private var _green:Number;
        private var _blue:Number;
        private var _hue_mc:MovieClip;
        private var _saturation_mc:MovieClip;
        private var _luminosity_mc:MovieClip;
        private var _red_mc:MovieClip;
        private var _green_mc:MovieClip;
        private var _blue_mc:MovieClip;
        private var _hlsrgb:HLSRGB;

        public function AdvColorPanel(_arg1:Object){
            addFrameScript(0, frame1);
            _hlsrgb = new HLSRGB();
            color_map = (new ColorMap() as MovieClip);
            color_map.name = "color_map";
            this.addChild(color_map);
            color_map.x = 10;
            color_map.y = 8;
            color_slider = (new ColorSlider() as MovieClip);
            color_slider.name = "color_slider";
            this.addChildAt(color_slider, 1);
            color_slider.x = ((color_map.x + color_map.width) + 10);
            color_slider.y = color_map.y;
            color_display = (new ColorDisplay() as MovieClip);
            color_display.name = "color_display";
            this.addChildAt(color_display, 2);
            color_display.x = color_map.x;
            color_display.y = (color_map.y + color_map.height);
            _hue_mc = (new IntInput("H", "dynamic") as MovieClip);
            _hue_mc.name = "_hue_mc";
            this.addChildAt(_hue_mc, 3);
            _hue_mc.x = 125;
            _hue_mc.y = (color_map.y + color_map.height);
            _saturation_mc = (new IntInput("S", "dynamic") as MovieClip);
            _saturation_mc.name = "_saturation_mc";
            this.addChildAt(_saturation_mc, 4);
            _saturation_mc.x = _hue_mc.x;
            _saturation_mc.y = ((_hue_mc.y + _hue_mc.height) + 2);
            _luminosity_mc = (new IntInput("L", "dynamic") as MovieClip);
            _luminosity_mc.name = "_luminosity_mc";
            this.addChildAt(_luminosity_mc, 5);
            _luminosity_mc.x = _hue_mc.x;
            _luminosity_mc.y = ((_saturation_mc.y + _saturation_mc.height) + 2);
            _red_mc = (new IntInput("R", "input") as MovieClip);
            _red_mc.name = "_red_mc";
            this.addChildAt(_red_mc, 6);
            _red_mc.x = 175;
            _red_mc.y = _hue_mc.y;
            _green_mc = (new IntInput("G", "input") as MovieClip);
            _green_mc.name = "_green_mc";
            this.addChildAt(_green_mc, 7);
            _green_mc.x = 175;
            _green_mc.y = _saturation_mc.y;
            _blue_mc = (new IntInput("B", "input") as MovieClip);
            _blue_mc.name = "_blue_mc";
            this.addChildAt(_blue_mc, 8);
            _blue_mc.x = 175;
            _blue_mc.y = _luminosity_mc.y;
            ok_btn = (new OkButton() as MovieClip);
            ok_btn.name = "ok_btn";
            this.addChildAt(ok_btn, 9);
            ok_btn.x = color_map.x;
            ok_btn.y = _blue_mc.y;
            close_btn = (new CancelButton() as MovieClip);
            close_btn.name = "close_btn";
            this.addChildAt(close_btn, 10);
            close_btn.x = (ok_btn.x + ok_btn.width);
            close_btn.y = _blue_mc.y;
            color = _arg1;
            init();
        }

        public static function ColorToRGB(_arg1:Number):Object{
            var _local2:Object = new Object();
            _local2.red = ((_arg1 >> 16) & 0xFF);
            _local2.green = ((_arg1 >> 8) & 0xFF);
            _local2.blue = (_arg1 & 0xFF);
            return (_local2);
        }


        function init(){
            _hue_mc.max = 360;
            _saturation_mc.max = 240;
            _luminosity_mc.max = 240;
            _red_mc.max = 0xFF;
            _green_mc.max = 0xFF;
            _blue_mc.max = 0xFF;
            color_slider.color = color;
            if (color_map.findTheColor(RGBtoColor(color))){
            };
            this.change(this, RGBtoColor(color));
            updateHLS(color_slider.getCurrentColor(), true);
        }

        public function changed(_arg1:MovieClip, _arg2:Number):void{
            _hlsrgb.color = new RGB(_red_mc.value, _green_mc.value, _blue_mc.value);
            var _local3:Number = _hlsrgb.getRGB();
            color_map.findTheColor(_local3);
            this.change(this, _local3);
        }

        private function RGBtoColor(_arg1:Object):int{
            var _local2:int;
            _local2 = (_local2 + (_arg1.red << 16));
            _local2 = (_local2 + (_arg1.green << 8));
            _local2 = (_local2 + _arg1.blue);
            return (_local2);
        }

        public function change(_arg1:MovieClip, _arg2:Number):void{
            var _local3:Object = ColorToRGB(_arg2);
            if (_arg1 == color_map){
                color = _local3;
                color_slider.color = _arg2;
                color_display.transform.colorTransform = new ColorTransform(1, 1, 1, 1, _local3.red, _local3.green, _local3.blue, 0);
                updateHLS(color_slider.getCurrentColor(), true);
            }
            else {
                if (_arg1 == this){
                    color = _local3;
                    color_slider.color = _arg2;
                    color_display.transform.colorTransform = new ColorTransform(1, 1, 1, 1, _local3.red, _local3.green, _local3.blue, 0);
                    updateHLS(color_slider.getCurrentColor(), false);
                };
            };
        }

        public function changing(_arg1:Number):void{
            var _local2:Object = ColorToRGB(_arg1);
            color_display.transform.colorTransform = new ColorTransform(1, 1, 1, 1, _local2.red, _local2.green, _local2.blue, 0);
            color = _local2;
            updateHLS(color_slider.getCurrentColor(), true);
        }

        private function updateHLS(_arg1:Number, _arg2:Boolean){
            var _local3:Object;
            if (_arg2){
                _local3 = ColorPicker2.ColorToRGB(_arg1);
                _hlsrgb.hue = (_hlsrgb.saturation = (_hlsrgb.luminance = 0));
                _hlsrgb.red = _local3.red;
                _hlsrgb.green = _local3.green;
                _hlsrgb.blue = _local3.blue;
            };
            red = Math.round(_hlsrgb.red);
            green = Math.round(_hlsrgb.green);
            blue = Math.round(_hlsrgb.blue);
            hue = _hlsrgb.hue;
            saturation = _hlsrgb.saturation;
            luminosity = _hlsrgb.luminance;
        }

        public function click(_arg1:MovieClip){
            if (_arg1 == ok_btn){
                MovieClip(parent).click(this);
            }
            else {
                if (_arg1 == close_btn){
                    MovieClip(parent)._opened = false;
                    MovieClip(parent).advancedColorPanel = null;
                    MovieClip(parent).removeChild(this);
                };
            };
        }

        public function set color(_arg1:Object){
            _color = _arg1;
        }

        public function get color():Object{
            return (_color);
        }

        public function set hue(_arg1:Number){
            _arg1 = Math.round(_arg1);
            _hue = _arg1;
            _hue_mc.value = _arg1;
        }

        public function set saturation(_arg1:Number){
            _arg1 = Math.round((_arg1 * 240));
            _saturation = _arg1;
            _saturation_mc.value = _arg1;
        }

        public function set luminosity(_arg1:Number){
            _arg1 = Math.round((_arg1 * 240));
            _luminosity = _arg1;
            _luminosity_mc.value = _arg1;
        }

        public function set red(_arg1:Number){
            _red = _arg1;
            _red_mc.value = _arg1;
        }

        public function set green(_arg1:Number){
            _green = _arg1;
            _green_mc.value = _arg1;
        }

        public function set blue(_arg1:Number){
            _blue = _arg1;
            _blue_mc.value = _arg1;
        }

        function frame1(){
            stop();
        }


    }
}//package org.sepy.ColorPicker

