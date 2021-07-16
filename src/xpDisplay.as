// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//xpDisplay

package {
    import flash.display.MovieClip;

    public dynamic class xpDisplay extends MovieClip {

        public var t:MovieClip;

        public function xpDisplay(){
            addFrameScript(39, frame40);
        }

        function frame40(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

