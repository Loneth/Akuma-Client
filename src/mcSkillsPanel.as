package  {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	
	public class mcSkillsPanel extends MovieClip {
		
		public var rootClass:* = MovieClip(stage.getChildAt(0));
		public var btnForgeFrame:MovieClip;
		public var btnAlchemyFrame:MovieClip;
		public var btnAlchemy:SimpleButton;
		public var btnForge:SimpleButton;
		public var btnClose:SimpleButton;
		//public var pi:TextField;
		
		public function mcSkillsPanel() {
			super();
			addFrameScript(0, frame1, 1, frame2);
		}
		
		function frame1(){
			stop();
		}
		
		function frame2(){
			//pi.text = "";
			btnForge.removeEventListener(MouseEvent.CLICK, onClickForge2);
			btnForgeFrame.addEventListener(MouseEvent.CLICK, onClickForge);
			btnAlchemy.removeEventListener(MouseEvent.CLICK, onClickAlchemy2);
			btnAlchemyFrame.addEventListener(MouseEvent.CLICK, onClickAlchemy);
			btnClose.addEventListener(MouseEvent.CLICK, closeWindow);
		
		}
		
		function onClickForge(event:MouseEvent){
			//if ((((_arg1.FactionID > 1)) && ((this.myAvatar.getRep(_arg1.FactionID) < _arg1.iReqRep)))){
			if (rootClass.world.myAvatar.getRep(5) < 302500){
				rootClass.MsgBox.notify("Skill Locked: Rank 10 Smithing Reputation Not Met.");
			} else {
				rootClass.world.sendLoadShopRequest(-987);
				gotoAndStop(1);
			}
		}
		
		function onClickForge2(event:MouseEvent){
			//if ((((_arg1.FactionID > 1)) && ((this.myAvatar.getRep(_arg1.FactionID) < _arg1.iReqRep)))){
			//if (this.myAvatar.getRep(5) < 302500){
			if (rootClass.world.myAvatar.getRep(5) < 302500){
				rootClass.MsgBox.notify("Skill Locked: Rank 10 Smithing Reputation Not Met.");
			} else {
				rootClass.world.sendLoadShopRequest(-987);
				gotoAndStop(1);
			}
		
		}
		
		function onClickAlchemy(event:MouseEvent){
			if (rootClass.world.myAvatar.getRep(10) < 302500){
				rootClass.MsgBox.notify("Skill Locked: Rank 10 Alchemy Reputation Not Met.");
			} else {
				rootClass.world.sendLoadShopRequest(-988);
				gotoAndStop(1);
			}
		}
		
		function onClickAlchemy2(event:MouseEvent){
			if (rootClass.world.myAvatar.getRep(10) < 302500){
				rootClass.MsgBox.notify("Skill Locked: Rank 10 Alchemy Reputation Not Met.");
			} else {
				rootClass.world.sendLoadShopRequest(-988);
				gotoAndStop(1);
			}
		
		}		
				
		function closeWindow(event:MouseEvent){
			gotoAndStop(1);
		}
		
	}
}