// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//org.sepy.ColorPicker.ColorPicker2

package org.sepy.ColorPicker{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.geom.ColorTransform;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.geom.*;
    import fl.motion.*;

    public class ColorPicker3 extends MovieClip {

        private static var ADV_PANEL_DEPTH:Number = 5;
        public static var version:String = "2.2";
        public static var DOWN_LEFT:String = "DL";
        public static var DOWN_RIGHT:String = "DR";
        public static var UP_LEFT:String = "UL";
        public static var UP_RIGHT:String = "UR";
        private static var MIN_WIDTH:Number = 130;

        public var cpicker:MovieClip;
        private var _colors:Array;
        private var _opening_color:Number;
        private var _color:Number;
        private var _direction:String;
        private var _columns:Number = 21;
        private var panel:MovieClip;
        private var _baseColors:Array;
        private var selectedColorMC:MovieClip;
        public var _opened:Boolean;
        private var _allowUserColor:Boolean;
        private var keyListener:Object;
        private var advancedColor:MovieClip;
        private var noColor:MovieClip;
        public var advancedColorPanel:MovieClip;
        private var _useAdvColors:Boolean;
        private var _useNoColor:Boolean;
        private var newMC:MovieClip;
        private var newClass;
        private var hover:Boolean = false;
        private var hoverColor:uint;
        public var m_fillType:String = "linear";
        public var m_colors:Array;
        public var m_alphas:Array;
        public var m_ratios:Array;
        public var m_matrix:Object;

        public function ColorPicker3(){
            _colors = new Array();
            m_colors = [0xFF0000, 0xFFFF00, 0xFF00, 0xFFFF, 0xFF, 0xFF00FF, 0xFF0000];
            m_alphas = [100, 100, 100, 100, 100, 100, 100];
            m_ratios = [0, 42, 64, 127, 184, 215, 0xFF];
            m_matrix = {
                matrixType:"box",
                x:0,
                y:0,
                w:175,
                h:187,
                r:0
            };
            super();
            addFrameScript(0, frame1);
            _color = 0;
            _allowUserColor = true;
            _baseColors = [0xFF00FF, 0xFFFF, 0xFFFF00, 0xFF, 0xFF00, 0xFF0000, 0xFFFFFF, 0xCCCCCC, 0x999999, 0x666666, 0x333333, 0];
            _colors = this.getStandardColors();
            initComponent();
        }

        public static function ColorToString(_arg1:Number):String{
            var _local2:String = Math.abs(_arg1).toString(16);
            while (_local2.length < 6) {
                _local2 = ("0" + _local2);
            };
            return (_local2.toUpperCase());
        }

        public static function StringToColor(_arg1:String):Number{
            return (parseInt(_arg1, 16));
        }

        public static function ColorToRGB(_arg1:Number):Object{
            var _local2:Object = new Object();
            _local2.red = ((_arg1 >> 16) & 0xFF);
            _local2.green = ((_arg1 >> 8) & 0xFF);
            _local2.blue = (_arg1 & 0xFF);
            return (_local2);
        }


        private function initComponent():void{
            this.useHandCursor = false;
            this.cpicker.nocolor_face.visible = false;
            this.cpicker.addEventListener(MouseEvent.CLICK, openMC, false, 0, true);
        }

        public function setIsOpened(_arg1:Boolean):void{
            if (((_arg1) && (!(_opened)))){
                _opening_color = _color;
                attachPanel();
                _opened = true;
            }
            else {
                if (panel != null){
                    this.removeChild(panel);
                    panel = null;
                    stage.removeEventListener(MouseEvent.CLICK, onClickOutside, false);
                };
                if (advancedColorPanel != null){
                    this.removeChild(advancedColorPanel);
                    advancedColorPanel = null;
                };
                _opened = false;
            };
        }

        public function getIsOpened():Boolean{
            return (((_opened) || (!((advancedColorPanel == null)))));
        }

        private function colorMC(_arg1:MovieClip, _arg2:uint):void{
            var _local3:* = ColorToRGB(_arg2);
            _arg1.transform.colorTransform = new ColorTransform(1, 1, 1, 1, _local3.red, _local3.green, _local3.blue, 0);
        }

        private function attachPanel():void{
            panel = new MovieClip();
            panel.name = "panel";
            newMC = new MovieClip();
            newMC.name = "backgrounds";
            panel.addChild(newMC);
            newMC = new MovieClip();
            newMC.name = "colors";
            panel.colors = panel.addChild(newMC);
            newMC.x = 3;
            newMC.y = 26;
            newMC.addEventListener(MouseEvent.ROLL_OUT, onRollOutColors, false, 0, true);
            populateColorPanel();
            var _local1:Number = (((((newMC.width < ColorPicker2.MIN_WIDTH)) ? ColorPicker2.MIN_WIDTH : newMC.width) + 6) + newMC.x);
            var _local2:Number = ((newMC.height + 6) + newMC.y);
            var _local3:MovieClip = (panel.getChildByName("backgrounds") as MovieClip);
            _local3.graphics.lineStyle(1, 0xFFFFFF, 100);
            _local3.graphics.beginFill(13947080, 100);
            _local3.graphics.moveTo(0, 0);
            _local3.graphics.lineTo(_local1, 0);
            _local3.graphics.lineStyle(1, 0x808080, 100);
            _local3.graphics.lineTo(_local1, _local2);
            _local3.graphics.lineTo(0, _local2);
            _local3.graphics.lineStyle(1, 0xFFFFFF, 100);
            _local3.graphics.lineTo(0, 0);
            _local3.graphics.endFill();
            _local3.graphics.lineStyle(1, 0, 100);
            _local3.graphics.moveTo((_local1 + 1), 0);
            _local3.graphics.lineTo((_local1 + 1), (_local2 + 1));
            _local3.graphics.lineTo(0, (_local2 + 1));
            newMC = (new ColorDisplay() as MovieClip);
            newMC.name = "color_display";
            panel.addChild(newMC);
            newMC.color = selectedColor;
            colorMC(newMC, selectedColor);
            newMC.x = 3;
            newMC.y = 3;
            newMC.addEventListener(MouseEvent.CLICK, onClicks, false, 0, true);
            newMC = new ColorInput();
            newMC.name = "color_input";
            panel.addChildAt(newMC, 1);
            newMC.color = selectedColor;
            newMC.x = 48;
            newMC.y = 3;
            var _local4:MovieClip = (panel.getChildByName("colors") as MovieClip);
            newMC = new face_borders();
            newMC.name = "face_borders";
            var _local5:ColorTransform = newMC.transform.colorTransform;
            _local5.color = 0xFFFFFF;
            newMC.transform.colorTransform = _local5;
            _local4.face_borders = _local4.addChild(newMC);
            if (selectedColorMC == null){
                newMC.visible = false;
            }
            else {
                newMC.x = selectedColorMC.x;
                newMC.y = selectedColorMC.y;
            };
            switch (direction){
                case ColorPicker2.DOWN_LEFT:
                    panel.x = ((cpicker.x - panel.width) + cpicker.width);
                    panel.y = ((cpicker.y + cpicker.height) + 5);
                    break;
                case ColorPicker2.UP_LEFT:
                    panel.x = ((cpicker.x - panel.width) + cpicker.width);
                    panel.y = ((cpicker.y - panel.height) - 5);
                    break;
                case ColorPicker2.UP_RIGHT:
                    panel.x = cpicker.x;
                    panel.y = ((cpicker.y - panel.height) - 5);
                    break;
                default:
                    panel.x = cpicker.x;
                    panel.y = ((cpicker.y + cpicker.height) + 5);
            };
            if (useNoColorSelector){
                noColor = (new NoColorButton() as MovieClip);
                noColor.name = "NoColorButton";
                panel.addChild(noColor);
                noColor.x = ((panel.width - noColor.width) - 7);
                noColor.y = 3;
            };
            if (useAdvancedColorSelector){
                advancedColor = (new AdvancedColorButton() as MovieClip);
                advancedColor.name = "advancedColor";
                panel.addChild(advancedColor);
                advancedColor.x = ((panel.width - advancedColor.width) - 7);
                advancedColor.y = 3;
                if (useNoColorSelector){
                    noColor.x = ((advancedColor.x - noColor.width) - 4);
                };
            };
            this.addChild(panel);
            stage.addEventListener(MouseEvent.CLICK, onClickOutside, false, 0, true);
        }

        public function onRollOutColors(_arg1:MouseEvent):void{
            if (panel != null){
                panel.colors.face_borders.visible = false;
            };
            updateColors(selectedColor, true);
        }

        public function onClickOutside(_arg1:MouseEvent):void{
            if (advancedColorPanel == null){
                if (!((panel.contains(DisplayObject(_arg1.target))) || (cpicker.contains(DisplayObject(_arg1.target))))){
                    setIsOpened(false);
                };
            };
        }

        private function onClicks(_arg1:MouseEvent):void{
            this.click((_arg1.currentTarget as MovieClip));
        }

        private function populateColorPanel(){
            var _local2:Number;
            var _local3:MovieClip;
            var _local8:Object;
            var _local1:Array = _colors.slice();
            var _local4:Number = 0;
            var _local5:Number = 0;
            var _local6:Number = 0;
            var _local7:MovieClip = (panel.getChildByName("colors") as MovieClip);
            while (_local1.length) {
                _local2 = Number(_local1.shift());
                _local8 = ColorToRGB(_local2);
                _local3 = (new ColorBox(_local8) as MovieClip);
                _local3.name = ("single_" + _local6);
                _local7.addChild(_local3);
                _local3.addEventListener(MouseEvent.ROLL_OVER, over, false, 0, true);
                _local3.addEventListener(MouseEvent.ROLL_OUT, out, false, 0, true);
                _local3.addEventListener(MouseEvent.CLICK, onClicks, false, 0, true);
                if (_local2 == selectedColor){
                    selectedColorMC = _local3;
                };
                if (((((_local6 % _columns) == 0)) && ((_local6 > 0)))){
                    _local5 = (_local5 + _local3.height);
                    _local4 = 0;
                };
                _local3.x = _local4;
                _local3.y = _local5;
                _local4 = (_local4 + _local3.width);
                _local6++;
            };
        }

        public function getStandardColors():Array{
            var _local11:*;
            var _local1:Array = new Array();
            var _local2:Number = 0xFFFFFF;
            var _local3:Number = 0x3300;
            var _local4:Number = 0x320100;
            var _local5:Number = 0x9900FF;
            var _local6:Number = 51;
            var _local7:Number = 10026753;
            var _local8:Number = _local2;
            var _local9:Number = _local2;
            var _local10:* = 0;
            while (_local10 < 12) {
                _local11 = 0;
                while (_local11 < 21) {
                    if (_local11 > 0){
                        if (_local11 == 18){
                            _local8 = 0;
                        }
                        else {
                            if (_local11 == 19){
                                _local8 = _baseColors[_local10];
                            }
                            else {
                                if (_local11 == 20){
                                    _local8 = 0;
                                }
                                else {
                                    if (((((_local11 % 6) == 0)) && ((_local11 > 0)))){
                                        _local8 = (_local8 - _local4);
                                    }
                                    else {
                                        _local8 = (_local8 - _local3);
                                    };
                                };
                            };
                        };
                    };
                    _local1.push(_local8);
                    _local11++;
                };
                if (_local10 == 5){
                    _local9 = (_local9 - _local7);
                }
                else {
                    _local9 = (_local9 - _local6);
                };
                _local8 = _local9;
                _local10++;
            };
            _local1.reverse();
            return (_local1);
        }

        public function set selectedColor(_arg1:Number):void{
            _color = _arg1;
            updateColors(_arg1, true);
            updateface();
        }

        public function get selectedColor():Number{
            if (hover){
                return (hoverColor);
            };
            return (_color);
        }

        public function set direction(_arg1:String){
            _direction = _arg1;
        }

        public function get direction():String{
            return (_direction);
        }

        public function set columns(_arg1:Number):void{
            _columns = _arg1;
        }

        public function get columns():Number{
            return (_columns);
        }

        public function set allowUserColor(_arg1:Boolean){
            _allowUserColor = _arg1;
        }

        public function get allowUserColor():Boolean{
            return (_allowUserColor);
        }

        public function set colors(_arg1:Array){
            _colors = _arg1;
        }

        public function get colors():Array{
            return (_colors);
        }

        public function get useAdvancedColorSelector():Boolean{
            return (_useAdvColors);
        }

        public function set useAdvancedColorSelector(_arg1:Boolean):void{
            _useAdvColors = _arg1;
        }

        public function get useNoColorSelector():Boolean{
            return (_useNoColor);
        }

        public function set useNoColorSelector(_arg1:Boolean):void{
            _useNoColor = _arg1;
        }

        public function setAdvancedColorsMatrix(_arg1:String, _arg2:Array, _arg3:Array, _arg4:Array):void{
            m_fillType = _arg1;
            m_colors = _arg2;
            m_alphas = _arg3;
            m_ratios = _arg4;
        }

        public function getRGB():String{
            return (ColorPicker2.ColorToString(selectedColor));
        }

        private function RGBtoColor(_arg1:Object):int{
            var _local2:int;
            _local2 = ((_local2 | _arg1.red) << 16);
            _local2 = (_local2 | (_arg1.green << 8));
            _local2 = (_local2 | _arg1.blue);
            return (_local2);
        }

        private function updateColors(_arg1:Number, _arg2:Boolean){
            var _local4:MovieClip;
            if (_arg1 < 0){
                cpicker.nocolor_face.visible = true;
            }
            else {
                cpicker.nocolor_face.visible = false;
            };
            var _local3:* = ColorToRGB(_arg1);
            if (panel != null){
                _local4 = MovieClip(panel.getChildByName("color_display"));
                _local4.transform.colorTransform = new ColorTransform(1, 1, 1, 1, _local3.red, _local3.green, _local3.blue, 0);
                if (_arg2){
                    _local4 = MovieClip(panel.getChildByName("color_input"));
                    _local4.color = _arg1;
                };
            };
        }

        private function updateface():void{
            var _local1:* = ColorToRGB(selectedColor);
            cpicker.face.transform.colorTransform = new ColorTransform(1, 1, 1, 1, _local1.red, _local1.green, _local1.blue, 0);
        }

        private function over(_arg1:MouseEvent){
            var _local2:* = (_arg1.currentTarget as MovieClip);
            var _local3:* = _local2.color;
            hover = true;
            hoverColor = RGBtoColor(_local3);
            updateColors(hoverColor, true);
            _local2 = MovieClip(panel.getChildByName("colors")).getChildByName("face_borders");
            _local2.x = MovieClip(_arg1.currentTarget).x;
            _local2.y = MovieClip(_arg1.currentTarget).y;
            _local2.visible = true;
            this.dispatchEvent(new Event("ROLL_OVER"));
        }

        private function out(_arg1:MouseEvent){
            hover = false;
            this.dispatchEvent(new Event("ROLL_OUT"));
        }

        public function click(_arg1:MovieClip){
            var _local2:*;
            if (_arg1 == advancedColor){
                setIsOpened(false);
                createAdvancedColorPanel(selectedColor);
                selectedColor = _opening_color;
            }
            else {
                _local2 = _arg1.color;
                selectedColor = RGBtoColor(_local2);
                try {
                    setIsOpened(false);
                }
                catch(e) {
                };
                this.dispatchEvent(new Event("CHANGE"));
            };
        }

        private function createAdvancedColorPanel(_arg1:Number):void{
            advancedColorPanel = (new AdvColorPanel(ColorToRGB(_arg1)) as MovieClip);
            advancedColorPanel.name = "advancedColorPanel";
            this.addChild(advancedColorPanel);
            switch (direction){
                case ColorPicker2.DOWN_LEFT:
                    advancedColorPanel.x = ((cpicker.x - advancedColorPanel.width) + cpicker.width);
                    advancedColorPanel.y = ((cpicker.y + cpicker.height) + 5);
                    return;
                case ColorPicker2.UP_LEFT:
                    panel.x = ((cpicker.x + cpicker.width) - advancedColorPanel.width);
                    panel.y = ((cpicker.y - advancedColorPanel.height) - 5);
                    return;
                case ColorPicker2.UP_RIGHT:
                    panel.x = cpicker.x;
                    panel.y = ((cpicker.y - advancedColorPanel.height) - 5);
                    return;
                case ColorPicker2.DOWN_RIGHT:
                default:
                    advancedColorPanel.x = cpicker.x;
                    advancedColorPanel.y = ((cpicker.y + cpicker.height) + 5);
            };
        }

        public function unload(_arg1:MovieClip){
            this.removeChild(advancedColorPanel);
        }

        public function changed(_arg1:String){
            if (_arg1.charAt(0) == "#"){
                _arg1 = _arg1.substr(1);
            };
            _color = ColorPicker2.StringToColor(_arg1);
            updateColors(_color, false);
        }

        public function openMC(_arg1:MouseEvent):void{
            setIsOpened(!(getIsOpened()));
        }

        function frame1(){
            stop();
        }


    }
}//package org.sepy.ColorPicker

