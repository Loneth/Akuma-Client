// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.chkBox_27

package Game_fla{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    public dynamic class chkBox_27 extends MovieClip {

        public var checkmark:MovieClip;
        public var bitChecked:Boolean;

        public function chkBox_27(){
            addFrameScript(0, frame1);
        }

        public function onClick(_arg1:MouseEvent){
            bitChecked = !(bitChecked);
            checkmark.visible = bitChecked;
        }

        function frame1(){
            checkmark.mouseEnabled = false;
            checkmark.visible = bitChecked;
            this.addEventListener(MouseEvent.CLICK, onClick);
        }


    }
}//package Game_fla

