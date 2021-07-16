// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//org.sepy.ColorPicker.ColorBox

package org.sepy.ColorPicker{
    import flash.display.MovieClip;
    import flash.geom.ColorTransform;
    import flash.geom.*;

    public class ColorBox extends MovieClip {

        private var faceMC:MovieClip;
        private var face_border:MovieClip;
        private var colorObj:Object;

        public function ColorBox(_arg1:Object){
            colorObj = _arg1;
            this.useHandCursor = false;
            faceMC = (new FaceColor() as MovieClip);
            faceMC.name = "face";
            this.addChild(faceMC);
            faceMC.transform.colorTransform = new ColorTransform(1, 1, 1, 1, _arg1.red, _arg1.green, _arg1.blue, 0);
            face_border = (new face_borders() as MovieClip);
            face_border.name = "face_border";
            this.addChild(face_border);
        }

        public function get color():Object{
            return (colorObj);
        }

        public function getRGB():String{
            return (("0x" + faceMC.color.toString(16)));
        }


    }
}//package org.sepy.ColorPicker

