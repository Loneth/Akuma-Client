// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_fla.questBtn_249

package Game_fla{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;

    public dynamic class questBtn_249 extends MovieClip {

        public var btnQuest:SimpleButton;
        public var buttons:Array;

        public function questBtn_249(){
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

