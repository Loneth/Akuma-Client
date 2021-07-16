// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.mcCustomizeArmor_390

package Game_fla{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import org.sepy.ColorPicker.ColorPicker2;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.media.*;
    import flash.net.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.ui.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.xml.*;

    public dynamic class mcCustomizeArmor_390 extends MovieClip {

        public var submit:SimpleButton;
        public var btnClose:SimpleButton;
        public var cpTrim:ColorPicker2;
        public var cpAccessory:ColorPicker2;
        public var cpBase:ColorPicker2;
        public var bg:MovieClip;
        public var rootClass;
        public var avt:Avatar;
        public var backData;

        public function mcCustomizeArmor_390(){
            addFrameScript(0, frame1, 19, frame20, 35, frame36);
            __setProp_cpAccessory_mcCustomizeArmor_Layer22_0();
            __setProp_cpTrim_mcCustomizeArmor_Layer23_0();
            __setProp_cpBase_mcCustomizeArmor_Layer24_0();
        }

        public function onCloseClick(_arg1:Event){
            if (((((!((backData.intColorBase == avt.objData.intColorBase))) || (!((backData.intColorTrim == avt.objData.intColorTrim))))) || (!((backData.intColorAccessory == avt.objData.intColorAccessory))))){
                avt.objData.intColorBase = backData.intColorBase;
                avt.objData.intColorTrim = backData.intColorTrim;
                avt.objData.intColorAccessory = backData.intColorAccessory;
                avt.pMC.updateColor();
            };
            MovieClip(Game.root).mixer.playSound("Click");
            gotoAndPlay("out");
        }

        public function onSaveClick(_arg1:Event){
            if (((((!((backData.intColorBase == avt.objData.intColorBase))) || (!((backData.intColorTrim == avt.objData.intColorTrim))))) || (!((backData.intColorAccessory == avt.objData.intColorAccessory))))){
                rootClass.world.sendChangeArmorColorRequest(avt.objData.intColorBase, avt.objData.intColorTrim, avt.objData.intColorAccessory);
            };
            MovieClip(Game.root).mixer.playSound("Click");
            gotoAndPlay("out");
        }

        public function onColorSelect(_arg1:Event):void{
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

        public function onItemRollOver(_arg1:Event):void{
            var _local2:* = new Object();
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
                case "cpTrim":
                    _local2.intColorAccessory = _arg1.target.selectedColor;
                    break;
            };
            avt.pMC.updateColor(_local2);
        }

        public function onItemRollOut(_arg1:Event):void{
            avt.pMC.updateColor();
        }

        function __setProp_cpAccessory_mcCustomizeArmor_Layer22_0(){
            try {
                cpAccessory["componentInspectorSetting"] = true;
            }
            catch(e:Error) {
            };
            cpAccessory.allowUserColor = true;
            cpAccessory.selectedColor = 0;
            cpAccessory.columns = 21;
            cpAccessory.direction = "DL";
            cpAccessory.useAdvancedColorSelector = true;
            cpAccessory.useNoColorSelector = false;
            try {
                cpAccessory["componentInspectorSetting"] = false;
            }
            catch(e:Error) {
            };
        }

        function __setProp_cpTrim_mcCustomizeArmor_Layer23_0(){
            try {
                cpTrim["componentInspectorSetting"] = true;
            }
            catch(e:Error) {
            };
            cpTrim.allowUserColor = true;
            cpTrim.selectedColor = 0;
            cpTrim.columns = 21;
            cpTrim.direction = "DL";
            cpTrim.useAdvancedColorSelector = true;
            cpTrim.useNoColorSelector = false;
            try {
                cpTrim["componentInspectorSetting"] = false;
            }
            catch(e:Error) {
            };
        }

        function __setProp_cpBase_mcCustomizeArmor_Layer24_0(){
            try {
                cpBase["componentInspectorSetting"] = true;
            }
            catch(e:Error) {
            };
            cpBase.allowUserColor = true;
            cpBase.selectedColor = 0;
            cpBase.columns = 21;
            cpBase.direction = "DL";
            cpBase.useAdvancedColorSelector = true;
            cpBase.useNoColorSelector = false;
            try {
                cpBase["componentInspectorSetting"] = false;
            }
            catch(e:Error) {
            };
        }

        function frame1(){
            rootClass = MovieClip(stage.getChildAt(0));
            avt = rootClass.world.myAvatar;
            backData = new Object();
            backData.intColorBase = avt.objData.intColorBase;
            backData.intColorTrim = avt.objData.intColorTrim;
            backData.intColorAccessory = avt.objData.intColorAccessory;
            btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
            submit.addEventListener(MouseEvent.CLICK, onSaveClick, false, 0, true);
            cpBase.addEventListener("CHANGE", onColorSelect, false, 0, true);
            cpBase.addEventListener("ROLL_OVER", onItemRollOver, false, 0, true);
            cpBase.addEventListener("ROLL_OUT", onItemRollOut, false, 0, true);
            cpTrim.addEventListener("CHANGE", onColorSelect, false, 0, true);
            cpTrim.addEventListener("ROLL_OVER", onItemRollOver, false, 0, true);
            cpTrim.addEventListener("ROLL_OUT", onItemRollOut, false, 0, true);
            cpAccessory.addEventListener("CHANGE", onColorSelect, false, 0, true);
            cpAccessory.addEventListener("ROLL_OVER", onItemRollOver, false, 0, true);
            cpAccessory.addEventListener("ROLL_OUT", onItemRollOut, false, 0, true);
            cpBase.selectedColor = avt.objData.intColorBase;
            cpTrim.selectedColor = avt.objData.intColorTrim;
            cpAccessory.selectedColor = avt.objData.intColorAccessory;
        }

        function frame20(){
            stop();
        }

        function frame36(){
            MovieClip(parent).gotoAndPlay("init");
        }


    }
}//package Game_fla

