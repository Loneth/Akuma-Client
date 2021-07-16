// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//CharpanelMC

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.display.Graphics;
    import flash.text.TextField;
    import flash.geom.ColorTransform;
    import flash.events.Event;
    import flash.text.*;
    import flash.display.SimpleButton;

    public class CharpanelMC extends MovieClip {

        public var cnt2:MovieClip;
        public var bg:MovieClip;
        public var cnt:MovieClip;
        public var bg2:MovieClip;
        private var rootClass:MovieClip;
        private var world:MovieClip;
        private var mcPopup:MovieClip;
        private var nextMode:String;
        private var uoLeaf:Object;
        private var uoData:Object;
        private var sta:Object;
        private var stp:Object;
        private var stu:Object;
        private var stg:Object;
        private var pts:int = -1;
        private var upts:int = -1;
        private var spendStuC:Array;
        private var spendStpC:Array;
        private var barVal:int = 150;
        private var spendStat:String = "none";
        private var spendOp:String = "";
        private var spendTicks:int = 0;
        private var spendVals:Array;
        private var ttFields:Array;
		
		/** OWN EXTENSIONS **/
		public var StrengthUp:int;
		public var TotalStrength:int;
		public var IntellectUp:int;
		public var TotalIntellect:int;
		public var EnduranceUp:int;
		public var TotalEndurance:int;
		public var DexterityUp:int;
		public var TotalDexterity:int;
		public var WisdomUp:int;
		public var TotalWisdom:int;
		public var LuckUp:int;
		public var TotalLuck:int;
		public var StatPoints:int;
		public var statStrength:int;
		public var statIntellect:int;
		public var statEndurance:int;
		public var statDexterity:int;
		public var statWisdom:int;
		public var statLuck:int;
		public var OverAllStatPoints:int;
		public var StatPointtoShow:int;
		
        public function CharpanelMC():void{
            rootClass = (stage.getChildAt(0) as MovieClip);
            world = (rootClass.world as MovieClip);
            mcPopup = rootClass.ui.mcPopup;
            uoLeaf = world.myLeaf();
            uoData = world.myAvatar.objData;
            sta = uoLeaf.sta;
            stp = new Object();
            stu = new Object();
            stg = new Object();
            spendStuC = [1595286, 1470895, 1410498, 1349844, 1289447, 1229821];
            spendStpC = [0xE66200, 0xEB7B00, 0xF08E00, 0xF4A100, 0xF9B400, 0xFFCC00];
            spendVals = [{
                a:0,
                b:1
            }, {
                a:30,
                b:3
            }, {
                a:60,
                b:9
            }];
            ttFields = [];
            super();
            addFrameScript(0, frame1, 4, frame5, 11, frame12, 24, frame25);
            bg.btnClose.addEventListener(MouseEvent.MOUSE_DOWN, btnCloseClick, false, 0, true);
            bg.tTitle.text = "Character Overview";
            bg2.btnClose.addEventListener(MouseEvent.MOUSE_DOWN, btnCloseClick, false, 0, true);
            bg2.tTitle.text = "Class Overview";
            buildStu();
        }

        public function openWith(_arg1:Object):void{
            nextMode = _arg1.typ;
            if (isValidMode(nextMode)){
                if (((!((this.currentLabel == "init"))) && ((this.currentLabel.indexOf("-out") < 0)))){
                    this.gotoAndPlay((this.currentLabel + "-out"));
                }
                else {
                    this.gotoAndPlay(nextMode);
                };
            };
        }

        public function fClose():void{
            var _local1:Array;
            var _local2:Array;
            var _local3:MovieClip;
            var _local4:int;
            var _local5:*;
            var _local6:MovieClip;
            var _local7:MovieClip;
            if (MovieClip(this).currentLabel.indexOf("overview") > -1){
                try {
                    _local1 = [cnt.sl1, cnt.sl2, cnt.sl3, cnt.sl4, cnt.sl5, cnt.sl6];
                    _local2 = [cnt.abilities.a1, cnt.abilities.a2, cnt.abilities.a3, cnt.abilities.a4, cnt.abilities.p1, cnt.abilities.p2];
                    _local4 = 0;
                    while (_local4 < _local1.length) {
                        _local3 = _local1[_local4];
                        _local4++;
                    };
                    for each (_local5 in ttFields) {
                        _local5.removeEventListener(MouseEvent.MOUSE_OVER, onTTFieldMouseOver);
                        _local5.removeEventListener(MouseEvent.MOUSE_OUT, onTTFieldMouseOut);
                    };
                    for each (_local6 in _local2) {
                        _local6.removeEventListener(MouseEvent.MOUSE_OVER, rootClass.actIconOver);
                        _local6.addEventListener(MouseEvent.MOUSE_OUT, rootClass.actIconOut);
                        _local6.actObj = null;
                    };
                }
                catch(e:Error) {
                };
            };
            bg.btnClose.removeEventListener(MouseEvent.MOUSE_DOWN, btnCloseClick);
            bg2.btnClose.removeEventListener(MouseEvent.MOUSE_DOWN, btnCloseClick);
            if (parent != null){
                _local7 = MovieClip(parent);
                _local7.removeChild(this);
                _local7.onClose();
            };
        }

        private function update():void{
            var _local1:Array;
            var _local2:*;
            var _local3:MovieClip;
            var _local4:int;
            var _local5:int;
            var _local6:int;
            if (MovieClip(this).currentLabel == "overview"){
                _local1 = [cnt.sl1, cnt.sl2, cnt.sl3, cnt.sl4, cnt.sl5, cnt.sl6];
                ttFields = [cnt.sl1, cnt.sl2, cnt.sl3, cnt.sl4, cnt.sl5, cnt.sl6, cnt.tAP, cnt.tSP, cnt.tDmg, cnt.tHitTF, cnt.tHasteTF, cnt.tCritTF, cnt.tDodgeTF, cnt.tSTR, cnt.tINT, cnt.tEND, cnt.tDEX, cnt.tWIS, cnt.tLCK];
                for each (_local2 in ttFields) {
                    _local2.removeEventListener(MouseEvent.MOUSE_OVER, onTTFieldMouseOver);
                    _local2.removeEventListener(MouseEvent.MOUSE_OUT, onTTFieldMouseOut);
                    _local2.addEventListener(MouseEvent.MOUSE_OVER, onTTFieldMouseOver, false, 0, true);
                    _local2.addEventListener(MouseEvent.MOUSE_OUT, onTTFieldMouseOut, false, 0, true);
                };
                _local4 = _local1[0].signs.bplus.x;
                _local5 = _local1[0].signs.bminus.x;
                _local6 = 0;
                while (_local6 < _local1.length) {
                    _local3 = _local1[_local6];
                    _local3.hitL.alpha = 0;
                    _local3.hitR.alpha = 0;
                    if (_local3.name == "sl1"){
                        _local3.a = "_STR";
                    };
                    if (_local3.name == "sl2"){
                        _local3.a = "_INT";
                    };
                    if (_local3.name == "sl3"){
                        _local3.a = "_END";
                    };
                    if (_local3.name == "sl4"){
                        _local3.a = "_DEX";
                    };
                    if (_local3.name == "sl5"){
                        _local3.a = "_WIS";
                    };
                    if (_local3.name == "sl6"){
                        _local3.a = "_LCK";
                    };
                    if (_local3.name.indexOf("l") > -1){
                        _local3.m = "right";
                        _local3.signs.bplus.x = _local5;
                        _local3.signs.bminus.x = _local4;
                    }
                    else {
                        _local3.m = "left";
                    };
                    _local6++;
                };
                updateSpend();
            };
        }

        private function playNextMode():void{
            this.gotoAndPlay(nextMode);
        }

        private function isValidMode(_arg1:String):Boolean{
            var _local2:Boolean;
            var _local3:int;
            while ((((_local3 < this.currentLabels.length)) && (!(_local2)))) {
                if (this.currentLabels[_local3].name == _arg1){
                    _local2 = true;
                };
                _local3++;
            };
            return (_local2);
        }

        private function updateSpend():void{
            var _local8:Object;
            var _local18:MovieClip;
            var _local25:Class;
            var _local26:MovieClip;
            var _local27:Class;
            var _local28:MovieClip;
            var _local29:*;
            var _local1:MovieClip = MovieClip(this).cnt;
            var _local2:Array = [_local1.sl1, _local1.sl2, _local1.sl3, _local1.sl4, _local1.sl5, _local1.sl6];
            var _local3:Object = {};
            var _local4:int;
            var _local5:int;
            var _local6 = "";
            var _local7:Boolean;
            pts = rootClass.getInnateStats(uoLeaf.intLevel);
            upts = getUnusedPts();
            _local4 = 0;
            while (_local4 < rootClass.stats.length) {
                _local6 = rootClass.stats[_local4];
                _local3[("_" + _local6)] = (stu[("_" + _local6)] + stp[("_" + _local6)]);
                _local4++;
            };
            for (_local6 in stg) {
                _local3[_local6] = stg[_local6];
            };
            rootClass.applyCoreStatRatings(_local3, uoLeaf);
            _local4 = 0;
            while (_local4 < uoLeaf.passives.length) {
                _local8 = uoLeaf.passives[_local4];
                if (_local8.e != null){
                    _local5 = 0;
                    while (_local5 < _local8.e.length) {
                        rootClass.applyAuraEffect(_local8.e[_local5], _local3);
                        _local5++;
                    };
                };
                _local4++;
            };
            _local1.tHit.text = rootClass.coeffToPct(Number(((1 - rootClass.baseMiss) + _local3.$thi)));
            _local1.tHaste.text = rootClass.coeffToPct(_local3.$tha);
            _local1.tCrit.text = rootClass.coeffToPct(_local3.$tcr);
            _local1.tDodge.text = rootClass.coeffToPct(_local3.$tdo);
			/*
            if (rootClass.world.myAvatar.objData.Tonic != null){
                _local25 = world.getClass("Tonic");
                _local26 = MovieClip(new (_local25)());
                _local26.x = 220.3;
                _local26.y = 107;
                _local1.addChild(_local26);
                if (rootClass.world.myAvatar.objData.Tonic){
                    _local26.gotoAndStop("on");
                }
                else {
                    _local26.gotoAndStop("off");
                };
            }
            else {
                _local25 = world.getClass("Tonic");
                _local26 = MovieClip(new (_local25)());
                _local26.x = 220.3;
                _local26.y = 107;
                _local1.addChild(_local26);
                _local26.gotoAndStop("off");
            };
            if (rootClass.world.myAvatar.objData.Elixir != null){
                _local27 = world.getClass("Elixir");
                _local28 = MovieClip(new (_local27)());
                _local28.x = 277.6;
                _local28.y = 107;
                _local1.addChild(_local28);
                if (rootClass.world.myAvatar.objData.Elixir){
                    _local28.gotoAndStop("on");
                }
                else {
                    _local28.gotoAndStop("off");
                };
            }
            else {
                _local27 = world.getClass("Elixir");
                _local28 = MovieClip(new (_local27)());
                _local28.x = 277.6;
                _local28.y = 107;
                _local1.addChild(_local28);
                _local28.gotoAndStop("off");
            };
			*/
            _local1.tAP.text = String(_local3.$ap);
            _local1.tSP.text = String(_local3.$sp);
            var _local9:int = _local3.wDPS;
            var _local10:Number = 2;
            var _local11:Number = (_local9 * _local10);
            var _local12:Object = world.getAutoAttack();
            var _local13:Object = world.myAvatar.getEquippedItemBySlot("Weapon");
            var _local14:Number = ((((!((_local13 == null))) && (("iRng" in _local13)))) ? _local13.iRng : 0);
            _local14 = (_local14 / 100);
            _local11 = (_local11 * _local12.damage);
            var _local15:int = Math.floor((_local11 - (_local11 * _local14)));
            var _local16:int = Math.ceil((_local11 + (_local11 * _local14)));
            var _local17:* = (("<br><font color='#FFFFFF'>" + _local9) + " DPS");
            _local17 = (_local17 + ((((((" (<font color='#999999'>" + _local15) + "-") + _local16) + ", ") + rootClass.numToStr((_local12.cd / 1000), 1)) + " speed</font>)</font>"));
            _local1.tDmg.htmlText = _local17;
            _local4 = 0;
            while (_local4 < _local2.length) {
                updateSpendPeg(_local2[_local4]);
                _local7 = updateSpendBar(_local2[_local4]);
                _local4++;
            };
            _local1 = MovieClip(this).cnt2;
            _local3 = {};
            _local4 = 0;
            _local5 = 0;
            _local6 = "";
            _local1.tDesc.autoSize = "left";
            _local1.tMana.autoSize = "left";
            _local1.tClass.htmlText = (((uoData.strClassName + "  (Rank ") + uoData.iRank) + ")");
            _local1.tDesc.text = uoData.sClassDesc;
            _local1.tMana.text = "";
            for each (_local6 in uoData.aClassMRM) {
                if (_local6.charAt(0) == "-"){
                    _local1.tMana.text = (_local1.tMana.text + (" * " + _local6.substr(1)));
                }
                else {
                    _local1.tMana.text = (_local1.tMana.text + _local6);
                };
            };
            _local1.tManaHeader.y = Math.round(((_local1.tDesc.y + _local1.tDesc.height) + 5));
            _local1.tMana.y = Math.round(((_local1.tManaHeader.y + _local1.tManaHeader.height) + 2));
            _local4 = Math.round((_local1.tMana.y + _local1.tMana.height));
            //_local1.abilities.y = Math.round((_local4 + ((188 - _local4) / 2)));
			_local1.abilities.y = Math.round((_local4 + ((250 - _local4) / 2)));
            if (_local1.abilities.y > 250){
                _local1.abilities.y = 250;
            };
            var _local19:* = ["a1", "a2", "a3", "a4", "a5", "a6", "a7", "a8", "a9", "a10", "p1", "p2"];
			var Slots:* = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "p1", "p2"];
            _local4 = 0;
			var Slot2, oSlot, face;
            while (_local4 < _local19.length) {
                _local3 = _local19[_local4];
				Slot2 = Slots[_local4];
                _local18 = (_local1.abilities.getChildByName(_local3) as MovieClip);
                _local29 = rootClass.world.getActionbySlot(Slot2);
                if (_local29 == null){
                    _local18.visible = false;
                } else {
					if(_local29.slot != 0 ){
						_local18.visible = true;
						_local18.tQty.visible = false;
						//_local18.tSlot.text = Slot2;
						rootClass.updateIcons([_local18], _local29.icon.split(","), null);
						if (!_local29.isOK){
							_local18.alpha = 0.33;
						};
					} else {
						trace("UNUNSED");
						//_local4 = (_local1.abilities.SkillList.addChildAt(new ib3(), 0).name = "face");
					}
					trace(_local29.slot);
					if(_local29.slot != 0){
						_local18.actObj = _local29;
						_local18.addEventListener(MouseEvent.MOUSE_OVER, rootClass.actIconOver, false, 0, true);
						_local18.addEventListener(MouseEvent.MOUSE_OUT, rootClass.actIconOut, false, 0, true);
					};
                };
                _local4++;
            };
            var _local20:Graphics = _local1.abilities.bg.graphics;
            _local20.clear();
            _local20.lineStyle(0, 0, 0);
            var _local21:int;
            var _local22:int;
            var _local23:Number = 0x666666;
            var _local24 = "#FFFFFF";
            _local21 = 0;
            while (_local21 < 5) {
                _local22 = (_local21 * 51);
                _local23 = 0x666666;
                _local24 = "#FFFFFF";
                if (uoData.iRank < (_local21 + 1)){
                    _local23 = 0x242424;
                    _local24 = "#999999";
                    _local20.beginFill(_local23);
                    _local20.moveTo(_local22, 19);
                    _local20.lineTo((_local22 + 50), 19);
                    _local20.lineTo((_local22 + 50), 127);
                    _local20.lineTo(_local22, 127);
                    _local20.lineTo(_local22, 19);
                    _local20.endFill();
                };
                _local20.beginFill(_local23);
                _local20.moveTo(_local22, 0);
                _local20.lineTo((_local22 + 50), 0);
                _local20.lineTo((_local22 + 50), 18);
                _local20.lineTo(_local22, 18);
                _local20.lineTo(_local22, 0);
                _local20.endFill();
                _local20.beginFill(_local23);
                _local20.moveTo(_local22, 128);
                _local20.lineTo((_local22 + 50), 128);
                _local20.lineTo((_local22 + 50), 132);
                _local20.lineTo(_local22, 132);
                _local20.lineTo(_local22, 128);
                _local20.endFill();
                /*TextField(_local1.abilities.getChildByName(("tRank" + (_local21 + 1)))).htmlText = (((("<font color='" + _local24) + "'>") + TextField(_local1.abilities.getChildByName(("tRank" + (_local21 + 1)))).text) + "</font>");
				*/
				_local21++;
            };
        }

        private function getUnusedPts():int{
            var _local2:String;
            var _local1:int = pts;
            for (_local2 in stu) {
                if ((((_local2.indexOf("_") > -1)) && ((rootClass.stats.indexOf(_local2.substr(1)) > -1)))){
                    _local1 = (_local1 - (int(stu[_local2]) + int(stp[_local2])));
                };
            };
            return (0);
        }

        private function buildStu(){
            var _local4:String;
            var _local5:String;
            var _local1:Object = rootClass.getCategoryStats(uoData.sClassCat, uoLeaf.intLevel);
            var _local2 = "";
            var _local3:int;
            _local3 = 0;
            while (_local3 < rootClass.stats.length) {
                _local2 = rootClass.stats[_local3];
                stg[("^" + _local2)] = 0;
                stp[("_" + _local2)] = Math.floor(_local1[_local2]);
                stu[("_" + _local2)] = 0;
                _local3++;
            };
            for (_local4 in uoLeaf.tempSta) {
                if (_local4 != "innate"){
                    for (_local5 in uoLeaf.tempSta[_local4]) {
                        if (stg[("^" + _local5)] == null){
                            stg[("^" + _local5)] = 0;
                        };
                        stg[("^" + _local5)] = (stg[("^" + _local5)] + int(uoLeaf.tempSta[_local4][_local5]));
                    };
                };
            };
        }

        private function updateSpendPeg(_arg1:MovieClip):void{
            var _local5:int;
            var _local6:int;
            var _local7:Number;
            var _local8:ColorTransform;
            var _local2:String = _arg1.m;
            var _local3:int = stp[_arg1.a];
            var _local4:int = stg[("^" + _arg1.a.substr(1))];
            _local5 = (_local3 % barVal);
            _local6 = Math.floor((_local3 / barVal));
            if (_local6 == 0){
                if (!_arg1.bar.peg.visible){
                    _arg1.bar.peg.visible = true;
                };
            }
            else {
                if (_arg1.bar.peg.visible){
                    _arg1.bar.peg.visible = false;
                };
            };
            if (int(_arg1.t1.text) != _local3){
                _local8 = new ColorTransform();
                _arg1.t1.text = _local3;
                if (_local4 > 0){
                    if (_arg1.t2.text != ("+" + _local4)){
                        _arg1.t2.text = ("+" + _local4);
                    };
                }
                else {
                    if (_arg1.t2.text != ""){
                        _arg1.t2.text = "";
                    };
                };
                if (_local3 > 0){
                    if (_local2 == "left"){
                        _arg1.bar.peg.x = (_arg1.bar.peg.width - _local5);
                    }
                    else {
                        _arg1.bar.peg.x = (_local5 - _arg1.bar.peg.width);
                    };
                    if (_arg1.bar.peg.transform.colorTransform.color != spendStpC[_local6]){
                        _local8 = new ColorTransform();
                        _local8.color = spendStpC[_local6];
                        _arg1.bar.peg.transform.colorTransform = _local8;
                    };
                };
                if (_local6 > 0){
                    _local7 = spendStpC[(_local6 - 1)];
                }
                else {
                    _local7 = 0;
                };
                if (_arg1.bar.b2.transform.colorTransform.color != _local7){
                    _local8 = new ColorTransform();
                    _local8.color = _local7;
                    _arg1.bar.b2.transform.colorTransform = _local8;
                };
            };
        }

        private function updateSpendBar(_arg1:MovieClip):Boolean{
            var _local5:int;
            var _local6:int;
            var _local7:int;
            var _local8:Number;
            var _local10:ColorTransform;
            var _local2:String = _arg1.m;
            var _local3:int = stu[_arg1.a];
            var _local4:int = stp[_arg1.a];
            var _local9:Boolean;
            _local5 = ((_local3 + _local4) % barVal);
            _local6 = Math.floor(((_local3 + _local4) / barVal));
            _local7 = Math.floor((_local4 / barVal));
            if (_local3 == 0){
                if (_arg1.bar.b1.visible){
                    _arg1.bar.b1.visible = false;
                };
            }
            else {
                if (!_arg1.bar.b1.visible){
                    _arg1.bar.b1.visible = true;
                };
            };
            if (_local6 == 0){
                if (_local4 == 0){
                    if (_arg1.bar.peg.visible){
                        _arg1.bar.peg.visible = false;
                    };
                }
                else {
                    if (!_arg1.bar.peg.visible){
                        _arg1.bar.peg.visible = true;
                    };
                };
            }
            else {
                if (_arg1.bar.peg.visible){
                    _arg1.bar.peg.visible = false;
                };
            };
            if (int(_arg1.t1.text) != (_local3 + _local4)){
                _local10 = new ColorTransform();
                _arg1.t1.text = (_local3 + _local4);
                if (_local3 > 0){
                    _local9 = true;
                    if (_local2 == "left"){
                        _arg1.bar.b1.x = (_arg1.bar.b1.width - _local5);
                    }
                    else {
                        _arg1.bar.b1.x = (_local5 - _arg1.bar.b1.width);
                    };
                    if (_arg1.bar.b1.transform.colorTransform.color != spendStuC[_local6]){
                        _local10 = new ColorTransform();
                        _local10.color = spendStuC[_local6];
                        _arg1.bar.b1.transform.colorTransform = _local10;
                    };
                    if (_local6 > 0){
                        _local8 = spendStuC[(_local6 - 1)];
                    }
                    else {
                        if (_local7 > 0){
                            _local8 = spendStpC[(_local7 - 1)];
                        }
                        else {
                            _local8 = 0;
                        };
                    };
                }
                else {
                    if (_local7 > 0){
                        _local8 = spendStpC[(_local7 - 1)];
                    }
                    else {
                        _local8 = 0;
                    };
                };
                if (_arg1.bar.b2.transform.colorTransform.color != _local8){
                    _local10 = new ColorTransform();
                    _local10.color = _local8;
                    _arg1.bar.b2.transform.colorTransform = _local10;
                };
            };
            return (_local9);
        }

        private function spendPts():void{
            var _local1:int;
            var _local2:int;
            while (_local2 < spendVals.length) {
                if (spendTicks > spendVals[_local2].a){
                    _local1 = spendVals[_local2].b;
                };
                _local2++;
            };
            if (spendOp == "+"){
                if (upts > 0){
                    if (_local1 > upts){
                        _local1 = upts;
                    };
                    stu[spendStat] = (stu[spendStat] + _local1);
                };
            }
            else {
                if (stu[spendStat] > 0){
                    if (_local1 > stu[spendStat]){
                        _local1 = stu[spendStat];
                    };
                    stu[spendStat] = (stu[spendStat] - _local1);
                };
            };
        }

        private function spendBarClick(_arg1:MouseEvent):void{
            var _local2:MovieClip = MovieClip(_arg1.currentTarget);
            spendOp = "+";
            if (_local2.hitL.hitTestPoint(stage.mouseX, stage.mouseY)){
                if (_local2.name.indexOf("l") > -1){
                    spendOp = "-";
                };
                spendStat = _local2.a;
            }
            else {
                if (_local2.hitR.hitTestPoint(stage.mouseX, stage.mouseY)){
                    if (_local2.name.indexOf("r") > -1){
                        spendOp = "-";
                    };
                    spendStat = _local2.a;
                }
                else {
                    spendStat = "none";
                };
            };
            spendTicks = 0;
        }

        private function spendBarRelease(_arg1:MouseEvent):void{
            spendStat = "none";
            spendTicks = 0;
        }

        private function spendBarOver(_arg1:MouseEvent):void{
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            spendStat = "none";
            spendTicks = 0;
            _local2.gotoAndPlay("in");
        }

        private function spendBarOut(_arg1:MouseEvent):void{
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            spendStat = "none";
            spendTicks = 0;
            _local2.gotoAndPlay("out");
        }

        private function spendEF(_arg1:Event):void{
            if (spendStat != "none"){
                spendPts();
                spendTicks++;
                updateSpend();
            };
        }

        private function btnAcceptClick(_arg1:MouseEvent):void{
            var _local2:MovieClip = (_arg1.currentTarget as MovieClip);
            var _local3:Array = [int((stu._STR + stp._STR)), int((stu._DEX + stp._DEX)), int((stu._END + stp._END)), int((stu._INT + stp._INT)), int((stu._WIS + stp._WIS)), int((stu._LCK + stp._LCK))];
            if (world.coolDown("equipItem")){
                rootClass.sfc.sendXtMessage("zm", "statsSave", _local3, "str", rootClass.world.curRoom);
                _local2.visible = false;
            }
            else {
                rootClass.addSystemUpdate("Please allow time for requests to complete before submitting additional requests.");
            };
        }

        private function btnCloseClick(_arg1:MouseEvent):void{
            fClose();
        }

        private function onTTFieldMouseOver(_arg1:MouseEvent):void{
            var _local2:String = _arg1.currentTarget.name;
            var _local3 = "";
            switch (_local2){
                case "tPt1":
                    _local3 = "Number of stat points remaining to spend via the bars below.";
                    break;
                case "tPt2":
                    _local3 = "Total number of stat points currently available to your character.";
                    break;
                case "tAP":
                    _local3 = "<b>Attack Power</b> increases the effectiveness of your physical damage attacks.";
                    break;
                case "tSP":
                    _local3 = "<b>Magic Power</b> increases the effectiveness of your magical damage attacks.";
                    break;
                case "tDmg":
                    _local3 = "This is the damage you would expect to see on a normal melee hit, before any other modifiers.";
                    break;
                case "tHP":
                    _local3 = "Your total <b>Hit Points</b>.  When these reach zero, you will need to wait a short time before being able to continue playing.";
                    break;
                case "tHitTF":
                    _local3 = "<b>Hit chance</b> determines how likely you are to hit a target, before any other modifiers.";
                    break;
                case "tHasteTF":
                    _local3 = "<b>Haste</b> reduces the cooldown on all of your attacks and spells, including Auto Attack, by a certain percentage (hard capped at 50%).";
                    break;
                case "tCritTF":
                    _local3 = "<b>Critical Strike chance</b> increases the likelihood of dealing additional damage on a any attack.";
                    break;
                case "tDodgeTF":
                    _local3 = "<b>Evasion</b> chance allows you to completely avoid incoming damage.";
                    break;
                case "tSTR":
                case "sl1":
                    _local3 = "<b>Strength</b> increases Attack Power, which boosts physical damage. It also improves Critical Strike chance for melee classes.";
                    break;
                case "tINT":
                case "sl2":
                    _local3 = "<b>Intellect</b> increases Magic Power, which boosts magical damage. It also improves Haste for caster classes.";
                    break;
                case "tEND":
                case "sl3":
                    _local3 = "<b>Endurance</b> directly contributes to your total Hit Points.  While very useful for all classes, some abilities work best with very high or very low total HP.";
                    break;
                case "tDEX":
                case "sl4":
                    _local3 = "<b>Dexterity</b> is valuable to melee classes. It increases Haste, Hit chance, and Evasion chance. It increases only Evasion chance for caster classes.";
                    break;
                case "tWIS":
                case "sl5":
                    _local3 = "<b>Wisdom</b> is valuable to caster classes. It increases Hit chance, Crit chance, and Evasion chance. It improves only Evasion chance for melee classes.";
                    break;
                case "tLCK":
                case "sl6":
                    _local3 = "<b>Luck</b> offers a moderate overall improvement in combat, but is extremely valuable to those classes which specialize in games of chance.  It may also have effects outside of combat.";
                    break;
            };
            rootClass.ui.ToolTip.openWith({str:_local3});
        }

        public function onTTFieldMouseOut(_arg1:MouseEvent):void{
            rootClass.ui.ToolTip.close();
        }

        function frame1(){
            openWith(MovieClip(parent).fData);
        }

        function frame5(){
            update();
			StatPoints = parseInt(rootClass.world.myAvatar.objData.stats.StatPoints);
			statStrength = parseInt(rootClass.world.myAvatar.objData.stats.Strength);
			statIntellect = parseInt(rootClass.world.myAvatar.objData.stats.Intellect);
			statEndurance = parseInt(rootClass.world.myAvatar.objData.stats.Endurance);
			statDexterity = parseInt(rootClass.world.myAvatar.objData.stats.Dexterity);
			statWisdom = parseInt(rootClass.world.myAvatar.objData.stats.Wisdom);
			statLuck = parseInt(rootClass.world.myAvatar.objData.stats.Luck);
			OverAllStatPoints = parseInt(statStrength + statIntellect + statEndurance + statDexterity + statWisdom + statLuck);
			StatPointtoShow = parseInt(StatPoints - OverAllStatPoints);
			cnt.txtStatPoints.text = StatPointtoShow;
			cnt.sl1.t3.text = " + " + statStrength;
			cnt.sl2.t3.text = " + " + statIntellect;
			cnt.sl3.t3.text = " + " + statEndurance;
			cnt.sl4.t3.text = " + " + statDexterity;
			cnt.sl5.t3.text = " + " + statWisdom;
			cnt.sl6.t3.text = " + " + statLuck;
			
			cnt.btnSave.visible = false;
			
			cnt.btnStrengthUp.addEventListener(MouseEvent.CLICK, onStrengthUp, false, 0, true);
			cnt.btnStrengthDown.addEventListener(MouseEvent.CLICK, onStrengthDown, false, 0, true);
			cnt.btnIntellectUp.addEventListener(MouseEvent.CLICK, onIntellectUp, false, 0, true);
			cnt.btnIntellectDown.addEventListener(MouseEvent.CLICK, onIntellectDown, false, 0, true);
			cnt.btnEnduranceUp.addEventListener(MouseEvent.CLICK, onEnduranceUp, false, 0, true);
			cnt.btnEnduranceDown.addEventListener(MouseEvent.CLICK, onEnduranceDown, false, 0, true);
			cnt.btnDexterityUp.addEventListener(MouseEvent.CLICK, onDexterityUp, false, 0, true);
			cnt.btnDexterityDown.addEventListener(MouseEvent.CLICK, onDexterityDown, false, 0, true);
			cnt.btnWisdomUp.addEventListener(MouseEvent.CLICK, onWisdomUp, false, 0, true);
			cnt.btnWisdomDown.addEventListener(MouseEvent.CLICK, onWisdomDown, false, 0, true);
			cnt.btnLuckUp.addEventListener(MouseEvent.CLICK, onLuckUp, false, 0, true);
			cnt.btnLuckDown.addEventListener(MouseEvent.CLICK, onLuckDown, false, 0, true);
			cnt.btnSave.addEventListener(MouseEvent.CLICK, onSaveStats, false, 0, true);
			
			if(StatPointtoShow != 0){
				cnt.btnStrengthUp.visible = true;
				cnt.btnStrengthDown.visible = true;
				cnt.btnIntellectUp.visible = true;
				cnt.btnIntellectDown.visible = true;
				cnt.btnEnduranceUp.visible = true;
				cnt.btnEnduranceDown.visible = true;
				cnt.btnDexterityUp.visible = true;
				cnt.btnDexterityDown.visible = true;
				cnt.btnWisdomUp.visible = true;
				cnt.btnWisdomDown.visible = true;
				cnt.btnLuckUp.visible = true;
				cnt.btnLuckDown.visible = true;
			} else {
				cnt.btnStrengthUp.visible = false;
				cnt.btnStrengthDown.visible = false;
				cnt.btnIntellectUp.visible = false;
				cnt.btnIntellectDown.visible = false;
				cnt.btnEnduranceUp.visible = false;
				cnt.btnEnduranceDown.visible = false;
				cnt.btnDexterityUp.visible = false;
				cnt.btnDexterityDown.visible = false;
				cnt.btnWisdomUp.visible = false;
				cnt.btnWisdomDown.visible = false;
				cnt.btnLuckUp.visible = false;
				cnt.btnLuckDown.visible = false;
			};
			
        }

        function frame12(){
            stop();
        }

        function frame25(){
            playNextMode();
        }
		
		public function onSaveStats(_arg1:MouseEvent):void{
			rootClass.sfc.sendXtMessage("zm", "us", [StrengthUp, IntellectUp, EnduranceUp, DexterityUp, EnduranceUp, LuckUp], "str", 1);
		}

		public function onStrengthUp(_arg1:MouseEvent):void{
			if(StatPointtoShow != 0){
				cnt.btnSave.visible = true;
				StatPointtoShow -= 1;
				cnt.txtStatPoints.text = StatPointtoShow;
				StrengthUp++;
				TotalStrength = statStrength + StrengthUp;
				cnt.sl1.t3.text = " + " + TotalStrength; //StrengthUp
			}
		}
		
		public function onStrengthDown(_arg1:MouseEvent):void{
			if(StrengthUp != 0){
				StatPointtoShow += 1;
				cnt.txtStatPoints.text = StatPointtoShow;
				StrengthUp--;
				TotalStrength = statStrength + StrengthUp;
				cnt.sl1.t3.text = " + " + TotalStrength;
			}
		}
		
		public function onIntellectUp(_arg1:MouseEvent):void{
			if(StatPointtoShow != 0){
				cnt.btnSave.visible = true;
				StatPointtoShow -= 1;
				cnt.txtStatPoints.text = StatPointtoShow;
				IntellectUp++;
				TotalIntellect = statIntellect + IntellectUp;
				cnt.sl2.t3.text = " + " + TotalIntellect; //IntellectUp
			}
		}
		
		public function onIntellectDown(_arg1:MouseEvent):void{
			if(IntellectUp != 0){
				StatPointtoShow += 1;
				cnt.txtStatPoints.text = StatPointtoShow;
				IntellectUp--;
				TotalIntellect = statStrength + IntellectUp;
				cnt.sl2.t3.text = " + " + TotalIntellect;
			}
		}
		
		public function onEnduranceUp(_arg1:MouseEvent):void{
			if(StatPointtoShow != 0){
				cnt.btnSave.visible = true;
				StatPointtoShow -= 1;
				cnt.txtStatPoints.text = StatPointtoShow;
				EnduranceUp++;
				TotalEndurance = statEndurance + EnduranceUp;
				cnt.sl3.t3.text = " + " + TotalEndurance; //EnduranceUp
			}
		}
		
		public function onEnduranceDown(_arg1:MouseEvent):void{
			if(EnduranceUp != 0){
				StatPointtoShow += 1;
				cnt.txtStatPoints.text = StatPointtoShow;
				EnduranceUp--;
				TotalEndurance = statEndurance + EnduranceUp;
				cnt.sl3.t3.text = " + " + TotalEndurance;
			}
		}
		
		public function onDexterityUp(_arg1:MouseEvent):void{
			if(StatPointtoShow != 0){
				cnt.btnSave.visible = true;
				StatPointtoShow -= 1;
				cnt.txtStatPoints.text = StatPointtoShow;
				DexterityUp++;
				TotalDexterity = statDexterity + DexterityUp;
				cnt.sl4.t3.text = " + " + TotalDexterity; //DexterityUp
			}
		}
		
		public function onDexterityDown(_arg1:MouseEvent):void{
			if(DexterityUp != 0){
				StatPointtoShow += 1;
				cnt.txtStatPoints.text = StatPointtoShow;
				DexterityUp--;
				TotalDexterity = statDexterity + DexterityUp;
				cnt.sl4.t3.text = " + " + TotalDexterity;
			}
		}
		
		public function onWisdomUp(_arg1:MouseEvent):void{
			if(StatPointtoShow != 0){
				cnt.btnSave.visible = true;
				StatPointtoShow -= 1;
				cnt.txtStatPoints.text = StatPointtoShow;
				WisdomUp++;
				TotalWisdom = statWisdom + WisdomUp;
				cnt.sl5.t3.text = " + " + TotalWisdom; //WisdomUp
			}
		}
		
		public function onWisdomDown(_arg1:MouseEvent):void{
			if(WisdomUp != 0){
				StatPointtoShow += 1;
				cnt.txtStatPoints.text = StatPointtoShow;
				WisdomUp--;
				TotalWisdom = statWisdom + WisdomUp;
				cnt.sl5.t3.text = " + " + TotalWisdom;
			}
		}
		
		public function onLuckUp(_arg1:MouseEvent):void{
			if(StatPointtoShow != 0){
				cnt.btnSave.visible = true;
				StatPointtoShow -= 1;
				cnt.txtStatPoints.text = StatPointtoShow;
				LuckUp++;
				TotalLuck = statLuck + LuckUp;
				cnt.sl6.t3.text = " + " + TotalLuck; //WisdomUp
			}
		}
		
		public function onLuckDown(_arg1:MouseEvent):void{
			if(LuckUp != 0){
				StatPointtoShow += 1;
				cnt.txtStatPoints.text = StatPointtoShow;
				LuckUp--;
				TotalLuck = statLuck + LuckUp;
				cnt.sl6.t3.text = " + " + TotalLuck;
			}
		}

    }
}//package 

