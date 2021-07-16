// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFFrameGoldDisplay

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFFrameStoredGoldDisplay extends LPFFrame {

        public var btnHelp:MovieClip;
		public var btnCopper:MovieClip;
		public var btnSilver:MovieClip;
		public var btnGold:MovieClip;
		public var btnDiamond:MovieClip;
        public var mcCoins:MovieClip;
        public var mcGold:MovieClip;
		public var mcSilver:MovieClip;
		public var mcCopper:MovieClip;
        private var rootClass:MovieClip;

        public function LPFFrameStoredGoldDisplay():void{
            x = 0;
            y = 0;
            fData = {};
        }

        override public function fOpen(o:Object):void{
            rootClass = MovieClip(stage.getChildAt(0));
            fData = o.fData;
			fType = o.fType;
            if (("eventTypes" in o)){
                eventTypes = o.eventTypes;
            };
            fDraw();
            positionBy(o.r);
            getLayout().registerForEvents(this, eventTypes);
			mcCoins.addEventListener(MouseEvent.MOUSE_OVER, onCoinsTTOver, false, 0, true);
			mcCoins.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
			mcGold.addEventListener(MouseEvent.MOUSE_OVER, onGoldTTOver, false, 0, true);
			mcGold.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
			mcSilver.addEventListener(MouseEvent.MOUSE_OVER, onSilverTTOver, false, 0, true);
			mcSilver.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
			mcCopper.addEventListener(MouseEvent.MOUSE_OVER, onCopperTTOver, false, 0, true);
			mcCopper.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
			btnHelp.addEventListener(MouseEvent.CLICK, onHelpClick, false, 0, true);
			btnHelp.addEventListener(MouseEvent.MOUSE_OVER, onHelpTTOver, false, 0, true);
			btnHelp.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
        }

        override public function fClose():void{
            mcCoins.removeEventListener(MouseEvent.MOUSE_OVER, onCoinsTTOver);
            mcCoins.removeEventListener(MouseEvent.MOUSE_OUT, onTTOut);
            mcGold.removeEventListener(MouseEvent.MOUSE_OVER, onGoldTTOver);
            mcGold.removeEventListener(MouseEvent.MOUSE_OUT, onTTOut);
			mcSilver.addEventListener(MouseEvent.MOUSE_OVER, onSilverTTOver, false, 0, true);
            mcSilver.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
			mcCopper.addEventListener(MouseEvent.MOUSE_OVER, onCopperTTOver, false, 0, true);
            mcCopper.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
            btnHelp.removeEventListener(MouseEvent.CLICK, onHelpClick);
            btnHelp.removeEventListener(MouseEvent.MOUSE_OVER, onHelpTTOver);
            btnHelp.removeEventListener(MouseEvent.MOUSE_OUT, onTTOut);
			btnCopper.removeEventListener(MouseEvent.CLICK, onCopperClick);
            btnCopper.removeEventListener(MouseEvent.MOUSE_OVER, onCopperConvertTTOver);
            btnCopper.removeEventListener(MouseEvent.MOUSE_OUT, onTTOut);
			btnSilver.removeEventListener(MouseEvent.CLICK, onSilverClick);
            btnSilver.removeEventListener(MouseEvent.MOUSE_OVER, onSilverConvertTTOver);
            btnSilver.removeEventListener(MouseEvent.MOUSE_OUT, onTTOut);
			btnGold.removeEventListener(MouseEvent.CLICK, onGoldClick);
            btnGold.removeEventListener(MouseEvent.MOUSE_OVER, onGoldConvertTTOver);
            btnGold.removeEventListener(MouseEvent.MOUSE_OUT, onTTOut);
			btnDiamond.removeEventListener(MouseEvent.CLICK, onDiamondClick);
            btnDiamond.removeEventListener(MouseEvent.MOUSE_OVER, onDiamondConvertTTOver);
            btnDiamond.removeEventListener(MouseEvent.MOUSE_OUT, onTTOut);
            getLayout().unregisterFrame(this);
            if (parent != null){
                parent.removeChild(this);
            };
        }

        private function fDraw():void{
		    //rootClass.ui.mcInterface.mcGold.strCoins.text = (rootClass.world.myAvatar.objData.intCoins);
			//rootClass.ui.mcInterface.mcGold.strGold.text = (rootClass.world.myAvatar.objData.intGold);
			trace("HERE: " + fType);
			switch (fType){
				case "Bank":
					mcGold.ti.htmlText = (("<font color='#FFFFFF'>" + rootClass.strNumWithCommas(fData.intGold)) + "</font>");
					mcSilver.ti.htmlText = (("<font color='#FFFFFF'>" + rootClass.strNumWithCommas(fData.intSilver)) + "</font>");
					mcCopper.ti.htmlText = (("<font color='#FFFFFF'>" + rootClass.strNumWithCommas(fData.intCopper)) + "</font>");
					mcCoins.ti.text = rootClass.strNumWithCommas(fData.intCoins);
					mcGold.hit.width = ((mcGold.ti.x + mcGold.ti.textWidth) + 2);
					mcGold.hit.alpha = 0;
					mcSilver.hit.width = ((mcSilver.ti.x + mcSilver.ti.textWidth) + 2);
					mcSilver.hit.alpha = 0;
					mcCopper.hit.width = ((mcCopper.ti.x + mcCopper.ti.textWidth) + 2);
					mcCopper.hit.alpha = 0;
					mcCoins.hit.width = ((mcCoins.ti.x + mcCoins.ti.textWidth) + 2);
					mcCoins.hit.alpha = 0;
					btnCopper.addEventListener(MouseEvent.CLICK, onCopperClick, false, 0, true);
					btnCopper.addEventListener(MouseEvent.MOUSE_OVER, onCopperConvertTTOver, false, 0, true);
					btnCopper.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
					btnSilver.addEventListener(MouseEvent.CLICK, onSilverClick, false, 0, true);
					btnSilver.addEventListener(MouseEvent.MOUSE_OVER, onSilverConvertTTOver, false, 0, true);
					btnSilver.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
					btnGold.addEventListener(MouseEvent.CLICK, onGoldClick, false, 0, true);
					btnGold.addEventListener(MouseEvent.MOUSE_OVER, onGoldConvertTTOver, false, 0, true);
					btnGold.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
					btnDiamond.addEventListener(MouseEvent.CLICK, onDiamondClick, false, 0, true);
					btnDiamond.addEventListener(MouseEvent.MOUSE_OVER, onDiamondConvertTTOver, false, 0, true);
					btnDiamond.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
					break;
				case "Inventory":
					btnCopper.txtOption.text = "Desposit";
					btnSilver.txtOption.text = "Desposit";
					btnGold.txtOption.text = "Desposit";
					btnDiamond.txtOption.text = "Desposit";
					mcGold.ti.htmlText = (("<font color='#FFFFFF'>" + rootClass.strNumWithCommas(fData.intGold)) + "</font>");
					mcSilver.ti.htmlText = (("<font color='#FFFFFF'>" + rootClass.strNumWithCommas(fData.intSilver)) + "</font>");
					mcCopper.ti.htmlText = (("<font color='#FFFFFF'>" + rootClass.strNumWithCommas(fData.intCopper)) + "</font>");
					mcCoins.ti.text = rootClass.strNumWithCommas(fData.intCoins);
					mcGold.hit.width = ((mcGold.ti.x + mcGold.ti.textWidth) + 2);
					mcGold.hit.alpha = 0;
					mcSilver.hit.width = ((mcSilver.ti.x + mcSilver.ti.textWidth) + 2);
					mcSilver.hit.alpha = 0;
					mcCopper.hit.width = ((mcCopper.ti.x + mcCopper.ti.textWidth) + 2);
					mcCopper.hit.alpha = 0;
					mcCoins.hit.width = ((mcCoins.ti.x + mcCoins.ti.textWidth) + 2);
					mcCoins.hit.alpha = 0;
					btnCopper.addEventListener(MouseEvent.CLICK, onCopper2Click, false, 0, true);
					btnCopper.addEventListener(MouseEvent.MOUSE_OVER, onCopperConvert2TTOver, false, 0, true);
					btnCopper.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
					btnSilver.addEventListener(MouseEvent.CLICK, onSilver2Click, false, 0, true);
					btnSilver.addEventListener(MouseEvent.MOUSE_OVER, onSilverConvert2TTOver, false, 0, true);
					btnSilver.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
					btnGold.addEventListener(MouseEvent.CLICK, onGold2Click, false, 0, true);
					btnGold.addEventListener(MouseEvent.MOUSE_OVER, onGoldConvert2TTOver, false, 0, true);
					btnGold.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
					btnDiamond.addEventListener(MouseEvent.CLICK, onDiamond2Click, false, 0, true);
					btnDiamond.addEventListener(MouseEvent.MOUSE_OVER, onDiamondConvert2TTOver, false, 0, true);
					btnDiamond.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
					break;				
			}
            
			btnHelp.visible = false;
			//btnHelp.x = ((mcCoins.x + mcCoins.hit.width) + 20);
        }

        override public function notify(o:Object):void{
            if (o.eventType == "refreshCoins"){
                fDraw();
            };
        }
		
		private function onCopperClick(e:MouseEvent):void{
            onTTOut();
            update({eventType:"withdrawCopper"});
        }

        private function onCopperConvertTTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Withdraw Copper"});
        }
		
		private function onSilverClick(e:MouseEvent):void{
            onTTOut();
            update({eventType:"withdrawSilver"});
        }

        private function onSilverConvertTTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Withdraw Silver"});
        }

		private function onGoldClick(e:MouseEvent):void{
            onTTOut();
            update({eventType:"withdrawGold"});
        }

        private function onGoldConvertTTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Withdraw Gold"});
        }
		
		private function onDiamondClick(e:MouseEvent):void{
            onTTOut();
            update({eventType:"withdrawDiamond"});
        }

        private function onDiamondConvertTTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Withdraw Diamond"});
        }
		
        private function onHelpClick(e:MouseEvent):void{
            onTTOut();
            update({eventType:"helpAC"});
        }

        private function onHelpTTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"How do I get Diamonds?"});
        }

        private function onCoinsTTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Diamonds"});
        }

        private function onGoldTTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Gold"});
        }
		
		private function onSilverTTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Silver"});
        }
		
		private function onCopperTTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Copper"});
        }

        private function onTTOut(e:MouseEvent=null):void{
            rootClass.ui.ToolTip.close();
        }
		
		/** INVENTORY **/
		private function onCopper2Click(e:MouseEvent):void{
            onTTOut();
            update({eventType:"depositCopper"});
        }

        private function onCopperConvert2TTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Deposit Copper"});
        }
		
		private function onSilver2Click(e:MouseEvent):void{
            onTTOut();
            update({eventType:"depositSilver"});
        }

        private function onSilverConvert2TTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Deposit Silver"});
        }

		private function onGold2Click(e:MouseEvent):void{
            onTTOut();
            update({eventType:"depositGold"});
        }

        private function onGoldConvert2TTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Deposit Gold"});
        }
		
		private function onDiamond2Click(e:MouseEvent):void{
            onTTOut();
            update({eventType:"depositDiamond"});
        }

        private function onDiamondConvert2TTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Deposit Diamond"});
        }



    }
}//package 
