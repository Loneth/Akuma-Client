// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.mcCustomizeArmor_293_353

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import fl.controls.ColorPicker;
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

    public dynamic class mcCustomizeArmor_293_353 extends MovieClip 
    {

        public var submit:SimpleButton;
        public var btnClose:SimpleButton;
        public var cpTrim:ColorPicker;
        public var cpAccessory:ColorPicker;
        public var cpBase:ColorPicker;
        public var bg:MovieClip;
        public var backData:Object;
        public var arrColors:Array;
        public var arrAccessoryColors:Array;
        public var rootClass:MovieClip;
        public var avt:Avatar;

        public function mcCustomizeArmor_293_353()
        {
            addFrameScript(0, frame1, 19, frame20, 35, frame36);
        }
        public function onSaveClick(_arg1:Event)
        {
            if (((((!((backData.intColorBase == avt.objData.intColorBase))) || (!((backData.intColorTrim == avt.objData.intColorTrim))))) || (!((backData.intColorAccessory == avt.objData.intColorAccessory))))){
                rootClass.world.sendChangeArmorColorRequest(avt.objData.intColorBase, avt.objData.intColorTrim, avt.objData.intColorAccessory);
            };
            MovieClip(Game.root).mixer.playSound("Click");
            gotoAndPlay("out");
        }
        public function onItemRollOut(_arg1:Event):void
        {
            avt.pMC.updateColor();
        }
        public function onCloseClick(_arg1:Event)
        {
            if (((((!((backData.intColorBase == avt.objData.intColorBase))) || (!((backData.intColorTrim == avt.objData.intColorTrim))))) || (!((backData.intColorAccessory == avt.objData.intColorAccessory))))){
                avt.objData.intColorBase = backData.intColorBase;
                avt.objData.intColorTrim = backData.intColorTrim;
                avt.objData.intColorAccessory = backData.intColorAccessory;
                avt.pMC.updateColor();
            };
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
                case "cpBase":
                    _local2.intColorBase = _arg1.target.selectedColor;
                    break;
                case "cpTrim":
                    _local2.intColorTrim = _arg1.target.selectedColor;
                    break;
                case "cpAccessory":
                    _local2.intColorAccessory = _arg1.target.selectedColor;
                    break;
            };
            avt.pMC.updateColor(_local2);
        }
        public function onColorSelect(_arg1:Event):void
        {
            switch (_arg1.target.name){
                case "cpBase":
                    avt.objData.intColorBase = _arg1.target.selectedColor;
                    break;
                case "cpTrim":
                    avt.objData.intColorTrim = _arg1.target.selectedColor;
                    break;
                case "cpAccessory":
                    avt.objData.intColorAccessory = _arg1.target.selectedColor;
                    break;
            };
            avt.pMC.updateColor();
        }
        function frame1()
        {
            rootClass = MovieClip(stage.getChildAt(0));
            avt = rootClass.world.myAvatar;
            backData = new Object();
            backData.intColorBase = avt.objData.intColorBase;
            backData.intColorTrim = avt.objData.intColorTrim;
            backData.intColorAccessory = avt.objData.intColorAccessory;
            btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
            submit.addEventListener(MouseEvent.CLICK, onSaveClick, false, 0, true);
            arrColors = [65793, 0xFFFFFF, 12767958, 9673634, 8556972, 5398908, 4478310, 2500663, 3422539, 4541285, 6182021, 3618922, 2102889, 8476790, 9319279, 4928583, 14188924, 2436920, 6593232, 4817850, 3366536, 3559294, 1977414, 9622526, 10074585, 13557484, 5220272, 7715142, 5674563, 5668932, 4808462, 4020272, 3560001, 4421735, 5405282, 3433818, 3033928, 3753268, 14019773, 10540396, 0xFFCC00, 14922046, 11509315, 11040791, 13597462, 14515004, 10900510, 16777164, 16777113, 16509316, 13026702, 8488053, 0x990000, 0x660000, 4786437, 15230291, 13382701, 12927265, 10234126, 10053171, 7753511, 9322016, 7746331, 8601921, 6041135, 4465190, 13088131, 9602663, 8218929, 15388042, 14658389, 15982797, 15121555, 14460011, 14121559, 13001261, 3157797, 13092792, 5197887, 7497554, 4008995, 6178103, 8542790, 7027237, 3678742, 5977124, 9265949, 5127967];
            arrAccessoryColors = [65793, 0xFFFFFF, 12767958, 9673634, 8556972, 5398908, 4478310, 2500663, 3422539, 4541285, 6182021, 3618922, 2102889, 8476790, 9319279, 4928583, 14188924, 2436920, 6593232, 4817850, 3366536, 3559294, 1977414, 9622526, 10074585, 13557484, 5220272, 7715142, 5674563, 5668932, 4808462, 4020272, 3560001, 4421735, 5405282, 3433818, 3033928, 3753268, 14019773, 10540396, 0xFFCC00, 14922046, 11509315, 11040791, 13597462, 14515004, 10900510, 16777164, 16777113, 16509316, 13026702, 8488053, 0x990000, 0x660000, 4786437, 15230291, 13382701, 12927265, 10234126, 10053171, 7753511, 9322016, 7746331, 8601921, 6041135, 4465190, 13088131, 9602663, 8218929, 15388042, 14658389, 15982797, 15121555, 14460011, 14121559, 13001261, 3157797, 13092792, 5197887, 7497554, 4008995, 6178103, 8542790, 7027237, 3678742, 5977124, 9265949, 5127967, 10000828, 0xFFFF, 3381657, 26367, 2635172, 91294, 0xFFFF00, 16777062, 0xFF9900, 0xFF00, 39219, 7065902, 0xFF0000, 11046487, 4536088, 0x993300, 16724940, 10432464, 4925009, 0x6600CC];
            cpBase.addEventListener(Event.CHANGE, onColorSelect, false, 0, true);
            cpBase.addEventListener(ColorPickerEvent.ITEM_ROLL_OVER, onItemRollOver, false, 0, true);
            cpBase.addEventListener(ColorPickerEvent.ITEM_ROLL_OUT, onItemRollOut, false, 0, true);
            cpTrim.addEventListener(Event.CHANGE, onColorSelect, false, 0, true);
            cpTrim.addEventListener(ColorPickerEvent.ITEM_ROLL_OVER, onItemRollOver, false, 0, true);
            cpTrim.addEventListener(ColorPickerEvent.ITEM_ROLL_OUT, onItemRollOut, false, 0, true);
            cpAccessory.addEventListener(Event.CHANGE, onColorSelect, false, 0, true);
            cpAccessory.addEventListener(ColorPickerEvent.ITEM_ROLL_OVER, onItemRollOver, false, 0, true);
            cpAccessory.addEventListener(ColorPickerEvent.ITEM_ROLL_OUT, onItemRollOut, false, 0, true);
            cpBase.colors = arrColors;
            cpBase.selectedColor = avt.objData.intColorBase;
            cpBase.setStyle("columnCount", 10);
            cpTrim.colors = arrColors;
            cpTrim.selectedColor = avt.objData.intColorTrim;
            cpTrim.setStyle("columnCount", 10);
            cpAccessory.colors = arrAccessoryColors;
            cpAccessory.selectedColor = avt.objData.intColorAccessory;
            cpAccessory.setStyle("columnCount", 10);
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

