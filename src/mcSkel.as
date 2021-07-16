// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//mcSkel

package {
    import flash.display.MovieClip;
    import flash.geom.Point;

    public class mcSkel extends MovieClip {

        public var idlefoot:MovieClip;
        public var chest:MovieClip;
		public var AuraFX:MovieClip;
        public var weaponOff:MovieClip;
        public var frontthigh:MovieClip;
        public var cape:MovieClip;
        public var frontshoulder:MovieClip;
        public var weaponFistOff:MovieClip;
        public var hitbox:MovieClip;
        public var head:MovieClip;
        public var backshoulder:MovieClip;
        public var hip:MovieClip;
        public var backthigh:MovieClip;
        public var backhair:MovieClip;
        public var weaponFist:MovieClip;
        public var backshin:MovieClip;
        public var weaponTemp:MovieClip;
        public var robe:MovieClip;
        public var pvpFlag:MovieClip;
		public var vertigoMC:MovieClip;
		public var blindMC:MovieClip;
		public var hexMC:MovieClip;
		public var silenceMC:MovieClip;
        public var weapon:MovieClip;
		public var necklace:MovieClip;
        public var frontshin:MovieClip;
        public var backfoot:MovieClip;
        public var backrobe:MovieClip;
        public var arrow:MovieClip;
        public var emoteFX:MovieClip;
        public var shield:MovieClip;
        public var frontfoot:MovieClip;
        public var backhand:MovieClip;
        public var fronthand:MovieClip;
        public var animLoop:int;
        public var avtMC:MovieClip;
        public var projClass:Class;
        public var projMC:MovieClip;
        public var sp:Point;
        public var ep:Point;
        public var onMove:Boolean = false;

        public function mcSkel(){
            addFrameScript(0, this.frame1, 7, this.frame8, 8, this.frame9, 16, this.frame17, 20, this.frame21, 29, this.frame30, 43, this.frame44, 44, this.frame45, 60, this.frame61, 61, this.frame62, 68, this.frame69, 74, this.frame75, 75, this.frame76, 92, this.frame93, 93, this.frame94, 106, this.frame107, 107, this.frame108, 131, this.frame132, 141, this.frame142, 142, this.frame143, 161, this.frame162, 162, this.frame163, 176, this.frame177, 185, this.frame186, 186, this.frame187, 220, this.frame221, 221, this.frame222, 237, this.frame238, 238, this.frame239, 247, this.frame248, 0x0100, this.frame257, 264, this.frame265, 265, this.frame266, 285, this.frame286, 288, this.frame289, 289, this.frame290, 321, this.frame322, 322, this.frame323, 340, this.frame341, 342, this.frame343, 343, this.frame344, 368, this.frame369, 369, this.frame370, 433, this.frame434, 434, this.frame435, 451, this.frame452, 470, this.frame471, 478, this.frame479, 486, this.frame487, 487, this.frame488, 488, this.frame489, 534, this.frame535, 535, this.frame536, 565, this.frame566, 566, this.frame567, 574, this.frame575, 575, this.frame576, 583, this.frame584, 596, this.frame597, 597, this.frame598, 608, this.frame609, 609, this.frame610, 628, this.frame629, 629, this.frame630, 658, this.frame659, 659, this.frame660, 687, this.frame688, 688, this.frame689, 715, this.frame716, 716, this.frame717, 733, this.frame734, 734, this.frame735, 755, this.frame756, 756, this.frame757, 762, this.frame763, 763, this.frame764, 792, this.frame793, 793, this.frame794, 816, this.frame817, 817, this.frame818, 820, this.frame821, 837, this.frame838, 838, this.frame839, 841, this.frame842, 864, this.frame865, 865, this.frame866, 868, this.frame869, 890, this.frame891, 891, this.frame892, 894, this.frame895, 908, this.frame909, 909, this.frame910, 920, this.frame921, 921, this.frame922, 940, this.frame941, 941, this.frame942, 955, this.frame956, 956, this.frame957, 977, this.frame978, 978, this.frame979, 989, this.frame990, 990, this.frame991, 1003, this.frame1004, 1004, this.frame1005, 1018, this.frame1019, 1019, this.frame1020, 1029, this.frame1030, 1042, this.frame1043, 1043, this.frame1044, 1057, this.frame1058, 1058, this.frame1059, 1069, this.frame1070, 1070, this.frame1071, 1085, this.frame1086, 1086, this.frame1087, 1098, this.frame1099, 1099, this.frame1100, 1110, this.frame1111, 1111, this.frame1112, 1113, this.frame1114, 1114, this.frame1115, 1128, this.frame1129, 1129, this.frame1130, 1135, this.frame1136, 1136, this.frame1137, 1148, this.frame1149, 1149, this.frame1150, 1165, this.frame1166, 1166, this.frame1167, 1177, this.frame1178, 1178, this.frame1179, 1179, this.frame1180, 1189, this.frame1190, 1201, this.frame1202, 1202, this.frame1203, 1221, this.frame1222, 1222, this.frame1223, 1236, this.frame1237, 1237, this.frame1238, 1252, this.frame1253, 1253, this.frame1254, 1286, this.frame1287, 1287, this.frame1288, 1324, this.frame1325, 1325, this.frame1326, 1333, this.frame1334, 1334, this.frame1335, 1406, this.frame1407, 1407, this.frame1408, 1444, this.frame1445, 1445, this.frame1446, 1460, this.frame1461, 1461, this.frame1462, 1470, this.frame1471, 1471, this.frame1472, 1502, this.frame1503, 1503, this.frame1504, 1506, this.frame1507, 1529, this.frame1530, 1530, this.frame1531, 1533, this.frame1534, 1555, this.frame1556, 1556, this.frame1557, 1572, this.frame1573, 1573, this.frame1574, 1586, this.frame1587, 1587, this.frame1588, 1606, this.frame1607, 1607, this.frame1608, 1648, this.frame1649, 1649, this.frame1650, 1658, this.frame1659, 1672, this.frame1673, 1673, this.frame1674, 1690, this.frame1691, 1710, this.frame1711, 1724, this.frame1725, 1753, this.frame1754, 1803, this.frame1804, 1804, this.frame1805, 1847, this.frame1848, 1848, this.frame1849, 1865, this.frame1866, 1866, this.frame1867, 1874 , this.frame1875, 1888, this.frame1889, 1899, this.frame1900, 1908, this.frame1909, 1909, this.frame1910, 1924, this.frame1925, 1925, this.frame1926, 1939, this.frame1940, 1949, this.frame1950, 1950, this.frame1951, 1974, this.frame1975);
        }

        public function emoteLoopFrame():int{
            var _local1:int;
            while (_local1 < currentLabels.length) {
                if (currentLabels[_local1].name == currentLabel){
                    return (currentLabels[_local1].frame);
                };
                _local1++;
            };
            return (8);
        }

        public function emoteLoop(_arg1:int, _arg2:Boolean=true):void{
            var _local3:int = this.emoteLoopFrame();
            if (_local3 > 8){
                if (++this.animLoop < _arg1){
                    this.gotoAndPlay((_local3 + 1));
                    return;
                };
            };
            if (_arg2){
                this.gotoAndPlay("Idle");
            };
        }

        public function showIdleFoot(){
            this.frontfoot.visible = false;
            this.idlefoot.visible = true;
        }

        public function showFrontFoot(){
            this.idlefoot.visible = false;
            this.frontfoot.visible = true;
        }

        override public function gotoAndPlay(_arg1:Object, _arg2:String=null):void{
            this.handleAnimEvent(String(_arg1));
            super.gotoAndPlay(_arg1);
        }

        private function handleAnimEvent(_arg1:String):void{
            var _local3:Function;
            var _local2:Object = MovieClip(parent).AnimEvent;
            if (_local2[_arg1] == null){
                return;
            };
            var _local4:uint;
            while (_local4 < _local2[_arg1].length) {
                _local3 = _local2[_arg1][_local4];
                (_local3());
                _local4++;
            };
        }

        function frame1(){
            this.animLoop = 0;
            this.avtMC = null;
            this.gotoAndPlay("Idle");
        }

        function frame8(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
            stop();
        }

        function frame9(){
            gotoAndStop("Idle");
        }

        function frame17(){
            this.showFrontFoot();
            this.cape.cape.gotoAndPlay("Move");
        }

        function frame21(){
            if (this.onMove){
                this.gotoAndPlay("mountWalk");
            };
        }

        function frame30(){
            this.showFrontFoot();
            this.cape.cape.gotoAndPlay("Move");
        }

        function frame44(){
            if (this.onMove){
                this.gotoAndPlay("Walk");
            };
        }

        function frame45(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame61(){
            this.gotoAndPlay("Dance");
        }

        function frame62(){
            this.animLoop = 0;
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame69(){
            this.emoteLoop(3, false);
        }

        function frame75(){
            stop();
        }

        function frame76(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame93(){
            stop();
        }

        function frame94(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame107(){
            this.gotoAndPlay("Use");
        }

        function frame108(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame132(){
            this.emoteLoop(3, false);
        }

        function frame142(){
            MovieClip(parent).endAction();
        }

        function frame143(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame162(){
            MovieClip(parent).endAction();
        }

        function frame163(){
            this.animLoop = 0;
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame177(){
            this.emoteLoop(3, false);
        }

        function frame186(){
            MovieClip(parent).endAction();
        }

        function frame187(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame221(){
            MovieClip(parent).endAction();
        }

        function frame222(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame238(){
            this.gotoAndPlay("Airguitar");
        }

        function frame239(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame248(){
            this.showFrontFoot();
        }

        function frame257(){
            this.showIdleFoot();
        }

        function frame265(){
            MovieClip(parent).endAction();
        }

        function frame266(){
            this.showFrontFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame286(){
            if (this.scaleX < 0){
                this.emoteFX.scaleX = (this.emoteFX.scaleX * -1);
            };
        }

        function frame289(){
            stop();
        }

        function frame290(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame322(){
            if (this.onMove){
                this.gotoAndPlay("Walk");
            };
            stop();
        }

        function frame323(){
            this.showFrontFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame341(){
            this.showIdleFoot();
        }

        function frame343(){
            MovieClip(parent).endAction();
        }

        function frame344(){
            this.showFrontFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame369(){
            this.gotoAndPlay("Dance2");
        }

        function frame370(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame434(){
            this.gotoAndPlay("Swordplay");
        }

        function frame435(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame452(){
            this.showFrontFoot();
        }

        function frame471(){
            stop();
        }

        function frame479(){
            this.animLoop = 0;
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame487(){
            this.emoteLoop(3);
        }

        function frame488(){
            stop();
        }

        function frame489(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame535(){
            stop();
        }

        function frame536(){
            this.showFrontFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame566(){
            stop();
        }

        function frame567(){
            this.animLoop = 0;
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame575(){
            this.emoteLoop(3);
        }

        function frame576(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame584(){
            this.weapon.visible = true;
        }

        function frame597(){
            stop();
        }

        function frame598(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame609(){
            stop();
        }

        function frame610(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame629(){
            MovieClip(parent).endAction();
        }

        function frame630(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame659(){
            MovieClip(parent).endAction();
        }

        function frame660(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame688(){
            MovieClip(parent).endAction();
        }

        function frame689(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame716(){
            MovieClip(parent).endAction();
        }

        function frame717(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame734(){
            MovieClip(parent).endAction();
        }

        function frame735(){
            this.showFrontFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame756(){
            stop();
        }

        function frame757(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame763(){
            MovieClip(parent).endAction();
        }

        function frame764(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame793(){
            MovieClip(parent).endAction();
        }

        function frame794(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame817(){
            MovieClip(parent).endAction();
        }

        function frame818(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame821(){
            this.avtMC = MovieClip(parent);
            MovieClip(this.avtMC.parent.parent).castSpellFX(this.avtMC.pAV, this.avtMC.spFX, null, this.avtMC.spellDur);
            this.avtMC.spellDur = 0;
        }

        function frame838(){
            MovieClip(parent).endAction();
        }

        function frame839(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame842(){
            this.avtMC = MovieClip(parent);
            MovieClip(this.avtMC.parent.parent).castSpellFX(this.avtMC.pAV, this.avtMC.spFX, null, this.avtMC.spellDur);
            this.avtMC.spellDur = 0;
        }

        function frame865(){
            MovieClip(parent).endAction();
        }

        function frame866(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame869(){
            this.avtMC = MovieClip(parent);
            MovieClip(this.avtMC.parent.parent).castSpellFX(this.avtMC.pAV, this.avtMC.spFX, null, this.avtMC.spellDur);
            this.avtMC.spellDur = 0;
        }

        function frame891(){
            MovieClip(parent).endAction();
        }

        function frame892(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame895(){
            this.avtMC = MovieClip(parent);
            MovieClip(this.avtMC.parent.parent).castSpellFX(this.avtMC.pAV, this.avtMC.spFX, null, this.avtMC.spellDur);
            this.avtMC.spellDur = 0;
        }

        function frame909(){
            MovieClip(parent).endAction();
        }

        function frame910(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame921(){
            stop();
        }

        function frame922(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame941(){
            MovieClip(parent).endAction();
        }

        function frame942(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame956(){
            MovieClip(parent).endAction();
        }

        function frame957(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame978(){
            MovieClip(parent).endAction();
        }

        function frame979(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame990(){
            stop();
        }

        function frame991(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1004(){
            MovieClip(parent).endAction();
        }

        function frame1005(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1019(){
            MovieClip(parent).endAction();
        }

        function frame1020(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1030(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1043(){
            MovieClip(parent).endAction();
        }

        function frame1044(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1058(){
            MovieClip(parent).endAction();
        }

        function frame1059(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1070(){
            stop();
        }

        function frame1071(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1086(){
            MovieClip(parent).endAction();
        }

        function frame1087(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1099(){
            MovieClip(parent).endAction();
        }

        function frame1100(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1111(){
            stop();
        }

        function frame1112(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
            this.avtMC = MovieClip(parent);
        }

        function frame1114(){
            if ((((((this.avtMC.spFX.strl == null)) || ((this.avtMC.spFX.strl == "")))) || ((this.avtMC.spFX.avts == null)))){
                trace("creating projectile");
                if (this.avtMC.pAV.strProj != ""){
                    trace((("strProj:" + this.avtMC.pAV.strProj) + ":end"));
                    try {
                        this.projClass = (this.avtMC.pAV.rootClass.world.getClass(this.avtMC.pAV.strProj) as Class);
                    }
                    catch(e) {
                    };
                };
                trace(("projClass: " + this.projClass));
                if (this.projClass == null){
                    this.projClass = (this.avtMC.pAV.rootClass.world.getClass("p_ar") as Class);
                };
                this.projMC = (new this.projClass() as MovieClip);
                this.projMC.scaleX = (this.projMC.scaleX * 0.3);
                this.projMC.scaleY = (this.projMC.scaleY * 0.3);
                this.sp = this.backhand.localToGlobal(new Point(this.backhand.x, this.backhand.y));
                this.projMC.x = this.sp.x;
                this.projMC.y = this.sp.y;
                this.ep = new Point(this.avtMC.pAV.target.pMC.x, this.avtMC.pAV.target.pMC.y);
                this.ep.y = (this.ep.y - (this.avtMC.pAV.target.pMC.height / 3.5));
                this.avtMC.pAV.rootClass.world.addChild(this.projMC);
                this.avtMC.projClass = new Projectile(this.sp, this.ep, this.projMC, this.avtMC.pAV.rootClass);
                this.projClass = null;
            };
        }

        function frame1115(){
            if (((((!((this.avtMC.spFX.strl == null))) && (!((this.avtMC.spFX.strl == ""))))) && (!((this.avtMC.spFX.avts == null))))){
                MovieClip(this.avtMC.parent.parent).castSpellFX(this.avtMC.pAV, this.avtMC.spFX, null);
            };
        }

        function frame1129(){
            MovieClip(parent).endAction();
        }

        function frame1130(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1136(){
            stop();
        }

        function frame1137(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1149(){
            MovieClip(parent).endAction();
        }

        function frame1150(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1166(){
            MovieClip(parent).endAction();
        }

        function frame1167(){
            this.showFrontFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1178(){
            this.showIdleFoot();
        }

        function frame1179(){
            MovieClip(parent).endAction();
        }

        function frame1180(){
            this.showFrontFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1190(){
            this.showIdleFoot();
        }

        function frame1202(){
            MovieClip(parent).endAction();
        }

        function frame1203(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1222(){
            MovieClip(parent).endAction();
        }

        function frame1223(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1237(){
            stop();
        }

        function frame1238(){
            this.showFrontFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1253(){
            stop();
        }

        function frame1254(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1287(){
            MovieClip(parent).endAction();
        }

        function frame1288(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1325(){
            MovieClip(parent).endAction();
        }

        function frame1326(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1334(){
            this.gotoAndPlay("Cry2");
        }

        function frame1335(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1407(){
            this.gotoAndPlay("Spar");
        }

        function frame1408(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1445(){
            this.gotoAndPlay("Samba");
        }

        function frame1446(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1461(){
            this.gotoAndPlay("Stepdance");
        }

        function frame1462(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1471(){
            this.gotoAndPlay("Headbang");
        }

        function frame1472(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1503(){
            this.gotoAndPlay("Dazed");
        }

        function frame1504(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1507(){
            this.avtMC = MovieClip(parent);
            MovieClip(this.avtMC.parent.parent).castSpellFX(this.avtMC.pAV, this.avtMC.spFX, null);
        }

        function frame1530(){
            MovieClip(parent).endAction();
        }

        function frame1531(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1534(){
            this.avtMC = MovieClip(parent);
            MovieClip(this.avtMC.parent.parent).castSpellFX(this.avtMC.pAV, this.avtMC.spFX, null);
        }

        function frame1556(){
            MovieClip(parent).endAction();
        }

        function frame1557(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1573(){
            this.gotoAndPlay("Danceweapon");
        }

        function frame1574(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1587(){
            this.gotoAndPlay("Useweapon");
        }

        function frame1588(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1607(){
            MovieClip(parent).endAction();
        }

        function frame1608(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1649(){
            MovieClip(parent).endAction();
        }

        function frame1650(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
            MovieClip(parent).playSound();
        }

        function frame1659(){
            gotoAndStop("Idle");
        }
		
		function frame1673(){
            gotoAndPlay("Casting");
        }
		
		function frame1674(){
            this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
        }

        function frame1691(){
            stop();
        }
		
		function frame1711(){
            gotoAndPlay("Mining");
        }
		
		function frame1725(){
            gotoAndPlay("Hex");
        }
		
		function frame1726(){
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
		}
		
		function frame1754(){
            MovieClip(parent).endAction();
        }
		
		function frame1755(){
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
		}

		function frame1804(){
            MovieClip(parent).endAction();
        }
		
		function frame1805(){
			showIdleFoot();
			cape.cape.gotoAndStop("Idle");
        }
		
        function frame1848(){
			gotoAndPlay("Headscratch");
        }
		
		function frame1849(){
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
		}
		
		function frame1866(){
            stop();
        }
		
		function frame1867(){
			showIdleFoot();
            cape.cape.gotoAndStop("Idle");
		}
		
		function frame1875(){
			this.avtMC = MovieClip(parent);
            MovieClip(this.avtMC.parent.parent).castSpellFX(this.avtMC.pAV, this.avtMC.spFX, null);
		}
		
		function frame1889(){
			gotoAndStop("Idle");
		}
		
		function frame1900(){
			showIdleFoot();
            cape.cape.gotoAndStop("Idle");
		}
		
		function frame1909(){
			stop();
		}
		
		function frame1910(){
			showIdleFoot();
            cape.cape.gotoAndStop("Idle");
		}
		
		function frame1925(){
			gotoAndStop("Idle");
		}
		
		function frame1926(){
			showIdleFoot();
            cape.cape.gotoAndStop("Idle");
		}
		
		function frame1940(){
			gotoAndStop("Idle");
		}
		
		function frame1941(){
			this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
		}
		
		function frame1950(){
			stop();
		}
		
		function frame1951(){
			this.showIdleFoot();
            this.cape.cape.gotoAndStop("Idle");
		}
		
		function frame1975(){
			gotoAndStop("Idle");
		}
    }
}//package 

