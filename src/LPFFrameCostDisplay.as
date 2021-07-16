// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFFrameCostDisplay

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFFrameCostDisplay extends LPFFrame {

        public var mcCoins:MovieClip;
        public var mcGold:MovieClip;
		public var mcSilver:MovieClip;
		public var mcCopper:MovieClip;
        public var bg:MovieClip;
        private var rootClass:MovieClip;
        private var r:Object;

        public function LPFFrameCostDisplay():void{
            x = 0;
            y = 0;
            fData = {};
        }

        override public function fOpen(_arg1:Object):void{
            rootClass = MovieClip(stage.getChildAt(0));
            fData = _arg1.fData;
            if (("eventTypes" in _arg1)){
                eventTypes = _arg1.eventTypes;
            };
            if (("r" in _arg1)){
                r = _arg1.r;
            };
            fDraw();
            positionBy(r);
            getLayout().registerForEvents(this, eventTypes);
            mcCoins.addEventListener(MouseEvent.MOUSE_OVER, onCoinsTTOver, false, 0, true);
            mcCoins.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
            mcGold.addEventListener(MouseEvent.MOUSE_OVER, onGoldTTOver, false, 0, true);
            mcGold.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
			mcSilver.addEventListener(MouseEvent.MOUSE_OVER, onSilverTTOver, false, 0, true);
            mcSilver.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
            mcSilver.hit.alpha = 0;
			mcCopper.addEventListener(MouseEvent.MOUSE_OVER, onCopperTTOver, false, 0, true);
            mcCopper.addEventListener(MouseEvent.MOUSE_OUT, onTTOut, false, 0, true);
            mcCopper.hit.alpha = 0;
            mcGold.hit.alpha = 0;
            mcCoins.hit.alpha = 0;
        }

        override public function fClose():void{
            mcCoins.removeEventListener(MouseEvent.MOUSE_OVER, onCoinsTTOver);
            mcCoins.removeEventListener(MouseEvent.MOUSE_OUT, onTTOut);
            mcGold.removeEventListener(MouseEvent.MOUSE_OVER, onGoldTTOver);
            mcGold.removeEventListener(MouseEvent.MOUSE_OUT, onTTOut);
			mcSilver.removeEventListener(MouseEvent.MOUSE_OVER, onSilverTTOver);
            mcSilver.removeEventListener(MouseEvent.MOUSE_OUT, onTTOut);
			mcCopper.removeEventListener(MouseEvent.MOUSE_OVER, onCopperTTOver);
            mcCopper.removeEventListener(MouseEvent.MOUSE_OUT, onTTOut);
            getLayout().unregisterFrame(this);
            if (parent != null){
                parent.removeChild(this);
            };
        }

        private function fDraw():void{
            visible = false;
            var _local1 = (getLayout().sMode == "shopSell");
            var _local2:Number = 0;
            var _local3 = "#FFFFFF";
            if ((((getLayout().sMode.indexOf("shop") > -1)) && (!((fData == null))))){
                visible = true;
                mcGold.visible = false;
				mcSilver.visible = false;
				mcCopper.visible = false;
                mcCoins.visible = false;
                mcGold.x = 0;
				mcSilver.x = 0;
				mcCopper.x = 0;
                mcCoins.x = 0;
                mcGold.ti.text = "";
				mcSilver.ti.text = "";
				mcCopper.ti.text = "";
                mcCoins.ti.text = "";
                _local2 = Number(fData.iCost);
                if (_local2 > 0){
                    if (((("bCoins" in fData)) && ((fData.bCoins == 1)))){
                        if (_local1){
                            if (fData.ItemID == 8939){
                                _local2 = Math.ceil((_local2 / 4));
                            }
                            else {
                                if (fData.iHrs < 24){
                                    _local2 = Math.ceil(((_local2 * 9) / 10));
                                }
                                else {
                                    _local2 = Math.ceil((_local2 / 4));
                                };
                            };
                        }
                        else {
                            if (_local2 > rootClass.world.myAvatar.objData.intCoins){
                                _local3 = "#FF0000";
                            };
                        };
                        mcCoins.ti.htmlText = (((("<font color='" + _local3) + "'>") + rootClass.strNumWithCommas(_local2)) + "</font>");
                        mcCoins.visible = true;
                    } else if (((("bSilver" in fData)) && ((fData.bSilver == 1)))){
                        if (_local1){
                            if (fData.ItemID == 8939){
                                _local2 = Math.ceil((_local2 / 4));
                            }
                            else {
                                if (fData.iHrs < 24){
                                    _local2 = Math.ceil(((_local2 * 9) / 10));
                                }
                                else {
                                    _local2 = Math.ceil((_local2 / 4));
                                };
                            };
                        }
                        else {
                            if (_local2 > rootClass.world.myAvatar.objData.intSilver){
                                _local3 = "#FF0000";
                            };
                        };
                        mcSilver.ti.htmlText = (((("<font color='" + _local3) + "'>") + rootClass.strNumWithCommas(_local2)) + "</font>");
                        mcSilver.visible = true;
                    } else if (((("bCopper" in fData)) && ((fData.bCopper == 1)))){
                        if (_local1){
                            if (fData.ItemID == 8939){
                                _local2 = Math.ceil((_local2 / 4));
                            }
                            else {
                                if (fData.iHrs < 24){
                                    _local2 = Math.ceil(((_local2 * 9) / 10));
                                }
                                else {
                                    _local2 = Math.ceil((_local2 / 4));
                                };
                            };
                        }
                        else {
                            if (_local2 > rootClass.world.myAvatar.objData.intCopper){
                                _local3 = "#FF0000";
                            };
                        };
                        mcCopper.ti.htmlText = (((("<font color='" + _local3) + "'>") + rootClass.strNumWithCommas(_local2)) + "</font>");
                        mcCopper.visible = true;
                    }
                    else {
                        if (_local1){
                            _local2 = Math.ceil((_local2 / 4));
                        }
                        else {
                            if (_local2 > rootClass.world.myAvatar.objData.intGold){
                                _local3 = "#FF0000";
                            };
                        };
                        mcGold.ti.htmlText = (((("<font color='" + _local3) + "'>") + rootClass.strNumWithCommas(_local2)) + "</font>");
                        mcGold.visible = true;
                    };
                    mcGold.hit.width = ((mcGold.ti.x + mcGold.ti.textWidth) + 2);
                    mcCoins.hit.width = ((mcCoins.ti.x + mcCoins.ti.textWidth) + 2);
                    visible = true;
                }
                else {
                    visible = false;
                };
            };
        }

        override protected function positionBy(_arg1:Object){
            var _local3:int;
            var _local2:int;
            if (mcGold.visible){
                bg.width = (((mcGold.x + mcGold.ti.x) + mcGold.ti.textWidth) + 10);
                w = bg.width;
                _local2 = 1;
            } else if(mcSilver.visible){
				bg.width = (((mcSilver.x + mcSilver.ti.x) + mcSilver.ti.textWidth) + 10);
                w = bg.width;
                _local2 = 1;
			} else if(mcCopper.visible){
				bg.width = (((mcCopper.x + mcCopper.ti.x) + mcCopper.ti.textWidth) + 10);
                w = bg.width;
                _local2 = 1;
			} else {
                bg.width = (((mcCoins.x + mcCoins.ti.x) + mcCoins.ti.textWidth) + 10);
                w = bg.width;
            };
            if (((!((_arg1 == null))) && (("xPosRule" in _arg1)))){
                if (_arg1.xPosRule == "centerOnX"){
                    x = (int((_arg1.x - (w / 2))) + _local2);
                };
            }
            else {
                if (_arg1.x > -1){
                    x = _arg1.x;
                }
                else {
                    x = (int(((fParent.w / 2) - (w / 2))) + _local2);
                };
            };
            if (_arg1.y > -1){
                y = _arg1.y;
            }
            else {
                if (_arg1.y == -1){
                    _local3 = fParent.numChildren;
                    if (_local3 > 1){
                        y = ((fParent.getChildAt((_local3 - 2)).y + fParent.getChildAt((_local3 - 2)).height) + 10);
                    }
                    else {
                        y = 10;
                    };
                }
                else {
                    y = (fParent.h + _arg1.y);
                };
            };
        }

        override public function notify(_arg1:Object):void{
            if (_arg1.eventType == "listItemASel" || _arg1.eventType == "vendingSel"){
                if (((!((_arg1.fData == null))) && (!((_arg1.fData.oSel == null))))){
                    fData = _arg1.fData.oSel;
                };
                fDraw();
            };
        }

        private function onCoinsTTOver(_arg1:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Diamonds"});
        }

        private function onGoldTTOver(_arg1:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Gold"});
        }
		
		private function onSilverTTOver(_arg1:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Silver"});
        }
		
		private function onCopperTTOver(_arg1:MouseEvent):void{
            rootClass.ui.ToolTip.openWith({str:"Copper"});
        }

        private function onTTOut(_arg1:MouseEvent):void{
            rootClass.ui.ToolTip.close();
        }


    }
}//package 

