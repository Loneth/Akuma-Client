// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.mcIterator_113

package Game_fla{
    import flash.display.MovieClip;

    public dynamic class mcIterator_113 extends MovieClip {

        public var cheats:MovieClip;
        public var serverStack:MovieClip;
        public var cmd:MovieClip;
        public var bg:MovieClip;
        public var bgfx:MovieClip;
        public var eventStack:MovieClip;
        public var iClass:IteratorMC;

        public function mcIterator_113(){
            addFrameScript(0, frame1);
        }

        function frame1(){
            iClass = new IteratorMC();
            iClass.init(MovieClip(this.parent.parent), this, Game.objLogin);
        }


    }
}//package Game_fla

