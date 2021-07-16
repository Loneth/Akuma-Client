// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_fla.btnChar_251

package Game_fla{
    import flash.display.MovieClip;

    public dynamic class btnChar_251 extends MovieClip {

        public var shp:MovieClip;
        public var buttons:Array;

        public function btnChar_251(){
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

