// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.cMenu_526

package Game_fla{
    import flash.display.MovieClip;

    public dynamic class cMenu_526 extends MovieClip {

        public var bg:MovieClip;
        public var mHi:MovieClip;
        public var iproto:cProto;

        public function cMenu_526(){
            addFrameScript(0, frame1, 19, frame20);
        }

        function frame1(){
            stop();
        }

        function frame20(){
            MovieClip(parent).gotoAndPlay("out");
            gotoAndStop("hold");
        }


    }
}//package Game_fla

