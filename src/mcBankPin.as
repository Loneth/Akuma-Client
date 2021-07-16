package 
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.display.*;
    import flash.events.*;
    import flash.text.TextField;

    public class mcBankPin extends MovieClip 
    {

        public var rootClass;
		public var txtPassword:TextField;
		public var btnConfirm:SimpleButton;
		public var btnClose:SimpleButton;

        public function mcBankPin()
        {
            addFrameScript(0, frame1);
			rootClass = MovieClip(stage.getChildAt(0));
        }
        public function frame1()
        {
            stop();
			btnConfirm.addEventListener(MouseEvent.CLICK, onConfirmPin, false, 0, true);
			btnClose.addEventListener(MouseEvent.CLICK, onClose, false, 0, true);
        }
		
		public function onConfirmPin(_arg1:MouseEvent):void{
			if(txtPassword.text != ""){
				rootClass.world.sendConfirmBankPin(txtPassword.text);
			} else {
				rootClass.MsgBox.notify("Please insert a bank pin!");
			};
			rootClass.mixer.playSound("Click");
		}
		
		public function onClose(_arg1:MouseEvent):void{
            MovieClip(parent).gotoAndStop("Init");
			rootClass.mixer.playSound("Click");
        }

    }
}//package 

