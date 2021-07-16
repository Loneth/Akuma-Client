// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.mcSkel_657

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.net.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import flash.ui.*;
    import flash.external.*;
    import flash.accessibility.*;
    import flash.errors.*;

    public dynamic class mcSkel_657 extends MovieClip 
    {

        public var weaponTemp:MovieClip;
        public var frontfoot:MovieClip;
        public var arrow:MovieClip;
        public var weapon:MovieClip;
        public var fronthand:MovieClip;
        public var idlefoot:MovieClip;
        public var emoteFX:MovieClip;
        public var animLoop:int;
        public var backrobe:MovieClip;
        public var avtMC:MovieClip;
        public var frontshoulder:MovieClip;
        public var cape:MovieClip;
        public var chest:MovieClip;
        public var backhair:MovieClip;
        public var robe:MovieClip;
        public var hitbox:MovieClip;
        public var backshoulder:MovieClip;
        public var hip:MovieClip;
        public var frontthigh:MovieClip;
        public var backthigh:MovieClip;
        public var backshin:MovieClip;
        public var weaponOff:MovieClip;
        public var pvpFlag:MovieClip;
        public var vertigoMC:MovieClip;
        public var backfoot:MovieClip;
        public var backhand:MovieClip;
        public var head:MovieClip;
        public var frontshin:MovieClip;

        public function mcSkel_657()
        {
            addFrameScript(0, frame1, 7, frame8, 8, frame9, 16, frame17, 30, frame31, 31, frame32, 47, frame48, 48, frame49, 55, frame56, 61, frame62, 62, frame63, 79, frame80, 80, frame81, 93, frame94, 94, frame95, 107, frame108, 108, frame109, 116, frame117, 132, frame133, 142, frame143, 162, frame163, 163, frame164, 177, frame178, 186, frame187, 187, frame188, 221, frame222, 222, frame223, 238, frame239, 239, frame240, 248, frame249, 0x0101, frame258, 265, frame266, 266, frame267, 289, frame290, 290, frame291, 322, frame323, 323, frame324, 341, frame342, 343, frame344, 344, frame345, 369, frame370, 370, frame371, 434, frame435, 435, frame436, 452, frame453, 471, frame472, 479, frame480, 487, frame488, 488, frame489, 489, frame490, 535, frame536, 536, frame537, 543, frame544, 562, frame563, 563, frame564, 571, frame572, 572, frame573, 580, frame581, 593, frame594, 594, frame595, 605, frame606, 606, frame607, 625, frame626, 626, frame627, 655, frame656, 656, frame657, 684, frame685, 685, frame686, 712, frame713, 713, frame714, 730, frame731, 731, frame732, 752, frame753, 753, frame754, 759, frame760, 760, frame761, 789, frame790, 790, frame791, 813, frame814, 814, frame815, 817, frame818, 834, frame835, 835, frame836, 838, frame839, 861, frame862, 862, frame863, 865, frame866, 887, frame888, 888, frame889, 891, frame892, 905, frame906, 906, frame907, 917, frame918, 918, frame919, 937, frame938, 938, frame939, 950, frame951, 952, frame953, 953, frame954, 974, frame975, 975, frame976, 986, frame987, 987, frame988, 1000, frame1001, 1001, frame1002, 1015, frame1016, 1016, frame1017, 1025, frame1026, 1026, frame1027, 1039, frame1040, 1040, frame1041, 1054, frame1055, 1055, frame1056, 1066, frame1067, 1067, frame1068, 1082, frame1083, 1083, frame1084, 1095, frame1096, 1096, frame1097, 1107, frame1108, 1108, frame1109, 1125, frame1126, 1126, frame1127, 1132, frame1133, 1133, frame1134, 1145, frame1146, 1146, frame1147, 1162, frame1163, 1163, frame1164, 1174, frame1175, 1175, frame1176, 1176, frame1177, 1186, frame1187, 1198, frame1199, 1199, frame1200, 1218, frame1219, 1219, frame1220, 1227, frame1228, 1245, frame1246, 1246, frame1247, 1263, frame1264, 1264, frame1265, 1283, frame1284);
        }
        public function showIdleFoot()
        {
            frontfoot.visible = false;
            idlefoot.visible = true;
        }
        public function showFrontFoot()
        {
            idlefoot.visible = false;
            frontfoot.visible = true;
        }
        public function emoteLoop(_arg1:int, _arg2:Boolean=true):void
        {
            var _local3:int;
            _local3 = emoteLoopFrame();
            if (_local3 > 8){
                if (++animLoop < _arg1){
                    this.gotoAndPlay((_local3 + 1));
                    return;
                };
            };
            if (_arg2){
                this.gotoAndPlay("Idle");
            };
        }
        public function emoteLoopFrame():int
        {
            var _local1:int;
            _local1 = 0;
            while (_local1 < currentLabels.length) {
                if (currentLabels[_local1].name == currentLabel){
                    return (currentLabels[_local1].frame);
                };
                _local1++;
            };
            return (8);
        }
        function frame1()
        {
            animLoop = 0;
            avtMC = null;
            gotoAndPlay("Idle");
        }
        function frame8()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
            stop();
        }
        function frame9()
        {
            gotoAndStop("Idle");
        }
        function frame17()
        {
            showFrontFoot();
            cape.cape.gotoAndPlay("Move");
        }
        function frame31()
        {
            if (this.onMove){
                gotoAndPlay("Walk");
            };
        }
        function frame32()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame48()
        {
            gotoAndPlay("Dance");
        }
        function frame49()
        {
            animLoop = 0;
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame56()
        {
            emoteLoop(3, false);
        }
        function frame62()
        {
            stop();
        }
        function frame63()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame80()
        {
            stop();
        }
        function frame81()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame94()
        {
            gotoAndPlay("Use");
        }
        function frame95()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame108()
        {
            gotoAndPlay("Transmit");
        }
        function frame109()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame117()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame133()
        {
            emoteLoop(3, false);
        }
        function frame143()
        {
            MovieClip(parent).endAction();
        }
        function frame163()
        {
            MovieClip(parent).endAction();
        }
        function frame164()
        {
            animLoop = 0;
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame178()
        {
            emoteLoop(3, false);
        }
        function frame187()
        {
            MovieClip(parent).endAction();
        }
        function frame188()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
            stop();
        }
        function frame222()
        {
            MovieClip(parent).endAction();
        }
        function frame223()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame239()
        {
            gotoAndPlay("Airguitar");
        }
        function frame240()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame249()
        {
            showFrontFoot();
        }
        function frame258()
        {
            showIdleFoot();
        }
        function frame266()
        {
            MovieClip(parent).endAction();
        }
        function frame267()
        {
            showFrontFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame290()
        {
            stop();
        }
        function frame291()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame323()
        {
            if (this.onMove){
                gotoAndPlay("Walk");
            };
            stop();
        }
        function frame324()
        {
            showFrontFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame342()
        {
            showIdleFoot();
        }
        function frame344()
        {
            MovieClip(parent).endAction();
        }
        function frame345()
        {
            showFrontFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame370()
        {
            gotoAndPlay("Dance2");
        }
        function frame371()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame435()
        {
            gotoAndPlay("Swordplay");
        }
        function frame436()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame453()
        {
            showFrontFoot();
        }
        function frame472()
        {
            stop();
            showFrontFoot();
        }
        function frame480()
        {
            animLoop = 0;
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame488()
        {
            emoteLoop(3);
        }
        function frame489()
        {
            stop();
        }
        function frame490()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame536()
        {
            stop();
        }
        function frame537()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame544()
        {
            showFrontFoot();
        }
        function frame563()
        {
            stop();
        }
        function frame564()
        {
            animLoop = 0;
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame572()
        {
            emoteLoop(3);
        }
        function frame573()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame581()
        {
            weapon.visible = true;
        }
        function frame594()
        {
            stop();
        }
        function frame595()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame606()
        {
            stop();
        }
        function frame607()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame626()
        {
            MovieClip(parent).endAction();
        }
        function frame627()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame656()
        {
            MovieClip(parent).endAction();
        }
        function frame657()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame685()
        {
            MovieClip(parent).endAction();
        }
        function frame686()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame713()
        {
            MovieClip(parent).endAction();
        }
        function frame714()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame731()
        {
            MovieClip(parent).endAction();
        }
        function frame732()
        {
            showFrontFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame753()
        {
            stop();
        }
        function frame754()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame760()
        {
            MovieClip(parent).endAction();
        }
        function frame761()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame790()
        {
            MovieClip(parent).endAction();
        }
        function frame791()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame814()
        {
            MovieClip(parent).endAction();
        }
        function frame815()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame818()
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null);
        }
        function frame835()
        {
            MovieClip(parent).endAction();
        }
        function frame836()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame839()
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null);
        }
        function frame862()
        {
            MovieClip(parent).endAction();
        }
        function frame863()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame866()
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null);
        }
        function frame888()
        {
            MovieClip(parent).endAction();
        }
        function frame889()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame892()
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null);
        }
        function frame906()
        {
            MovieClip(parent).endAction();
        }
        function frame907()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame918()
        {
            stop();
        }
        function frame919()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame938()
        {
            MovieClip(parent).endAction();
        }
        function frame939()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame951()
        {
            stop();
        }
        function frame953()
        {
            MovieClip(parent).endAction();
        }
        function frame954()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame975()
        {
            MovieClip(parent).endAction();
        }
        function frame976()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame987()
        {
            stop();
        }
        function frame988()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1001()
        {
            MovieClip(parent).endAction();
        }
        function frame1002()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1016()
        {
            MovieClip(parent).endAction();
        }
        function frame1017()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1026()
        {
            stop();
        }
        function frame1027()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1040()
        {
            MovieClip(parent).endAction();
        }
        function frame1041()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1055()
        {
            MovieClip(parent).endAction();
        }
        function frame1056()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1067()
        {
            stop();
        }
        function frame1068()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1083()
        {
            MovieClip(parent).endAction();
        }
        function frame1084()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1096()
        {
            MovieClip(parent).endAction();
        }
        function frame1097()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1108()
        {
            stop();
        }
        function frame1109()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1126()
        {
            MovieClip(parent).endAction();
        }
        function frame1127()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1133()
        {
            stop();
        }
        function frame1134()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1146()
        {
            MovieClip(parent).endAction();
        }
        function frame1147()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1163()
        {
            MovieClip(parent).endAction();
        }
        function frame1164()
        {
            showFrontFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1175()
        {
            showIdleFoot();
        }
        function frame1176()
        {
            MovieClip(parent).endAction();
        }
        function frame1177()
        {
            showFrontFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1187()
        {
            showIdleFoot();
        }
        function frame1199()
        {
            MovieClip(parent).endAction();
        }
        function frame1200()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1219()
        {
            MovieClip(parent).endAction();
        }
        function frame1220()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1228()
        {
            showFrontFoot();
        }
        function frame1246()
        {
            stop();
        }
        function frame1247()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1264()
        {
            stop();
        }
        function frame1265()
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }
        function frame1284()
        {
            gotoAndPlay("Mining");
        }

    }
}//package Game_new_fla

