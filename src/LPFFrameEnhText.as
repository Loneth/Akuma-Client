// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFFrameEnhText

package {
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.DisplayObject;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFFrameEnhText extends LPFFrame {

        public var mcStats:MovieClip;
        public var tDesc:TextField;
        private var iSel:Object;
        private var eSel:Object;
        private var iEnh:Object;
        private var eEnh:Object;
        private var rootClass:MovieClip;
        private var curItem:Object;
        private var isEquip:Boolean;

        public function LPFFrameEnhText():void{
            mcStats.sproto.visible = false;
			isEquip = false;
        }

        override public function fOpen(_arg1:Object):void{
            rootClass = MovieClip(stage.getChildAt(0));
            positionBy(_arg1.r);
            iEnh = null;
            eEnh = null;
            if (("eventTypes" in _arg1)){
                eventTypes = _arg1.eventTypes;
            };
			if (("isEquip" in _arg1)){
                isEquip = _arg1.isEquip;
            };
            fDraw();
            getLayout().registerForEvents(this, eventTypes);
        }

        override public function fClose():void{
            var _local1:DisplayObject;
            while (mcStats.numChildren > 1) {
                _local1 = mcStats.getChildAt(1);
                _local1.removeEventListener(MouseEvent.MOUSE_OVER, onTTFieldMouseOver);
                _local1.removeEventListener(MouseEvent.MOUSE_OUT, onTTFieldMouseOut);
                mcStats.removeChildAt(1);
            };
            getLayout().unregisterFrame(this);
            if (parent != null){
                parent.removeChild(this);
            };
        }

        protected function fDraw():void{
            var _local3:Object;
            var _local4:Boolean;
            var _local5:Number;
            var _local6:Number;
            var _local7:int;
            var _local8:int;
            var _local9:int;
            var _local10:int;
            var _local11:int;
            var _local12:int;
            var _local13:int;
            var _local14:Object;
            var _local15:int;
            var _local16:int;
            var _local1 = "";
            var _local2 = "#00CCFF";
            if (iSel != null){
                _local1 = "<font size='12' color='#999999'>Refinement</font><br>";
                if (["Weapon", "he", "ar", "ba"].indexOf(iSel.sES) > -1){
                    iEnh = null;
                    eEnh = null;
                    if (iSel.PatternID != null){
                        iEnh = rootClass.world.refinePatternTree[iSel.PatternID];
                    };
                    if (iSel.RefinePatternID != null){
                        iEnh = rootClass.world.refinePatternTree[iSel.RefinePatternID];
                    };
                    if (eSel != null){
                        if (eSel.sES == iSel.sES){
                            if (eSel.PatternID != null){
                                eEnh = rootClass.world.refinePatternTree[eSel.PatternID];
                            };
                            if (eSel.RefinePatternID != null){
                                eEnh = rootClass.world.refinePatternTree[eSel.RefinePatternID];
                            };
                            _local1 = (_local1 + ((("<font size='11' color='" + _local2) + "'>") + eEnh.sName));
                            if (eSel.iRty > 1){
                                _local1 = (_local1 + (" +" + (eSel.iRty - 1)));
                            };
                            _local1 = (_local1 + "</font>");
                            _local1 = (_local1 + "<font size='11' color='#FFFFFF'> vs. </font>");
                            _local2 = "#999999";
                            if (iEnh != null){
                                _local1 = (_local1 + ((("<font size='11' color='" + _local2) + "'>") + iEnh.sName));
                                if (iSel.RefineRty > 1){
                                    _local1 = (_local1 + (" +" + (iSel.RefineRty - 1)));
                                };
                                _local1 = (_local1 + "</font>");
                            }
                            else {
                                _local1 = (_local1 + "<font size='11' color='#00CCFF'>No refinement</font>");
                            };
                        }
                        else {
                            _local1 = (_local1 + "<font size='11' color='#00CCFF'>Refinement type must match item slot!</font>");
                        };
                    }
                    else {
                        if (iEnh != null){
                            _local1 = (_local1 + ((("<font size='11' color='" + _local2) + "'>") + iEnh.sName));
                            if (((("RefineRty" in iSel)) && ((iSel.RefineRty > 1)))){
                                _local1 = (_local1 + (" +" + (iSel.RefineRty - 1)));
                            }
                            else {
                                if (((((("iRty" in iSel)) && ((iSel.iRty < 10)))) && ((iSel.iRty > 1)))){
                                    _local1 = (_local1 + (" +" + (iSel.iRty - 1)));
                                };
                            };
                            _local1 = (_local1 + "</font>");
                        }
                        else {
                            _local1 = (_local1 + "<font size='11' color='#00CCFF'>No refinement</font>");
                        };
                    };
                    if (iSel.sType.toLowerCase() == "refinement"){
                        _local1 = (_local1 + " <font size='11' color='#FFFFFF'>imbues an item with: </font>");
                    };
                    _local3 = rootClass.copyObj(iSel);
                    if (eSel != null){
                        _local3 = rootClass.copyObj(eSel);
                        if (iSel != null){
                            _local3.sType = iSel.sType;
                            if (("RefineRty" in iSel)){
                                _local3.RefineRty = iSel.RefineRty;
                            };
                            if (("iRng" in iSel)){
                                _local3.iRng = iSel.iRng;
                            }
                            else {
                                _local3.iRng = 10;
                            };
                        };
                    };
                    if (_local3.sES.toLowerCase() == "weapon"){
                        _local4 = (_local3.sType.toLowerCase() == "refinement");
                        if (_local4){
                            _local5 = _local3.iDPS;
                        }
                        else {
                            if (("RefineDPS" in _local3)){
                                _local5 = _local3.RefineDPS;
                            }
                            else {
                                if (((!((eSel == null))) && (("iDPS" in eSel)))){
                                    _local5 = eSel.iDPS;
                                }
                                else {
                                    _local5 = -1;
                                };
                            };
                        };
                        if (_local5 == 0){
                            _local5 = 100;
                        };
                        if (_local5 == -1){
                            _local5 = 100;
                        };
                        _local5 = (_local5 / 100);
                        _local6 = ((("iRng" in _local3)) ? _local3.iRng : 0);
                        _local6 = (_local6 / 100);
                        _local7 = 0;
                        if (("iRty" in _local3)){
                            _local7 = (_local3.iRty - 1);
                        };
                        if (("RefineRty" in _local3)){
                            _local7 = (_local3.RefineRty - 1);
                        };
                        if (_local4){
                            _local8 = _local3.iLvl;
                        }
                        else {
                            if (("RefineLvl" in _local3)){
                                _local8 = _local3.RefineLvl;
                            }
                            else {
                                if (((!((eSel == null))) && (("iLvl" in eSel)))){
                                    _local8 = eSel.iLvl;
                                }
                                else {
                                    _local8 = iSel.iLvl;
                                };
                            };
                        };
                        _local9 = rootClass.getBaseHPByLevel((_local8 + _local7));
                        _local10 = 20;
                        _local11 = 2;
                        _local12 = Math.round((((_local9 / _local10) * _local5) * rootClass.PCDPSMod));
                        _local13 = Math.round((_local12 * _local11));
                        _local14 = rootClass.world.getAutoAttack();
                        _local13 = (_local13 * _local14.damage);
                        _local15 = Math.floor((_local13 - (_local13 * _local6)));
                        _local16 = Math.ceil((_local13 + (_local13 * _local6)));
                        if ((((_local3.sType.toLowerCase() == "refinement")) || (((("RefineLvl" in _local3)) || (!((eSel == null))))))){
                            _local1 = (_local1 + (("<br><font color='#FFFFFF'>" + _local12) + " DPS"));
                        };
                        if (((!((_local3.sType.toLowerCase() == "refinement"))) && (((("RefineLvl" in _local3)) || (!((eSel == null))))))){
                            _local1 = (_local1 + ((((((" ( <font color='#999999'>" + _local15) + "-") + _local16) + ", ") + rootClass.numToStr((_local14.cd / 1000), 1)) + " speed</font> )</font>"));
                        };
                    };
                } else {
					if (iSel.sType.toLowerCase() == "egg"){
						_local1 = ("<font size='12' color='#999999'>Details</font><br>");
						_local1 = (_local1 + "<font size='10' color='#FFFFFF'>This egg has an estimated of <font size='10' color='#00CCFF'>" + iSel.HatchDays + "</font> Days to hatch.<br>Date Obtained: <font size='10' color='#00CCFF'>" + iSel.DatePurchased + "</font>.");
					} else if ((((((((iSel.sES == "pe")) || ((iSel.sES == "co")))) || ((iSel.sES == "am")))) || ((((((iSel.sType.toLowerCase() == "item")) && (!((iSel.sLink == null))))) && (!((iSel.sLink == ""))))))){
						_local1 = (_local1 + "<font size='11' color='#00CCFF'>This item cannot be refined.</font>");
					};
                };
                tDesc.htmlText = _local1;
                showStats();
            }
            else {
                if (((!((MovieClip(getLayout()).iSel == null))) && (!(rootClass.doIHaveRefinements())))){
                    if (isEquip){
                        tDesc.htmlText = "<font color='#FF0000'>You have not yet equipped with this kind items!</font><br>";
                    }
                    else {
						tDesc.htmlText = "<font color='#FF0000'>You need an Refinement!</font><br>";
						tDesc.htmlText = (tDesc.htmlText + "<font color='#FFFFFF'>No refinement for this type of item were found in your backpack. Refinements are used to power up your item. You can buy at shops or find them on monsters.</font>");
					};
                }
                else {
                    tDesc.htmlText = "No item selected.";
                };
            };
            showStats();
        }

        override public function notify(_arg1:Object):void{
            if (_arg1.eventType != "showItemListB"){
                if (_arg1.eventType == "refreshItems"){
                    if (((!((iSel == _arg1.fData.iSel))) && (!((iSel == _arg1.fData.eSel))))){
                        iSel = null;
                        eSel = null;
                    };
                }
                else {
                    if (_arg1.eventType == "clearState"){
                        iSel = null;
                        eSel = null;
                    }
                    else {
                        iSel = _arg1.fData.iSel;
                        eSel = _arg1.fData.eSel;
                        if ((((iSel == null)) && (!((eSel == null))))){
                            iSel = eSel;
                            eSel = null;
                        };
                    };
                };
            };
			if (isEquip){
                if (iSel != null){
                    iSel = rootClass.world.myAvatar.getEquippedItemBySlot(iSel.sES);
                };
                if (eSel != null){
                    eSel = rootClass.world.myAvatar.getEquippedItemBySlot(eSel.sES);
                };
            };
            fDraw();
        }

        private function showStats():void{
            var _local2:Object;
            var _local3:Object;
            var _local10:MovieClip;
            var _local11:Object;
            while (mcStats.numChildren > 1) {
                mcStats.removeChildAt(1);
            };
            mcStats.sproto.x = 0;
            mcStats.sproto.y = (tDesc.textHeight + 8);
            var _local1 = !((eSel == null));
            var _local4:int;
            var _local5:int;
            var _local6:int;
            var _local7:int;
            var _local8 = "";
            var _local9:Class = (mcStats.sproto.constructor as Class);
            if (((!((iSel == null))) && (((((((!((iEnh == null))) || (!((eEnh == null))))) && ((((eSel == null)) || ((eSel.sES == iSel.sES)))))) || (((_local1) && ((eSel.sES == iSel.sES)))))))){
                if (((_local1) && (!((iEnh == null))))){
                    _local2 = rootClass.getStatsA(eSel, iSel.sES);
                    _local3 = rootClass.getStatsA(iSel, iSel.sES);
                }
                else {
                    _local11 = rootClass.copyObj(iSel);
                    if (_local1){
                        _local11.RefinePatternID = eSel.PatternID;
                        _local11.RefineLvl = eSel.iLvl;
                        _local11.RefineRty = eSel.iRty;
                        _local1 = false;
                    };
                    _local2 = rootClass.getStatsA(_local11, iSel.sES);
                };
                _local4 = 0;
                while (_local4 < rootClass.orderedStats.length) {
                    _local8 = rootClass.orderedStats[_local4];
                    _local7 = 0;
                    if (((((_local1) && (!((_local3[("$" + _local8)] == null))))) && ((_local2[("$" + _local8)] == null)))){
                        _local2[("$" + _local8)] = 0;
                    };
                    if (_local2[("$" + _local8)] != null){
                        _local10 = new (_local9)();
                        _local6 = _local2[("$" + _local8)];
                        _local10.tSta.text = rootClass.getFullStatName(_local8);
                        _local10.tOldval.visible = false;
                        if (_local1){
                            if (_local3[("$" + _local8)] != null){
                                _local7 = _local3[("$" + _local8)];
                            };
                            _local10.tOldval.text = (("(" + _local7) + ")");
                            _local10.tOldval.visible = true;
                            if (_local6 > _local7){
                                _local10.tVal.htmlText = (("<font color='#33FF66'>" + _local6) + "</font>");
                            }
                            else {
                                if (_local6 == _local7){
                                    _local10.tVal.htmlText = (("<font color='#FFFFFF'>" + _local6) + "</font>");
                                }
                                else {
                                    _local10.tVal.htmlText = (("<font color='#FF6633'>" + _local6) + "</font>");
                                };
                            };
                        }
                        else {
                            _local10.tVal.htmlText = (('<font color="0xFFFFFF">' + _local6) + "</font>");
                        };
                        _local10.tOldval.x = ((_local10.tVal.x + _local10.tVal.textWidth) + 3);
                        _local10.x = (mcStats.sproto.x + ((_local5 % 3) * 100));
                        _local10.y = (mcStats.sproto.y + (Math.floor((_local5 / 3)) * 16));
                        _local10.hit.alpha = 0;
                        _local10.addEventListener(MouseEvent.MOUSE_OVER, onTTFieldMouseOver, false, 0, true);
                        _local10.addEventListener(MouseEvent.MOUSE_OUT, onTTFieldMouseOut, false, 0, true);
                        _local10.name = ("t" + _local8);
                        mcStats.addChild(_local10);
                        _local5++;
                    };
                    _local4++;
                };
                mcStats.visible = true;
            }
            else {
                mcStats.visible = false;
            };
        }

        private function onTTFieldMouseOver(_arg1:MouseEvent):void{
            var _local2:String = _arg1.currentTarget.name;
            var _local3 = "";
            switch (_local2){
                case "tAP":
                    _local3 = "Attack Power increases the effectiveness of your physical damage attacks.";
                    break;
                case "tSP":
                    _local3 = "Magic Power increases the effectiveness of your magical damage attacks.";
                    break;
                case "tDmg":
                    _local3 = "This is the damage you would expect to see on a normal melee hit, before any other modifiers.";
                    break;
                case "tHP":
                    _local3 = "Your total Hit Points.  When these reach zero, you will need to wait a short time before being able to continue playing.";
                    break;
                case "tHitTF":
                    _local3 = "Hit chance determines how likely you are to hit a target, before any other modifiers.";
                    break;
                case "tHasteTF":
                    _local3 = "Haste reduces the cooldown on all of your attacks and spells, including Auto Attack, by a certain percentage (hard capped at 50%).";
                    break;
                case "tCritTF":
                    _local3 = "Critical Strike chance increases the likelihood of dealing additional damage on a any attack.";
                    break;
                case "tDodgeTF":
                    _local3 = "Evasion chance allows you to completely avoid incoming damage.";
                    break;
                case "tSTR":
                case "sl1":
                    _local3 = "Strength increases Attack Power, which boosts physical damage. It also improves Critical Strike chance for melee classes.";
                    break;
                case "tINT":
                case "sl2":
                    _local3 = "Intellect increases Magic Power, which boosts magical damage. It also improve Critical Strike chance for caster classes.";
                    break;
                case "tEND":
                case "sl3":
                    _local3 = "Endurance directly contributes to your total Hit Points.  While very useful for all classes, some abilities work best with very high or very low total HP.";
                    break;
                case "tDEX":
                case "sl4":
                    _local3 = "Dexterity is valuable to melee classes. It increases Haste, Hit chance, and Evasion chance. It increases only Evasion chance for caster classes.";
                    break;
                case "tWIS":
                case "sl5":
                    _local3 = "Wisdom is valuable to caster classes. It increases Hit chance, Crit chance, and Evasion chance. It improves only Evasion chance for melee classes.";
                    break;
                case "tLCK":
                case "sl6":
                    _local3 = "Luck increases your Critical Strike modifier value directly, and may have effects outside of combat.";
                    break;
            };
            rootClass.ui.ToolTip.openWith({str:_local3});
        }

        private function onTTFieldMouseOut(_arg1:MouseEvent):void{
            rootClass.ui.ToolTip.close();
        }


    }
}//package 

