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

	public dynamic class LPFPanelBg6 extends MovieClip {

		public var dragonRight:MovieClip;
		public var dragonLeft:MovieClip;
		public var rootClass:MovieClip;
		public var btnClose:SimpleButton;
		public var btnCheckout:SimpleButton;
		public var btnSell:SimpleButton;
		public var btnSearch:SimpleButton;
		public var btnPurchase:SimpleButton;
		public var btnBuy:SimpleButton;
		public var btnSellHP:SimpleButton;
		public var btnCheckoutHP:SimpleButton;
		public var btnCheckoutAll:SimpleButton;
		public var txtSellCopper:TextField;
		public var txtSellSilver:TextField;
		public var txtSellGold:TextField;
		public var txtPriceCoins:TextField;
		public var txtPriceGold:TextField;
		public var txtSellCoins:TextField;
		public var bg:MovieClip;
		public var tTitle:TextField;
		public var tPane1:TextField;
		public var txtGold:TextField;
		public var txtCoins:TextField;
		public var txtMyGold:TextField;
		public var txtMyCoins:TextField;
		public var txtTargetGold:TextField;
		public var txtTargetCoins:TextField;
		public var itemName:TextField;
		public var txtLock:TextField;
		
		public function LPFPanelBg6(){
			addFrameScript(0, frame1, 1, frame2, 2, frame3);
			rootClass = MovieClip(Game.root);
			super();
		}
		
		function frame1(){
			rootClass.ctrlTrade = this;
			btnSearch.addEventListener(MouseEvent.CLICK, onSearch, false, 0, true);
			btnPurchase.addEventListener(MouseEvent.CLICK, toPurchase);
			btnCheckout.addEventListener(MouseEvent.CLICK, toCheckout);
			btnSell.addEventListener(MouseEvent.CLICK, toSell);

			rootClass.auctionItem1.visible = true;
			rootClass.auctionItem2.visible = false;
			rootClass.auctionItem3.visible = false;
			
			rootClass.auctionLayout.iSel = null;
			rootClass.auctionLayout.updatePreviewButtons();
			
			rootClass.auctionItem1.mouseEnabled = true;
			rootClass.auctionItem2.mouseEnabled = true;
			rootClass.auctionItem3.mouseEnabled = true;
			
			stop();
		}
		
		function frame2(){
			txtSellCopper.restrict="0-9";
			txtSellSilver.restrict="0-9";
			txtSellGold.restrict="0-9";
			txtSellCoins.restrict="0-9";
		
			btnSellHP.addEventListener(MouseEvent.CLICK, SellItem);
			stop();
		}
		
		function frame3(){		
			btnCheckoutHP.addEventListener(MouseEvent.CLICK, onCheckout);
			btnCheckoutAll.addEventListener(MouseEvent.CLICK, onCheckoutAll);
			stop();
		}
		
		function SellItem(evt:MouseEvent):void {
			var uuuu:*;
			var aaaa:*;
			var eeee:*;
			eeee = (((rootClass.auctionLayout.iSel.iQty)!=null) ? rootClass.auctionLayout.iSel.iQty : 1);		
			
			rootClass.auctionLayout.iSel.auctionCopper = txtSellCopper.text;
			rootClass.auctionLayout.iSel.auctionSilver = txtSellSilver.text;
			rootClass.auctionLayout.iSel.auctionGold = txtSellGold.text;
			rootClass.auctionLayout.iSel.auctionCoins = txtSellCoins.text;
			
			btnSellHP.alpha = 0.5;
			btnSellHP.mouseEnabled = false;	
			
			if (txtSellCopper.length == 0) {
				txtSellCopper.text = "0";
			}
			
			if (txtSellSilver.length == 0) {
				txtSellSilver.text = "0";
			}	
			
			if (txtSellCoins.length == 0) {
				txtSellCoins.text = "0";
			}
			
			if (txtSellGold.length == 0) {
				txtSellGold.text = "0";
			}				
			
			if (eeee > 1 && rootClass.auctionLayout.iSel.sES != "ar") {
				uuuu = new ModalMC();
				aaaa = {};
				aaaa.params = {};
				aaaa.strBody = ("Please specify item quantity you want to sell.");
				aaaa.callback = qtyRequest;
				if (eeee > 1){
					aaaa.qtySel = {
						min:1,
						max:eeee
					};
				};
				aaaa.glow = "white,medium";
				aaaa.greedy = true;
				rootClass.ui.ModalStack.addChild(uuuu);
				uuuu.init(aaaa);
			} else {				
				rootClass.auctionLayout.iSel.Quantity = eeee;
				sendSellAuctionItemRequest(rootClass.auctionLayout.iSel);				
            }
		}
		
        public function sendSellAuctionItemRequest(_arg1:Object){
            var _local2:ModalMC;
            var _local3:Object;
            if (_arg1.bEquip == 1){
                _local2 = new ModalMC();
                _local3 = {};
                _local3.strBody = "You must unequip the item before offering it!";
                _local3.params = {};
                _local3.glow = "red,medium";
                _local3.btns = "mono";
                this.rootClass.ui.ModalStack.addChild(_local2);
                _local2.init(_local3);
            }
            else {
                _local8 = new ModalMC();
                _local9 = {};
                _local9.strBody = ("Are you sure you want to list '" + _arg1.sName + "' on Auction House?");
                _local9.params = {item:_arg1};
                _local9.callback = sellConfirm;
                _local9.glow = "white,medium";
                rootClass.ui.ModalStack.addChild(_local8);
                _local8.init(_local9);     
				rootClass.auctionItem2.alpha = 0.5;
                rootClass.auctionItem2.mouseEnabled = false;				
            };
        }
		
      
        function qtyRequest(_arg1:Object):void{
            if (_arg1.accept){
                trace(("iqty: " + _arg1.iQty));
				rootClass.auctionLayout.iSel.Quantity = 1;
                if (_arg1.iQty != null){
				    rootClass.auctionLayout.iSel.Quantity = _arg1.iQty;
                }		
				sendSellAuctionItemRequest(rootClass.auctionLayout.iSel);			
				rootClass.auctionLayout.iSel = null;
            } else {
				btnSellHP.alpha = 1;
				btnSellHP.mouseEnabled = true;	
				rootClass.auctionItem2.alpha = 1;
				rootClass.auctionItem2.mouseEnabled = true;				
			}
        }

		function sellConfirm(_arg1:Object):void{
			if (_arg1.accept){
				rootClass.sfc.sendXtMessage("zm", "sellAuctionItem", [_arg1.item.ItemID, _arg1.item.CharItemID, _arg1.item.Quantity, txtSellCopper.text, txtSellSilver.text, txtSellGold.text, txtSellCoins.text], "str", this.curRoom);
			};
			
			btnSellHP.alpha = 1;
			btnSellHP.mouseEnabled = true;	
			txtSellCopper.text = "";	
			txtSellSilver.text = "";
			txtSellCoins.text = "";	
			txtSellGold.text = "";		
			rootClass.auctionItem2.alpha = 1;
            rootClass.auctionItem2.mouseEnabled = true;				
		}

		
		function toCheckout(evt:MouseEvent):void {
		    rootClass.world.myAvatar.retrieveReset();
			rootClass.auctionItem1.visible = false;
			rootClass.auctionItem2.visible = false;
			rootClass.auctionItem3.visible = true;
			
			rootClass.auctionLayout.iSel = null;
			rootClass.auctionLayout.tab = 3;
			rootClass.auctionLayout.updatePreviewButtons();
			rootClass.world.sendLoadRetrieveRequest(["*"]);
			rootClass.auctionTabs.Param1.text = "STATUS";
			
			MovieClip(rootClass.ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshItems"});
			gotoAndStop(3);
		}
		
		function toSell(evt:MouseEvent):void {
			rootClass.auctionItem1.visible = false;
			rootClass.auctionItem2.visible = true;
			rootClass.auctionItem3.visible = false;
			
			rootClass.auctionLayout.iSel = null;
			rootClass.auctionLayout.tab = 2;
			rootClass.auctionLayout.updatePreviewButtons();
			
			MovieClip(rootClass.ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshItems"});
			gotoAndStop(2);
		}
		
		function toPurchase(evt:MouseEvent):void {
		    rootClass.world.myAvatar.auctionReset();
			rootClass.auctionItem1.visible = true;
			rootClass.auctionItem2.visible = false;
			rootClass.auctionItem3.visible = false;
			
			rootClass.auctionLayout.iSel = null;
			rootClass.auctionLayout.tab = 1;
			rootClass.auctionLayout.updatePreviewButtons();
			rootClass.auctionTabs.Param1.text = "SELLER";
			
			MovieClip(rootClass.ui.mcPopup.getChildByName("mcAuction")).update({eventType:"refreshItems"});			
			gotoAndStop(1);
		}
		
		function onSearch(evt:MouseEvent):void {
		    rootClass.auctionTabs.onSearch = true;
		    rootClass.auctionTabs.tSel = rootClass.auctionTabs.getTabByFilter("*");
		    rootClass.auctionTabs.forceTabClick(rootClass.auctionTabs.getTabByFilter("*"));
			rootClass.auctionTabs.tSel = rootClass.auctionTabs.getTabByFilter("*");
			rootClass.world.myAvatar.auctionReset();
			rootClass.auctionTabs.tSel = rootClass.auctionTabs.getTabByFilter("*");
			
			if (itemName.length == 0) {
				rootClass.world.sendLoadAuctionRequest(["*"]);
			} else {			
				rootClass.sfc.sendXtMessage("zm", "searchAuction", [itemName.text], "str", this.curRoom);
			}
		}
		
		function onCheckout(evt:MouseEvent):void {
		    rootClass.auctionItem3.alpha = 0.5;
		    rootClass.auctionItem3.mouseEnabled = false;
			_local8 = new ModalMC();
			_local9 = {};
			_local9.strBody = ("Are you sure you want to check out "+rootClass.auctionLayout.iSel.sName+"?");
			_local9.params = {item:rootClass.auctionLayout.iSel};
			_local9.callback = checkOutConfirm;
			_local9.glow = "white,medium";
			rootClass.ui.ModalStack.addChild(_local8);
			_local8.init(_local9);
		}
		
		private function checkOutConfirm(_arg1:Object):void{
			if (_arg1.accept){
				rootClass.sfc.sendXtMessage("zm", "retrieveAuctionItem", [_arg1.item.AuctionID], "str", this.curRoom);
			};
			
			rootClass.auctionItem3.alpha = 1;
			rootClass.auctionItem3.mouseEnabled = true;
		}
		
		function onCheckoutAll(evt:MouseEvent):void {
			_local8 = new ModalMC();
			_local9 = {};
			_local9.strBody = ("Are you sure you want to check out all items? These will include your items that are still listed in Auction House.");
			_local9.params = {item:""};
			_local9.callback = auctionConfirm;
			_local9.glow = "white,medium";
			rootClass.ui.ModalStack.addChild(_local8);
			_local8.init(_local9);			
	   	
			btnCheckoutAll.alpha = 0.5;
			btnCheckoutAll.mouseEnabled = false;	
		}
		
		private function auctionConfirm(_arg1:Object):void{
			if (_arg1.accept){
				rootClass.sfc.sendXtMessage("zm", "retrieveAuctionItems", [], "str", this.curRoom);
			};
			
			btnCheckoutAll.alpha = 1;
			btnCheckoutAll.mouseEnabled = true;	
		}
	}
}//package 

