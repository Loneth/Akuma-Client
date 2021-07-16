// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//mcAchievement

package {
    import flash.display.MovieClip;

    public dynamic class mcAchievement extends MovieClip {

        public var fx2:MovieClip;
        public var cnt:MovieClip;

        public function mcAchievement(){
            addFrameScript(122, frame123);
        }

        function frame123(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

