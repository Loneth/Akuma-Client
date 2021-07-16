// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//org.sepy.ColorPicker.ColorInput

package org.sepy.ColorPicker{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.events.Event;
    import flash.events.*;
    import flash.text.*;

    public class ColorInput extends MovieClip {

        public var _color:Number;
        private var input:TextField;

        public function ColorInput(){
            var _local1:TextFormat;
            super();
            _local1 = new TextFormat();
            _local1.font = "_sans";
            _local1.size = 10;
            input = new TextField();
            input.name = "input";
            input.width = 57;
            input.height = 16;
            this.addChildAt(input, 1);
            input.x = 2;
            input.y = 1;
            input.type = "input";
            input.maxChars = 7;
            input.defaultTextFormat = _local1;
            input.addEventListener(Event.CHANGE, onInput, false, 0, true);
        }

        public function set color(_arg1:Number){
            _color = _arg1;
            input.text = ("#" + ColorPicker2.ColorToString(_arg1));
        }

        public function get color():Number{
            return (_color);
        }

        private function onInput(_arg1:Event):void{
            MovieClip(parent.parent).changed(TextField(_arg1.currentTarget).text);
        }


    }
}//package org.sepy.ColorPicker

