// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//dotDisplay

package {
    import flash.display.MovieClip;

    public dynamic class dotDisplay extends MovieClip {

        public var t:MovieClip;

        public function dotDisplay(){
            addFrameScript(19, this.frame20);
        }

        function frame20(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

