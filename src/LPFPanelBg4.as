// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFPanelBg5

package {
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.utils.Timer;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.media.SoundMixer;
    import flash.media.SoundTransform;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    //import flash.external.ExternalInterface;

    public dynamic class LPFPanelBg4 extends MovieClip {

        public var dragonRight:MovieClip;
		public var dragonLeft:MovieClip;
        public var rootClass:MovieClip;
        public var btnClose:SimpleButton;
		public var btnLock:SimpleButton;
		public var btnDeal:SimpleButton;
		public var bg:MovieClip;
		public var tTitle:TextField;
        public var tPane1:TextField;
        public var tPane2:TextField;
        public var tPane3:TextField;
		public var tPane4:TextField;
		public var tPane5:TextField;
		public var tPane6:TextField;
		public var txtGold:TextField;
		public var txtCoins:TextField;
		public var txtMyGold:TextField;
		public var txtMySilver:TextField;
		public var txtMyCopper:TextField;
		public var txtMyCoins:TextField;
		public var txtTargetGold:TextField;
		public var txtTargetSilver:TextField;
		public var txtTargetCopper:TextField;
		public var txtTargetCoins:TextField;
		public var txtLock:TextField;
		
		public function LPFPanelBg4(){
            addFrameScript(0, frame1);
			rootClass = MovieClip(Game.root);
			super();
        }
        function frame1(){
            txtMyGold.restrict="0-9";
			txtMySilver.restrict="0-9";
			txtMyCopper.restrict="0-9";
			txtMyCoins.restrict="0-9";
			btnDeal.alpha = 0.5;
			btnDeal.mouseEnabled = false;
			txtLock.mouseEnabled = false;
			btnLock.addEventListener(MouseEvent.CLICK, onLock, false, 0, true);
			btnDeal.addEventListener(MouseEvent.CLICK, onDeal, false, 0, true);
			rootClass.ctrlTrade = this;
        }
		
		public function onLock(_arg1:MouseEvent):void{
		    if (txtLock.text == "Lock") {
			    if (txtMyCoins.length == 0) {
				    txtMyCoins.text = "0";
				}
		
			    if (txtMyGold.length == 0) {
				    txtMyGold.text = "0";
				}	

				if (txtMySilver.length == 0) {
				    txtMySilver.text = "0";
				}	
				
				if (txtMyCopper.length == 0) {
				    txtMyCopper.text = "0";
				}					
					
		        MovieClip(rootClass.ui.mcPopup.getChildByName("mcTrade")).update({eventType:"lockOffer"});
			} else {
			    MovieClip(rootClass.ui.mcPopup.getChildByName("mcTrade")).update({eventType:"unlockOffer"});			    
			}
		}
		
		public function onDeal(_arg1:MouseEvent):void {
		    MovieClip(rootClass.ui.mcPopup.getChildByName("mcTrade")).update({eventType:"completeTrade"});
		}
    }
}//package 

