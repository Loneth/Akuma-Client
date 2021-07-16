// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.Symbol23copy2_25

package Game_fla{
    import flash.display.MovieClip;

    public dynamic class Symbol23copy2_25 extends MovieClip {

        public var buttons:Array;

        public function Symbol23copy2_25(){
            addFrameScript(0, frame1);
        }

        function frame1(){
            buttons = new Array({
                txt:"Stats & Class",
                fct:"rootClass.toggleCharpanel"
            }, {
                txt:"Reputations",
                fct:"rootClass.showFactionInterface"
            }, {
                txt:"Friends",
                fct:"rootClass.world.showFriendsList"
            }, {
                txt:"Guild",
                fct:"rootClass.world.showGuildList"
            }, {
                txt:"Character Page",
                fct:"charPage"
            }, {txt:"Your Hero"});
        }


    }
}//package Game_fla

