// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.mcCustomize_276_336

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import fl.controls.ColorPicker;
    import flash.display.SimpleButton;
    import flash.events.Event;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.net.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.media.*;
    import fl.events.*;
    import flash.filters.*;
    import flash.ui.*;
    import flash.external.*;
    import flash.accessibility.*;
    import flash.errors.*;

    public dynamic class mcCustomize_276_336 extends MovieClip 
    {

        public var txtCost:TextField;
        public var cpEye:ColorPicker;
        public var btnLeft:SimpleButton;
        public var submit:SimpleButton;
        public var cpHair:ColorPicker;
        public var btnClose:SimpleButton;
        public var bg:MovieClip;
        public var cpSkin:ColorPicker;
        public var btnRight:SimpleButton;
        public var HSMask:MovieClip;
        public var arrSkinHairColors:Array;
        public var backData:Object;
        public var arrEyeColors:Array;
        public var rootClass:MovieClip;
        public var HairStyle:Array;
        public var avt:Avatar;
        public var intHairStyleIndex:int;
        public var strCost:String;

        public function mcCustomize_276_336()
        {
            addFrameScript(0, frame1, 19, frame20, 35, frame36);
            __setProp_cpHair_mcCustomize_276_MaskedLayer28();
            __setProp_cpSkin_mcCustomize_276_MaskedLayer56();
            __setProp_cpEye_mcCustomize_276_MaskedLayer84();
        }
        public function onSaveClick(_arg1:Event)
        {
            if (((((((!((backData.HairID == avt.objData.HairID))) || (!((backData.intColorSkin == avt.objData.intColorSkin))))) || (!((backData.intColorHair == avt.objData.intColorHair))))) || (!((backData.intColorEye == avt.objData.intColorEye))))){
                rootClass.world.sendChangeColorRequest(avt.objData.intColorSkin, avt.objData.intColorHair, avt.objData.intColorEye, avt.objData.HairID);
            };
            MovieClip(Game.root).mixer.playSound("Click");
            gotoAndPlay("out");
        }
        public function nextHairStyle(_arg1:Event)
        {
            if (_arg1.currentTarget.name == "btnRight"){
                intHairStyleIndex = ((intHairStyleIndex + 1) % HairStyle.length);
            } else {
                if (_arg1.currentTarget.name == "btnLeft"){
                    intHairStyleIndex = (((intHairStyleIndex + HairStyle.length) - 1) % HairStyle.length);
                };
            };
            avt.objData.HairID = HairStyle[intHairStyleIndex].HairID;
            avt.objData.strHairName = HairStyle[intHairStyleIndex].sName;
            avt.objData.strHairFilename = HairStyle[intHairStyleIndex].sFile;
            strCost = HairStyle[intHairStyleIndex].iCost;
            if (HairStyle[intHairStyleIndex].bCoins == 1){
                strCost = (strCost + " 点数");
            } else {
                strCost = (strCost + " 金币");
            };
            txtCost.text = strCost;
            avt.pMC.loadHair();
        }
        public function onItemRollOut(_arg1:Event):void
        {
            avt.pMC.updateColor();
        }
        public function onCloseClick(_arg1:Event)
        {
            if (avt.objData.HairID != backData.HairID){
                avt.objData.HairID = backData.HairID;
                avt.objData.strHairName = backData.strHairName;
                avt.objData.strHairFilename = backData.strHairFilename;
                avt.pMC.loadHair();
            };
            avt.objData.intColorSkin = backData.intColorSkin;
            avt.objData.intColorHair = backData.intColorHair;
            avt.objData.intColorEye = backData.intColorEye;
            avt.pMC.updateColor();
            MovieClip(Game.root).mixer.playSound("Click");
            gotoAndPlay("out");
        }
        public function onItemRollOver(_arg1:Event):void
        {
            var _local2:*;
            _local2 = new Object();
            _local2.intColorSkin = avt.objData.intColorSkin;
            _local2.intColorHair = avt.objData.intColorHair;
            _local2.intColorEye = avt.objData.intColorEye;
            _local2.intColorBase = avt.objData.intColorBase;
            _local2.intColorTrim = avt.objData.intColorTrim;
            _local2.intColorAccessory = avt.objData.intColorAccessory;
            switch (_arg1.target.name){
                case "cpSkin":
                    _local2.intColorSkin = _arg1.target.selectedColor;
                    break;
                case "cpEye":
                    _local2.intColorEye = _arg1.target.selectedColor;
                    break;
                case "cpHair":
                    _local2.intColorHair = _arg1.target.selectedColor;
                    break;
            };
            avt.pMC.updateColor(_local2);
        }
        public function onColorSelect(_arg1:Event):void
        {
            switch (_arg1.target.name){
                case "cpSkin":
                    avt.objData.intColorSkin = _arg1.target.selectedColor;
                    break;
                case "cpEye":
                    avt.objData.intColorEye = _arg1.target.selectedColor;
                    break;
                case "cpHair":
                    avt.objData.intColorHair = _arg1.target.selectedColor;
                    break;
            };
            avt.pMC.updateColor();
        }
        function __setProp_cpHair_mcCustomize_276_MaskedLayer28()
        {
            try {
                cpHair["componentInspectorSetting"] = true;
            } catch(e:Error) {
            };
            cpHair.enabled = true;
            cpHair.selectedColor = 0;
            cpHair.showTextField = false;
            cpHair.visible = true;
            try {
                cpHair["componentInspectorSetting"] = false;
            } catch(e:Error) {
            };
        }
        function __setProp_cpSkin_mcCustomize_276_MaskedLayer56()
        {
            try {
                cpSkin["componentInspectorSetting"] = true;
            } catch(e:Error) {
            };
            cpSkin.enabled = true;
            cpSkin.selectedColor = 0;
            cpSkin.showTextField = false;
            cpSkin.visible = true;
            try {
                cpSkin["componentInspectorSetting"] = false;
            } catch(e:Error) {
            };
        }
        function __setProp_cpEye_mcCustomize_276_MaskedLayer84()
        {
            try {
                cpEye["componentInspectorSetting"] = true;
            } catch(e:Error) {
            };
            cpEye.enabled = true;
            cpEye.selectedColor = 0;
            cpEye.showTextField = false;
            cpEye.visible = true;
            try {
                cpEye["componentInspectorSetting"] = false;
            } catch(e:Error) {
            };
        }
        function frame1()
        {
            rootClass = MovieClip(stage.getChildAt(0));
            avt = rootClass.world.myAvatar;
            backData = new Object();
            backData.HairID = avt.objData.HairID;
            backData.strHairName = avt.objData.strHairName;
            backData.strHairFilename = avt.objData.strHairFilename;
            backData.intColorSkin = avt.objData.intColorSkin;
            backData.intColorHair = avt.objData.intColorHair;
            backData.intColorEye = avt.objData.intColorEye;
            btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
            submit.addEventListener(MouseEvent.CLICK, onSaveClick, false, 0, true);
            HairStyle = rootClass.world.hairshopinfo.hair;
            intHairStyleIndex = -1;
            btnLeft.addEventListener(MouseEvent.CLICK, nextHairStyle, false, 0, true);
            btnRight.addEventListener(MouseEvent.CLICK, nextHairStyle, false, 0, true);
            arrSkinHairColors = [65793, 0xFFFFFF, 12767958, 9673634, 8556972, 5398908, 4478310, 2500663, 3422539, 4541285, 6182021, 3618922, 2102889, 8476790, 9319279, 4928583, 14188924, 2436920, 6593232, 4817850, 3366536, 3559294, 1977414, 9622526, 10074585, 13557484, 5220272, 7715142, 5674563, 5668932, 4808462, 4020272, 3560001, 4421735, 5405282, 3433818, 3033928, 3753268, 14019773, 10540396, 0xFFCC00, 14922046, 11509315, 11040791, 13597462, 14515004, 10900510, 16777164, 16777113, 16509316, 13026702, 8488053, 0x990000, 0x660000, 4786437, 15230291, 13382701, 12927265, 10234126, 10053171, 7753511, 9322016, 7746331, 8601921, 6041135, 4465190, 13088131, 9602663, 8218929, 15388042, 14658389, 15982797, 15121555, 14460011, 14121559, 13001261, 3157797, 13092792, 5197887, 7497554, 4008995, 6178103, 8542790, 7027237, 3678742, 5977124, 9265949, 5127967];
            arrEyeColors = [65793, 0xFFFFFF, 10000828, 8556972, 5398908, 0xFFFF, 3381657, 10074585, 4817850, 3366536, 3559294, 26367, 2635172, 91294, 2500663, 1977414, 0xFFFF00, 16777062, 14922046, 11040791, 0xFF9900, 0xFFCC00, 0xFF00, 39219, 7065902, 5674563, 4808462, 3753268, 0xFF0000, 0x990000, 8601921, 6041135, 4465190, 11046487, 4536088, 10053171, 7753511, 9322016, 7746331, 0x993300, 0x660000, 16724940, 10432464, 4925009, 0x6600CC];
            cpSkin.addEventListener(Event.CHANGE, onColorSelect, false, 0, true);
            cpEye.addEventListener(Event.CHANGE, onColorSelect, false, 0, true);
            cpHair.addEventListener(Event.CHANGE, onColorSelect, false, 0, true);
            cpSkin.addEventListener(ColorPickerEvent.ITEM_ROLL_OVER, onItemRollOver, false, 0, true);
            cpEye.addEventListener(ColorPickerEvent.ITEM_ROLL_OVER, onItemRollOver, false, 0, true);
            cpHair.addEventListener(ColorPickerEvent.ITEM_ROLL_OVER, onItemRollOver, false, 0, true);
            cpSkin.addEventListener(ColorPickerEvent.ITEM_ROLL_OUT, onItemRollOut, false, 0, true);
            cpEye.addEventListener(ColorPickerEvent.ITEM_ROLL_OUT, onItemRollOut, false, 0, true);
            cpHair.addEventListener(ColorPickerEvent.ITEM_ROLL_OUT, onItemRollOut, false, 0, true);
            cpSkin.colors = arrSkinHairColors;
            cpSkin.selectedColor = avt.objData.intColorSkin;
            cpSkin.setStyle("columnCount", 10);
            cpHair.colors = arrSkinHairColors;
            cpHair.selectedColor = avt.objData.intColorHair;
            cpHair.setStyle("columnCount", 10);
            cpEye.colors = arrEyeColors;
            cpEye.selectedColor = avt.objData.intColorEye;
            cpEye.setStyle("columnCount", 10);
            txtCost.mask = HSMask;
        }
        function frame20()
        {
            stop();
        }
        function frame36()
        {
            MovieClip(parent).gotoAndPlay("init");
        }

    }
}//package Game_new_fla

