// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Game_fla.mcCustomizeArmor_390

package {
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

    public dynamic class GuildCustomization extends MovieClip {

        public var submit:SimpleButton;
        public var btnClose:SimpleButton;
        public var cpGuildEmblemBase:ColorPicker2;
        public var cpGuildEmblemTrim:ColorPicker2;
        public var cpGuildName:ColorPicker2;
        public var bg:MovieClip;
        public var rootClass;
        public var avt:Avatar;
        public var backData;

        public function GuildCustomization(){
            addFrameScript(0, frame1, 19, frame20, 35, frame36);
            //__setProp_cpGuildEmblemTrim_GuildCustomization_Layer22_0();
            //__setProp_cpGuildEmblemBase_GuildCustomization_Layer23_0();
            __setProp_cpGuildName_GuildCustomization_Layer24_0();
        }

        public function onCloseClick(_arg1:Event){
            if (((((!((backData.intColorGuildName == avt.objData.intColorGuildName))) || (!((backData.intGuildEmblemBase == avt.objData.intGuildEmblemBase))))) || (!((backData.intGuildEmblemTrim == avt.objData.intGuildEmblemTrim))))){
                avt.pMC.pname.tg.textColor = backData.intColorGuildName;
                avt.pMC.updateColor();
            };
            MovieClip(Game.root).mixer.playSound("Click");
            gotoAndPlay("out");
        }

        public function onSaveClick(_arg1:Event){
			_local8 = new ModalMC();
			_local9 = {};
			_local9.strBody = ("Are you sure you want to change your guild color? This will charge you 1,000 RoyalCoins.");
			_local9.params = {iSel:"dummy"};
			_local9.callback = onSellRequest;
			_local9.glow = "white,medium";
			rootClass.ui.ModalStack.addChild(_local8);
			_local8.init(_local9);		
        }
		
        private function onSellRequest(_arg_1:Object):void{
            if (_arg_1.accept){
				if ((((!((backData.intColorGuildName == avt.pMC.pname.tg.textColor)))))){
					rootClass.world.sendChangeGuildSettingsRequest(avt.objData.intColorGuildName, avt.objData.intGuildEmblemBase, avt.objData.intGuildEmblemTrim);
				};
				MovieClip(Game.root).mixer.playSound("Click");
				gotoAndPlay("out");
            };
        }
		
        public function onColorSelect(_arg1:Event):void{
            switch (_arg1.target.name){
                case "cpGuildName":
                    avt.objData.intColorGuildName = _arg1.target.selectedColor;
                    break;
            };
        }

        public function onItemRollOver(_arg1:Event):void{
            var _local2:* = new Object();
            avt.pMC.pname.tg.textColor = avt.objData.intColorGuildName;
            switch (_arg1.target.name){
                case "cpGuildName":
                    avt.pMC.pname.tg.textColor = _arg1.target.selectedColor;
                    break;
            };
        }

        public function onItemRollOut(_arg1:Event):void{

        }

        function __setProp_cpGuildEmblemTrim_GuildCustomization_Layer22_0(){
            try {
                cpGuildEmblemTrim["componentInspectorSetting"] = true;
            }
            catch(e:Error) {
            };
            cpGuildEmblemTrim.allowUserColor = true;
            cpGuildEmblemTrim.selectedColor = 0;
            cpGuildEmblemTrim.columns = 21;
            cpGuildEmblemTrim.direction = "DL";
            cpGuildEmblemTrim.useAdvancedColorSelector = true;
            cpGuildEmblemTrim.useNoColorSelector = false;
            try {
                cpGuildEmblemTrim["componentInspectorSetting"] = false;
            }
            catch(e:Error) {
            };
        }

        function __setProp_cpGuildEmblemBase_GuildCustomization_Layer23_0(){
            try {
                cpGuildEmblemBase["componentInspectorSetting"] = true;
            }
            catch(e:Error) {
            };
            cpGuildEmblemBase.allowUserColor = true;
            cpGuildEmblemBase.selectedColor = 0;
            cpGuildEmblemBase.columns = 21;
            cpGuildEmblemBase.direction = "DL";
            cpGuildEmblemBase.useAdvancedColorSelector = true;
            cpGuildEmblemBase.useNoColorSelector = false;
            try {
                cpGuildEmblemBase["componentInspectorSetting"] = false;
            }
            catch(e:Error) {
            };
        }

        function __setProp_cpGuildName_GuildCustomization_Layer24_0(){
            try {
                cpGuildName["componentInspectorSetting"] = true;
            }
            catch(e:Error) {
            };
            cpGuildName.allowUserColor = true;
            cpGuildName.selectedColor = 0;
            cpGuildName.columns = 21;
            cpGuildName.direction = "DL";
            cpGuildName.useAdvancedColorSelector = true;
            cpGuildName.useNoColorSelector = false;
            try {
                cpGuildName["componentInspectorSetting"] = false;
            }
            catch(e:Error) {
            };
        }

        function frame1(){
            rootClass = MovieClip(stage.getChildAt(0));
            avt = rootClass.world.myAvatar;
            backData = new Object();
            backData.intColorGuildName = avt.pMC.pname.tg.textColor;
            btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
            submit.addEventListener(MouseEvent.CLICK, onSaveClick, false, 0, true);
            cpGuildName.addEventListener("CHANGE", onColorSelect, false, 0, true);
            cpGuildName.addEventListener("ROLL_OVER", onItemRollOver, false, 0, true);
            cpGuildName.addEventListener("ROLL_OUT", onItemRollOut, false, 0, true);
            cpGuildName.selectedColor = avt.pMC.pname.tg.textColor;
        }

        function frame20(){
            stop();
        }

        function frame36(){
            MovieClip(parent).gotoAndPlay("init");
        }


    }
}//package Game_fla

