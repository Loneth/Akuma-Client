// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.Symbol25_291

package Game_fla{
    import flash.display.MovieClip;

    public dynamic class Symbol25_291 extends MovieClip {

        public var buttons:Array;

        public function Symbol25_291(){
            addFrameScript(0, frame1);
        }

        function frame1(){
            buttons = new Array({
                txt:"Temp Inventory",
                fct:"toggleTempInventory"
			}, {
                txt:"Quests",
                fct:"rootClass.world.toggleQuestLog"
            }, {txt:"Quests"});
        }


    }
}//package Game_fla

