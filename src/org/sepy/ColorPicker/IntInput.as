// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//org.sepy.ColorPicker.IntInput

package org.sepy.ColorPicker{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.events.Event;
    import flash.events.*;
    import flash.text.*;

    public class IntInput extends MovieClip {

        public var _value:Number;
        private var broadcastMessage:Function;
        private var input:TextField;
        private var tlabel:TextField;
        private var _label:String;
        private var _max:Number;

        public function IntInput(_arg1:String, _arg2:String){
            var _local3:TextFormat;
            super();
            _local3 = new TextFormat();
            _local3.font = "_sans";
            _local3.size = 10;
            tlabel = new TextField();
            tlabel.width = 31;
            tlabel.height = 16;
            this.addChildAt(tlabel, 1);
            tlabel.x = 2;
            tlabel.y = 1;
            tlabel.defaultTextFormat = _local3;
            tlabel.text = _arg1;
            input = new TextField();
            input.height = 16;
            input.width = 31;
            input.name = "input";
            this.addChildAt(input, 2);
            input.x = 22;
            input.y = 1;
            input.type = _arg2;
            input.maxChars = 3;
            input.restrict = "[0-9]";
            input.defaultTextFormat = _local3;
            input.addEventListener(Event.CHANGE, onChanged, false, 0, true);
        }

        public function set value(_arg1:Number){
            _value = _arg1;
            input.text = _value.toString(10);
        }

        public function get value():Number{
            return (_value);
        }

        private function onChanged(_arg1:Event){
            var _local2:Number = Number(input.text);
            if (isNaN(_local2)){
                input.text = "0";
            };
            if (_local2 > _max){
                input.text = _max.toString();
            };
            _value = Number(input.text);
            MovieClip(parent).changed(this, Number(input.text));
        }

        public function set label(_arg1:String):void{
            _label = _arg1;
            tlabel.text = _arg1;
        }

        public function get label():String{
            return (_label);
        }

        public function set max(_arg1:Number){
            _max = _arg1;
        }

        public function get max():Number{
            return (_max);
        }


    }
}//package org.sepy.ColorPicker

