// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//avoidDisplay

package {
    import flash.display.MovieClip;

    public dynamic class avoidDisplay extends MovieClip {

        public var t:MovieClip;

        public function avoidDisplay(){
            addFrameScript(19, this.frame20);
        }

        function frame20(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

