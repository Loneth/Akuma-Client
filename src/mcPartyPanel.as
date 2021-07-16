package  {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	
	public class mcPartyPanel extends MovieClip {
		
		public var rootClass:* = MovieClip(stage.getChildAt(0));
		public var chkPTDungeon:SimpleButton;
		public var chkShareXP:SimpleButton;
		public var txtPartyName:TextField;
		public var btnClose:SimpleButton;
		public var txtPartyID:TextField;
		
		public function mcPartyPanel() {
			super();
			addFrameScript(0, frame1, 1, frame2);
		}
		
		function frame1(){
			stop();
		}
		
		function frame2(){
			btnClose.addEventListener(MouseEvent.CLICK, closeWindow);
		}

		function closeWindow(event:MouseEvent){
			gotoAndStop(1);
		}
		
	}
}