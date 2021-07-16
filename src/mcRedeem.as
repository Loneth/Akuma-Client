package  {
	
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.display.*;
    import flash.events.*;
    import flash.text.TextField;
	
	
	public class mcRedeem extends MovieClip {
		
		public var rootClass;
		public var btnRedeem:SimpleButton;
		public var btnClose:SimpleButton;
		public var txtCode:TextField;
		
		public function mcRedeem() {
			addFrameScript(0, frame1);
			rootClass = MovieClip(stage.getChildAt(0));
		}
		
		public function frame1(){
			stop();
			txtCode.text = "";
			btnRedeem.addEventListener(MouseEvent.CLICK, redeemCode, false, 0, true);
			btnClose.addEventListener(MouseEvent.CLICK, onClose, false, 0, true);
		}
		
		public function redeemCode(event:MouseEvent){
			if(txtCode.text != ""){
				rootClass.world.redeemCode(txtCode.text);
			} else {
				rootClass.MsgBox.notify("Please insert a code!");
			};
			rootClass.mixer.playSound("Click");
		}
		
		public function onClose(_arg1:MouseEvent):void{
            MovieClip(parent).gotoAndStop("Init");
			rootClass.mixer.playSound("Click");
        }
		
	}
	
}