// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//mcQuestpopup

package {
    import flash.display.MovieClip;

    public dynamic class mcQuestpopup extends MovieClip {

        public var fx2:MovieClip;
        public var cnt:MovieClip;

        public function mcQuestpopup(){
            addFrameScript(124, frame125);
        }

        function frame125(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

