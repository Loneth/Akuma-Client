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

    public dynamic class LPFPanelBg5 extends MovieClip {

        public var dragonRight:MovieClip;
        public var btnClose:SimpleButton;
        public var dragonLeft:MovieClip;
        public var tPane1:TextField;
        public var tTitle:TextField;
        public var tPane2:TextField;
        public var bg:MovieClip;
        public var tPane3:TextField;
		public var txtSellCopper:TextField;
		public var txtSellSilver:TextField;
		public var txtSellGold:TextField;
		public var txtSellCoins:TextField;
		
		public function LPFPanelBg5(){
			addFrameScript(0, frame1);
			rootClass = MovieClip(Game.root);
			super();
		}
		
		function frame1(){
			rootClass.VendingPanelMC = this;
			txtSellCopper.restrict="0-9";
			txtSellSilver.restrict="0-9";
			txtSellGold.restrict="0-9";
			txtSellCoins.restrict="0-9";
			stop();
		}

    }
}//package 

