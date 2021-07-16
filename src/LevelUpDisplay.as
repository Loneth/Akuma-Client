// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LevelUpDisplay

package {
    import flash.display.MovieClip;

    public dynamic class LevelUpDisplay extends MovieClip {

        public var t:MovieClip;

        public function LevelUpDisplay(){
            //addFrameScript(37, this.frame38);
			addFrameScript(87, this.frame88);
        }
		/*
        function frame38(){
            MovieClip(parent).removeChild(this);
            stop();
		*/
		function frame88(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

