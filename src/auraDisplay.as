// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//auraDisplay

package {
    import flash.display.MovieClip;

    public dynamic class auraDisplay extends MovieClip {

        public var t:MovieClip;

        public function auraDisplay(){
            addFrameScript(34, this.frame35);
        }

        function frame35(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

