// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//hitDisplay

package {
    import flash.display.MovieClip;

    public dynamic class hitDisplay extends MovieClip {

        public var t:MovieClip;

        public function hitDisplay(){
            addFrameScript(19, this.frame20);
        }

        function frame20(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

