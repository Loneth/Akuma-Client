// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.charicon_294

package Game_fla{
    import flash.display.MovieClip;

    public dynamic class charicon_294 extends MovieClip {

        public var buttons:Array;

        public function charicon_294(){
            addFrameScript(0, frame1);
        }

        function frame1(){
            buttons = new Array({
                txt:"Stats & Class",
                fct:"rootClass.toggleCharpanel"
			}, {
                txt:"Skill Tree",
                fct:"rootClass.toggleSkillTree"
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
			    txt:"Redeem",
                fct:"rootClass.toggleRedeemPanel"
            }, {
			    txt:"Show Players",
                fct:"rootClass.optionAvatarToggle"
            }, {
                txt:"Character Page",
                fct:"charPage"
            }, {txt:"Your Hero"});
        }


    }
}//package Game_fla

