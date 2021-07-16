// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//xpDisplayBonus

package {
    import flash.display.MovieClip;

    public dynamic class xpDisplayBonus extends MovieClip {

        public var t:MovieClip;

        public function xpDisplayBonus(){
            addFrameScript(39, frame40);
        }

        function frame40(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

