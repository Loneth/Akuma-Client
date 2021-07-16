// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//goldDisplay

package {
    import flash.display.MovieClip;

    public dynamic class copperDisplay extends MovieClip {

        public var tMask:MovieClip;
        public var t:MovieClip;

        public function copperDisplay(){
            addFrameScript(39, frame40);
        }

        function frame40(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

