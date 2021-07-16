// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//HouseItemHandleMC

package {
    import flash.display.MovieClip;

    public dynamic class HouseItemHandleMC extends MovieClip {

        public var bCancel:MovieClip;
        public var frame:MovieClip;
        public var bDelete:MovieClip;
        public var mDown:Boolean;

        public function HouseItemHandleMC(){
            addFrameScript(0, frame1);
        }

        function frame1(){
            mDown = false;
        }


    }
}//package 

