// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFElementListItemItem

package {
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.geom.ColorTransform;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFElementListItemItem extends LPFElementListItem {

        public var icon:MovieClip;
		public var a1:MovieClip;
        public var tName:TextField;
		public var tNameU:TextField;
		public var tNameL:TextField;
		public var tNameT:TextField;
        public var LR:MovieClip;
        public var UR:MovieClip;
        public var TR:MovieClip;
        public var selBG:MovieClip;
        public var tLevel:TextField;
        public var iconAC:MovieClip;
		public var iconStaff:MovieClip;
        public var eqpBG:MovieClip;
        public var iconRing:MovieClip;
        public var hit:MovieClip;
        public var sel:Boolean = false;
        private var rootClass:MovieClip;
        private var allowDesel:Boolean = false;
        private var bLimited:Boolean = false;
        private var redCT:ColorTransform;
        private var greenCT:ColorTransform;
        private var blueCT:ColorTransform;
        private var whiteCT:ColorTransform;
        private var orangeCT:ColorTransform;
        private var yellowCT:ColorTransform;
        private var purpleCT:ColorTransform;
        private var greyCT:ColorTransform;
        private var blackoutCT:ColorTransform;
        private var greyoutCT:ColorTransform;
        //private var isShow:Boolean;

        public function LPFElementListItemItem():void{
            redCT = new ColorTransform(1, 1, 1, 1, 96, 0, 0, 0);
            greenCT = new ColorTransform(1, 1, 1, 1, 0, 96, 0, 0);
            blueCT = new ColorTransform(1, 1, 1, 1, 0, 0, 96, 0);
            whiteCT = new ColorTransform(1, 1, 1, 1, 64, 64, 64, 0);
            orangeCT = new ColorTransform(1, 1, 1, 1, 96, 36, 0, 0);
            yellowCT = new ColorTransform(1, 1, 1, 1, 96, 64, 24, 0);
            purpleCT = new ColorTransform(1, 1, 1, 1, 96, 0, 96, 0);
            greyCT = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
            blackoutCT = new ColorTransform(0, 0, 0, 1, 0, 0, 0, 0);
            greyoutCT = new ColorTransform(0, 0, 0, 1, 40, 40, 40, 0);
			///isShow = true;
            super();
            addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
            addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
        }

        override public function fOpen(_arg1:Object):void{
            fData = _arg1.fData;
            if (("eventType" in _arg1)){
                eventType = _arg1.eventType;
            };
            if (("allowDesel" in _arg1)){
                allowDesel = (_arg1.allowDesel == true);
            };
            if (("bLimited" in _arg1)){
                bLimited = (_arg1.bLimited == true);
            };
            rootClass = MovieClip(stage.getChildAt(0));
            fDraw();
        }

        override protected function fDraw():void{
            var _local4:Object;
            var _local12:Number;
            var _local13:Class;
            var _local14:*;
            var _local15:int;
            var _local16:int;
			tName.htmlText = "";
			tNameL.htmlText = "";
            tNameU.htmlText = "";
            tNameT.htmlText = "";
			LR.visible = false;
            UR.visible = false;
            TR.visible = false;
			a1.visible = false;
            var _local1:Object = rootClass.world.myAvatar.dataLeaf;
            var _local2:int = (hit.width - 2);
            var _local3 = (("<font color='#FFFFFF'>" + fData.sName) + "</font>");
            if (fData.bUpg == 1){
                _local3 = (("<font color='#99FFFF'>" + fData.sName) + "</font>");
            };
            if ((((fData.iLvl > _local1.intLevel)) || (((!((fData.RefineLvl == null))) && ((fData.RefineLvl > _local1.intLevel)))))){
                _local3 = (("<font color='#FF0000'>" + fData.sName) + "</font>");
            };
            if (((bLimited) && ((fData.iQtyRemain <= 0)))){
                _local3 = (("<font color='#666666'>" + fData.sName) + "</font>");
            };
			var iTag;
			if (fData.iLvl == 20){
				a1.visible = true;
			};
			if (fData.sType.toLowerCase() != "refinement"){
				if(fData.iRefine != ""){
					switch (fData.iRty){
						case 5:
							tNameU.htmlText = "<font color='#00FF00'>" +fData.iRefine + "</font> " + _local3;
							LR.visible = true;
							break;
						case 15:
							tNameL.htmlText = "<font color='#00FF00'>" +fData.iRefine + "</font> " + _local3;
							UR.visible = true;
							break;
						case 28:
							tNameT.htmlText = "<font color='#00FF00'>" +fData.iRefine + "</font> " + _local3;
							TR.visible = true;
							break;
						default:
							tName.htmlText = "<font color='#00FF00'>" +fData.iRefine + "</font> " + _local3;
							break;
					};
				} else {
					switch (fData.iRty){
						case 5:
							tNameU.htmlText = _local3;
							LR.visible = true;
							break;
						case 15:
							tNameL.htmlText = _local3;
							UR.visible = true;
							break;
						case 28:
							tNameT.htmlText = _local3;
							TR.visible = true;
							break;
						default:
							tName.htmlText = _local3;
							break;
					};
				}
			} else {
				switch (fData.iRty){
					case 5:
						tNameU.htmlText = _local3;
						LR.visible = true;
						break;
					case 15:
						tNameL.htmlText = _local3;
						UR.visible = true;
						break;
					case 28:
						tNameT.htmlText = _local3;
						TR.visible = true;
						break;
					default:
						tName.htmlText = _local3;
						break;
				};
			}
            if (fData.iRty != null){
            };
            if (["Weapon", "he", "ar", "ba"].indexOf(fData.sES) > -1){
                if (fData.PatternID != null){
                    _local4 = rootClass.world.refinePatternTree[fData.PatternID];
                };
                if (fData.RefinePatternID != null){
                    _local4 = rootClass.world.refinePatternTree[fData.RefinePatternID];
                };
                if (_local4 != null){
                };
            };
            if (bLimited){
                tName.htmlText = (tName.htmlText + (("<font color='#AA0000'> x" + fData.iQtyRemain) + "</font>"));
            } else {
                if (fData.iStk > 1){
                    tName.htmlText = (tName.htmlText + (("<font color='#999999'> x" + fData.iQty) + "</font>"));
                };
            };
            if ((((fData.sES == "ar")) && ((fData.RefineID > 0)))){
                _local12 = rootClass.getRankFromPoints(fData.iQty);
                tName.htmlText = (tName.htmlText + (("<font color='#999999'>, Rank " + _local12) + "</font>"));
            };
            if (((!((fData.RefineLvl == null))) && ((fData.RefineLvl > 0)))){
                tLevel.htmlText = (("<font color='#00CCFF'>" + fData.RefineLvl) + "</font>");
            }
            else {
                if (((!((fData.iLvl == null))) && ((fData.iLvl > 0)))){
                    tLevel.htmlText = (("<font color='#FFFFFF'>" + fData.iLvl) + "</font>");
                }
                else {
                    tLevel.visible = false;
                };
            };
            iconAC.visible = false;
			iconStaff.visible = false;
            if (((("bCoins" in fData)) && ((fData.bCoins == 1)))){
                iconAC.visible = true;
            };
			if (((("bStaff" in fData)) && ((fData.bStaff == 1)))){
				iconStaff.visible = true;
				iconAC.visible = false;
			};
            var _local5:* = 23;
            var _local6:* = 19;
            var _local7:* = 13;
            var _local8:* = 11;
            var _local9:* = _local5;
            var _local10:* = _local6;
            var _local11 = "";
            icon.removeAllChildren();
            icon.visible = false;
            try {
                if (fData.sType.toLowerCase() == "refinement"){
                    _local11 = "iidesign";//_local11 = rootClass.getIconBySlot(fData.sES);
                }
                else {
                    if ((((fData.sType.toLowerCase() == "serveruse")) || ((fData.sType.toLowerCase() == "clientuse")))){
                        if (((((("sFile" in fData)) && ((fData.sFile.length > 0)))) && (!((rootClass.world.getClass(fData.sFile) == null))))){
                            _local11 = fData.sFile;
                        }
                        else {
                            _local11 = fData.sIcon;
                        };
                    }
                    else {
                        if ((((((fData.sIcon == null)) || ((fData.sIcon == "")))) || ((fData.sIcon == "none")))){
                            if (fData.sLink.toLowerCase() != "none"){
                                _local11 = "iidesign";
                            } else {
                                _local11 = "iibag";
                            };
                        } else {
                            _local11 = fData.sIcon;
                        };
                    };
                };
                try {
                    _local13 = (rootClass.world.getClass(_local11) as Class);
                    _local14 = icon.addChild(new (_local13)());
                    _local9 = _local14.width;
                    _local10 = _local14.height;
                    _local15 = 0;
                    _local16 = 0;
                    if (fData.sType.toLowerCase() == "refinement"){
                        _local15 = (((_local5 - _local7) / 4) - 1);
                        _local16 = (((_local6 - _local8) / 4) - 1);
                        _local5 = _local7;
                        _local6 = _local8;
                    };
                    if (_local9 > _local10){
                        _local14.scaleX = (_local14.scaleY = (_local5 / _local9));
                    }
                    else {
                        _local14.scaleX = (_local14.scaleY = (_local6 / _local10));
                    };
                    _local14.x = (-((_local14.width / 2)) + _local15);
                    _local14.y = (-((_local14.height / 2)) + _local16);
                    icon.visible = true;
                }
                catch(e:Error) {
                };
                iconRing.visible = true;
                iconRing.y = (iconRing.y = 2);
                iconRing.width = (iconRing.height = 25);
                if (fData.sType.toLowerCase() == "refinement"){
                    //icon.transform.colorTransform = blackoutCT;
                }
                else {
                    if (((!((fData.RefineLvl == null))) && ((fData.RefineLvl > 0)))){
                        iconRing.width = (iconRing.height = 19);
                        iconRing.x = (iconRing.x + 3);
                        iconRing.y = (iconRing.y + 3);
                    }
                    else {
                        iconRing.visible = false;
                        if (["Weapon", "he", "ar", "ba"].indexOf(fData.sES) > -1){
                            icon.transform.colorTransform = greyoutCT;
                        };
                    };
                };
                if (_local4 != null){
                    iconRing.bg.transform.colorTransform = getCatCT(_local4.sDesc);
                };
                eqpBG.visible = false;
                if (fData.bEquip == 1){
                    eqpBG.visible = true;
                };
                selBG.alpha = 0;
                buttonMode = true;
                mouseChildren = false;
            }
            catch(e) {
            };
        }

        override public function select():void{
            sel = true;
            selBG.alpha = 1;
        }

        override public function deselect():void{
            sel = false;
            selBG.alpha = 0;
        }

        override protected function onClick(_arg1:MouseEvent):void{
            var _local2:MovieClip;
            if (!rootClass.isGreedyModalInStack()){
                if (!sel){
                    _local2 = LPFFrameListViewTabbed(fParent).getListItemByiSel();
                    if (_local2 != null){
                        _local2.deselect();
                    };
                    select();
                }
                else {
                    if (allowDesel){
                        deselect();
                    };
                };
                update();
            };
        }
        override protected function onMouseOver(_arg1:MouseEvent):void{
            if (!sel){
                selBG.alpha = 0.6;
            };
        }
        override protected function onMouseOut(_arg1:MouseEvent):void{
            if (!sel){
                selBG.alpha = 0;
            };
        }
        private function getCatCT(_arg1:String):ColorTransform{
            var _local2:ColorTransform = greyCT;
            if (_arg1 == "M1"){
                _local2 = redCT;
            };
            if (_arg1 == "M2"){
                _local2 = greenCT;
            };
            if (_arg1 == "M3"){
                _local2 = yellowCT;
            };
            if (_arg1 == "C1"){
                _local2 = blueCT;
            };
            if (_arg1 == "C2"){
                _local2 = whiteCT;
            };
            if (_arg1 == "C3"){
                _local2 = orangeCT;
            };
            if (_arg1 == "S1"){
                _local2 = purpleCT;
            };
            if (_arg1 == "none"){
                _local2 = greyCT;
            };
            return (_local2);
        }

    }
}//package 

