// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//org.sepy.ColorPicker.ColorMap

package org.sepy.ColorPicker{
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.filters.*;

    public class ColorMap extends MovieClip {

        private var mc:Sprite;
        private var cross_Mc:MovieClip;
        private var cross_Mask:MovieClip;
        public var newMC;
        private var b:Bitmap;
        private var bmp:BitmapData;
        private var _color:Number;
        private var down:Boolean = false;
        public var m_fillType:String = "linear";
        public var m_colors:Array;
        public var m_alphas:Array;
        public var m_ratios:Array;
        public var m_matrix:Matrix;

        public function ColorMap(){
            m_colors = [0xFF0000, 0xFFFF00, 0xFF00, 0xFFFF, 0xFF, 0xFF00FF, 0xFF0000];
            m_alphas = [100, 100, 100, 100, 100, 100, 100];
            m_ratios = [0, 42, 64, 127, 184, 215, 0xFF];
            m_matrix = new Matrix();
            super();
            addFrameScript(0, frame1);
            mc = new Sprite();
            mc.name = "mc";
            this.addChild(mc);
            mc.x = 1;
            mc.y = 1;
            cross_Mc = (new cross_mc() as MovieClip);
            cross_Mc.name = "cross_mc";
            this.addChild(cross_Mc);
            cross_Mask = (new cross_mask() as MovieClip);
            cross_Mask.name = "cross_mask";
            this.addChild(cross_Mask);
            cross_Mc.mask = cross_Mask;
            init();
        }

        private function init():void{
            var _local1 = "linear";
            var _local2:Array = [0xFFFFFF, 0, 0];
            var _local3:Array = [0, 0, 100];
            var _local4:Array = [0, 127, 0xFF];
            var _local5:Matrix = new Matrix();
            _local5.createGradientBox(175, 187, ((90 * Math.PI) / 180));
            m_matrix.createGradientBox(175, 187);
            mc.graphics.beginGradientFill(m_fillType, m_colors, m_alphas, m_ratios, (m_matrix as Matrix));
            mc.graphics.moveTo(0, 0);
            mc.graphics.lineTo(175, 0);
            mc.graphics.lineTo(175, 187);
            mc.graphics.lineTo(0, 187);
            mc.graphics.lineTo(0, 0);
            mc.graphics.endFill();
            newMC = new MovieClip();
            newMC.name = "upper";
            mc.addChild(newMC);
            newMC.graphics.beginGradientFill(_local1, _local2, _local3, _local4, (_local5 as Matrix));
            newMC.graphics.moveTo(0, 0);
            newMC.graphics.lineTo(175, 0);
            newMC.graphics.lineTo(175, 187);
            newMC.graphics.lineTo(0, 187);
            newMC.graphics.lineTo(0, 0);
            newMC.graphics.endFill();
            this.addEventListener(MouseEvent.MOUSE_DOWN, onDown, false, 0, true);
            this.addEventListener(MouseEvent.MOUSE_UP, onUp, false, 0, true);
            this.addEventListener(MouseEvent.MOUSE_MOVE, onMove, false, 0, true);
            this.draw();
        }

        private function onDown(_arg1:MouseEvent):void{
            down = true;
            onMove(_arg1);
        }

        private function onUp(_arg1:MouseEvent):void{
            down = false;
        }

        private function onMove(_arg1:MouseEvent):void{
            var _local2:Number;
            if (down){
                _local2 = bmp.getPixel(((mouseX - mc.x) - 1), (mouseY - mc.y));
                this.cross_Mc.x = mouseX;
                this.cross_Mc.y = mouseY;
                MovieClip(parent).change(this, _local2);
            };
        }

        private function draw():void{
            bmp = new BitmapData(mc.width, mc.height);
            bmp.draw(mc);
        }

        private function change(_arg1:MovieClip, _arg2:Number){
            _color = _arg2;
        }

        public function set color(_arg1:Number):void{
            _color = _arg1;
        }

        public function get color():Number{
            return (_color);
        }

        public function findTheColor(_arg1:Number):Boolean{
            var _local2:Rectangle = bmp.getColorBoundsRect(0xFFFFFFFF, (0xFF000000 + _arg1), true);
            cross_Mc.x = ((_local2.x + (_local2.width / 2)) + 2);
            cross_Mc.y = ((_local2.y + (_local2.height / 2)) + 2);
            return (!((((((((_local2.x == 0)) && ((_local2.y == 0)))) && ((_local2.width == bmp.width)))) && ((_local2.width == bmp.height)))));
        }

        function frame1(){
            stop();
        }


    }
}//package org.sepy.ColorPicker

