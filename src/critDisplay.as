// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//critDisplay

package {
    import flash.display.MovieClip;

    public dynamic class critDisplay extends MovieClip {

        public var t:MovieClip;

        public function critDisplay(){
            addFrameScript(24, this.frame25);
        }

        function frame25(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

