package  {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	
	
	public class tradeTab extends MovieClip {
		
		public var myTradeName = rootClass.sfc.myUserName;
		public var partnerTradeName = undefined;
		public var myACS = rootClass.world.myAvatar.objData.intCoins;
		public var partnerACSoffer = undefined;
		public var myGOLD = rootClass.world.myAvatar.objData.intGold;
		public var partnerGOLDoffer = undefined;
		public var rootClass = (stage.getChildAt(0) as MovieClip);
		
		public var bClose:SimpleButton;
		public var bConf:SimpleButton;
		public var pin:TextField;
		public var getMyPin:Number = undefined;
		
		public var targetOfferGOLD:TextField;
		public var targetOfferACS:TextField;
		public var offerACme:TextField;
		public var offerGOLDme:TextField;
		public var myGold:TextField;
		public var myCoins:TextField;
		public var btnAdd:SimpleButton;
		public var btnTrade:SimpleButton;
		
		public var acsADD:TextField;
		public var goldADD:TextField;
		
		public function tradeTab() {
			addFrameScript(0, frame1, 1, frame2, 2, frame3);
		}
		
		function frame1(){
			stop();
			bClose.removeEventListener(MouseEvent.CLICK, closePin);
			bConf.removeEventListener(MouseEvent.CLICK, askPin);
		}
		
		function frame2(){
			pin.text = "";
			bClose.addEventListener(MouseEvent.CLICK, closePin);
			bConf.addEventListener(MouseEvent.CLICK, askPin);
		}
		
		function frame3(){
			targetOffer.text = strTarget + "'s Offer:";
			myGold.text = "Gold: " + myGOLD;
			myCoins.text = "Diamonds: " + myACS;
		}
		
		function closePin(event:MouseEvent){
			gotoAndStop(1);
		}
		
		//function askPin(event:MouseEvent){
			//if(pin.text == getMyPin){
				//rootClass.world.openTrade();
				//rootClass.world.myPin = getMyPin;
			//}
			//rootClass.world.checkPin(pin.text):
		//}
		
		function confirmTrade(){
			rootClass.world.startTrade();
		}
	}
	
}