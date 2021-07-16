// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFFrameGoldDisplay

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFFrameGoldDisplay extends LPFFrame {

        public var btnHelp:MovieClip;
		public var btnSilver:MovieClip;
		public var btnGold:MovieClip;
        public var mcCoins:MovieClip;
        public var mcGold:MovieClip;
		public var mcSilver:MovieClip;
		public var mcCopper:MovieClip;
        private var rootClass:MovieClip;

        public function LPFFrameGoldDisplay():void{
            x = 0;
            y = 0;
            fData = {};
        }

        override public function fOpen(o:Object):void{
            rootClass = MovieClip(stage.getChildAt(0));
            fData = o.fData;
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
			btnSilver.addEventListener(MouseEvent.CLICK, onSilverClick, false, 0, true);
            btnSilver.addEventListener(MouseEvent.MOUSE_OVER, onSilverConvertTTOver, false, 0, true);
            btnSilver.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
			btnGold.addEventListener(MouseEvent.CLICK, onGoldClick, false, 0, true);
            btnGold.addEventListener(MouseEvent.MOUSE_OVER, onGoldConvertTTOver, false, 0, true);
            btnGold.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
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
			btnSilver.removeEventListener(MouseEvent.CLICK, onSilverClick);
            btnSilver.removeEventListener(MouseEvent.MOUSE_OVER, onSilverConvertTTOver);
            btnSilver.removeEventListener(MouseEvent.MOUSE_OUT, onTTOut);
			btnGold.removeEventListener(MouseEvent.CLICK, onGoldClick);
            btnGold.removeEventListener(MouseEvent.MOUSE_OVER, onGoldConvertTTOver);
            btnGold.removeEventListener(MouseEvent.MOUSE_OUT, onTTOut);
            getLayout().unregisterFrame(this);
            if (parent != null){
                parent.removeChild(this);
            };
        }

        private function fDraw():void{
		    rootClass.ui.mcInterface.mcGold.strCoins.text = (rootClass.world.myAvatar.objData.intCoins);
			rootClass.ui.mcInterface.mcGold.strGold.text = (rootClass.world.myAvatar.objData.intGold);
                                                               
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
            //btnHelp.x = ((mcCoins.x + mcCoins.hit.width) + 20);
			btnHelp.visible = false;
        }

        override public function notify(o:Object):void{
            if (o.eventType == "refreshCoins"){
                fDraw();
            };
        }
		
		private function onSilverClick(e:MouseEvent):void{
            onTTOut();
            update({eventType:"convertSilver"});
        }

        private function onSilverConvertTTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Convert Copper to Silver"});
        }

		private function onGoldClick(e:MouseEvent):void{
            onTTOut();
            update({eventType:"convertGold"});
        }

        private function onGoldConvertTTOver(e:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Convert Silver to Gold"});
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


    }
}//package 
