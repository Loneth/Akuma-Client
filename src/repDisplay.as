﻿// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//repDisplay

package {
    import flash.display.MovieClip;

    public dynamic class repDisplay extends MovieClip {

        public var t:MovieClip;

        public function repDisplay(){
            addFrameScript(39, frame40);
        }

        function frame40(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

