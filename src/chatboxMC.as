package  {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	public class chatboxMC extends MovieClip {
		
		public var btnClose:SimpleButton;
		public var btnDrag:SimpleButton;
		public var btnSwitch:SimpleButton;
		public var btnUp:SimpleButton;
		public var btnDown:SimpleButton;
		//public var msg_txt:TextField;
		//public var log_txt:TextField;
		public var user_txt:TextField;
		public var info:TextField;
		public var boxState:Number;
		public var outline:MovieClip;
		public var gui:MovieClip;
		public var cooldown:Timer = new Timer(500);
		public var canSend:Boolean = true;
		public var rootClass:*;
		public var scrollDown:Timer = new Timer(500);
		
		public function chatboxMC() {
			addFrameScript(0, frame1);
		}
		
		function frame1(){
			stop();
			info.text = "";
			outline.gotoAndStop(1);
			boxState = 1;
			btnClose.addEventListener(MouseEvent.CLICK, closeBox);
			btnDrag.addEventListener(MouseEvent.MOUSE_DOWN, startDrg);
			btnDrag.addEventListener(MouseEvent.MOUSE_UP, stopDrg);
			btnSwitch.addEventListener(MouseEvent.CLICK, switchState);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
			scrollDown.addEventListener(TimerEvent.TIMER, scrollDowner);
			scrollDown.start();
			btnUp.visible = false;
			btnDown.visible = false;
		}
		
		function scrollDowner(event:Timer){
			gui.log_txt.scrollV += 2;
		}
		
		function keyPressed(event:KeyboardEvent){
			if(event.keyCode == 13){
				sendMessage();
			}
		}
		
		function sendMessage(){
			if(gui.msg_txt.text == ""){
				return;
			}
			if(!canSend){
				return;
			}
			rootClass = MovieClip(stage.getChildAt(0));
			rootClass.sfc.sendXtMessage("zm", "whisper", [gui.msg_txt.text, user_txt.text], "str", 1);
			msgCooldown();
			//if(gui.log_txt.numLines > gui.log_txt.bottomScrollV){
			//	gui.log_txt.scrollV = gui.log_txt.maxScrollV;
			//}
		}
		
		function msgCooldown(){
			gui.msg_txt.text = "";
			canSend = false;
			cooldown.addEventListener(TimerEvent.TIMER, endCooldown);
			cooldown.start();
		}
		
		function endCooldown(event:TimerEvent){
			cooldown.stop();
			cooldown.removeEventListener(TimerEvent.TIMER, endCooldown);
			canSend = true;
		}
		
		function switchState(event:MouseEvent){
			if(boxState == 1){
				boxState = 2;
				gui.visible = false;
			} else {
				boxState = 1;
				gui.visible = true;
				outline.gotoAndStop(1);
			}
		}
		
		function closeBox(event:MouseEvent){
			parent.removeChild(this);
		}
		
		function startDrg(event:MouseEvent){
			this.startDrag();
		}
		
		function stopDrg(event:MouseEvent){
			this.stopDrag();
		}
		
		function getStage(){
			return Number(boxStage);
		}
		
		public function gotMessage(){
			if(boxStage == 2){
				outline.gotoAndStop(2);
			}
			//gui.log_txt.scrollV(gui.log_txt.numLines);
		}
	}
	
}