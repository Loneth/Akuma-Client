﻿// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//sp_eh1

package {
    import flash.display.MovieClip;

    public dynamic class sp_eh1 extends MovieClip {

        public function sp_eh1(){
            addFrameScript(35, this.frame36);
        }

        function frame36(){
            stop();
            MovieClip(parent).removeChild(this);
        }


    }
}//package 

