// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//mcLevelup

package {
    import flash.display.MovieClip;

    public dynamic class mcLevelup extends MovieClip {

        public var cnt:MovieClip;

        public function mcLevelup(){
            addFrameScript(122, frame123);
        }

        function frame123(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

