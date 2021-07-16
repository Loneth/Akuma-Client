// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.game_1_CMP_195

package Game_fla{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;

    public dynamic class game_1_CMP_195 extends MovieClip {

        public var chkBtn:SimpleButton;
        public var checkmark:MovieClip;
        public var bitChecked:Boolean;

        public function game_1_CMP_195(){
            addFrameScript(0, frame1);
        }

        public function onClick(_arg1:MouseEvent){
            bitChecked = !(bitChecked);
            checkmark.visible = bitChecked;
        }

        function frame1(){
            checkmark.mouseEnabled = false;
            chkBtn.addEventListener(MouseEvent.CLICK, onClick, false, 1, true);
        }


    }
}//package Game_fla

