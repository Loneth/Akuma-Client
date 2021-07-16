// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//DFrame2MC

package {
    import flash.display.MovieClip;
    import flash.display.DisplayObject;
    import flash.filters.GlowFilter;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class DFrame2MC extends MovieClip {

        public var cnt:MovieClip;
        var world:MovieClip;
        var rootClass:MovieClip;
        var fData:Object = null;
        var isOpen:Boolean = false;
        var iniFrameT:int = 0;
        var iniFrameC:int = 0;
        var durFrameT:int = 35;
        var durFrameC:int = 0;
        var mc:MovieClip;
        var rarityCA:Array;
        public var fWidth:int = 250;
        public var fHeight:int = 86;
        public var fX:int = 0;
        public var fY:int = 0;

        public function DFrame2MC(_arg1:Object):void{
            rarityCA = [0x666666, 0xFFFFFF, 0x66FF00, 2663679, 0xFF00FF, 0xFFCC00, 0xFF0000];
            super();
            addFrameScript(3, frame4, 11, frame12);
            fData = _arg1;
        }

        public function init(){
            var AssetClass:Class;
            var mcIcon:DisplayObject;
            mc = MovieClip(this);
            rootClass = MovieClip(stage.getChildAt(0));
            mc.cnt.strName.autoSize = "left";
			
			var iTag;
			if (fData.sType.toLowerCase() != "refinement"){
                if(fData.iRefine != ""){
					iTag = "+ " + fData.RefineID + " ";
				} else {
					iTag = "";
				}
            } else {
				iTag = "";
			}
			
			mc.cnt.strName.htmlText = "<font color='#00FF00'>" + iTag + "</font>" + fData.sName;
            if (fData.iStk > 1){
                mc.cnt.strName.htmlText = ("<font color='#00FF00'>" + iTag + "</font>" + fData.sName + " x" + fData.iQty);
            };
            mc.cnt.bg.width = Math.max(((mc.cnt.strName.x + int(mc.cnt.strName.textWidth)) + 15), 250);
            mc.cnt.ybtn.bg.width = Math.round((mc.cnt.bg.width / 2));
            mc.cnt.nbtn.bg.width = Math.round((mc.cnt.bg.width - mc.cnt.ybtn.bg.width));
            mc.cnt.nbtn.x = mc.cnt.ybtn.width;
            mc.cnt.ybtn.ti.x = (((mc.cnt.ybtn.bg.width / 2) - (mc.cnt.ybtn.ti.textWidth / 2)) + 4);
            mc.cnt.nbtn.ti.x = (((mc.cnt.nbtn.bg.width / 2) - (mc.cnt.nbtn.ti.textWidth / 2)) - 4);
            mc.cnt.ybtn.ti.mouseEnabled = false;
            mc.cnt.nbtn.ti.mouseEnabled = false;
            mc.cnt.strType.text = rootClass.getDisplaysType(fData);
            var mcFilter:* = mc.cnt.bg.filters;
            mc.cnt.icon.removeAllChildren();
            var sIcon:String = "";
            if (fData.sType.toLowerCase() == "refinement"){
                sIcon = rootClass.getIconBySlot(fData.sES);
            }
            else {
                if ((((fData.sType.toLowerCase() == "serveruse")) || ((fData.sType.toLowerCase() == "clientuse")))){
                    if (((((("sFile" in fData)) && ((fData.sFile.length > 0)))) && (!((rootClass.world.getClass(fData.sFile) == null))))){
                        sIcon = fData.sFile;
                    }
                    else {
                        sIcon = fData.sIcon;
                    };
                }
                else {
                    if ((((((fData.sIcon == null)) || ((fData.sIcon == "")))) || ((fData.sIcon == "none")))){
                        if (fData.sLink.toLowerCase() != "none"){
                            sIcon = "iidesign";
                        }
                        else {
                            sIcon = "iibag";
                        };
                    }
                    else {
                        sIcon = fData.sIcon;
                    };
                };
            };
            try {
                AssetClass = (rootClass.world.getClass(sIcon) as Class);
                mcIcon = mc.cnt.icon.addChild(new (AssetClass)());
            }
            catch(e:Error) {
                AssetClass = (rootClass.world.getClass("iibag") as Class);
                mcIcon = mc.cnt.icon.addChild(new (AssetClass)());
            };
            mcIcon.scaleX = (mcIcon.scaleY = 0.5);
            mcFilter = mc.cnt.icon.filters;
            mcFilter = new GlowFilter(rarityCA[fData.iRty], 1, 8, 8, 2, 1, false, false);
            mc.cnt.icon.filters = [mcFilter];
            mc.cnt.ybtn.buttonMode = true;
            mc.cnt.nbtn.buttonMode = true;
            mc.cnt.ybtn.addEventListener(MouseEvent.CLICK, yClick, false, 0, true);
            mc.cnt.ybtn.addEventListener(MouseEvent.MOUSE_OVER, yMouseOver, false, 0, true);
            mc.cnt.ybtn.addEventListener(MouseEvent.MOUSE_OUT, yMouseOut, false, 0, true);
            mc.cnt.nbtn.addEventListener(MouseEvent.CLICK, nClick, false, 0, true);
            mc.cnt.nbtn.addEventListener(MouseEvent.MOUSE_OVER, nMouseOver, false, 0, true);
            mc.cnt.nbtn.addEventListener(MouseEvent.MOUSE_OUT, nMouseOut, false, 0, true);
        }

        private function yClick(_arg1:MouseEvent){
            var _local3:Object;
            var _local4:*;
            var _local5:*;
            var _local2:Boolean = true;
            for each (_local3 in rootClass.world.myAvatar.items) {
                if ((((_local3.ItemID == fData.ItemID)) && ((_local3.iQty < _local3.iStk)))){
                    _local2 = false;
                };
            };
            if (((_local2) && ((rootClass.world.myAvatar.items.length < rootClass.world.myAvatar.objData.iBagSlots)))){
                _local2 = false;
            };
            if (((rootClass.isHouseItem(fData)) && ((rootClass.world.myAvatar.houseitems.length >= rootClass.world.myAvatar.objData.iHouseSlots)))){
                rootClass.MsgBox.notify("House Inventory Full!");
            }
            else {
                if (_local2){
                    rootClass.MsgBox.notify("Item Inventory Full!");
                }
                else {
                    _local4 = MovieClip(_arg1.currentTarget);
                    _local5 = MovieClip(_local4.parent.parent);
                    setCT(_local4.bg, 3385873);
                    _local5.cnt.ybtn.mouseEnabled = false;
                    _local5.cnt.ybtn.mouseChildren = false;
                    rootClass.sfc.sendXtMessage("zm", "getDrop", [fData.ItemID], "str", rootClass.world.curRoom);
                };
            };
        }

        private function nClick(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            var _local3:* = MovieClip(_local2.parent.parent);
            setCT(_local2.bg, 0xFF0000);
            _local3.mouseChildren = false;
            killButtons();
            _local3.gotoAndPlay("out");
        }

        private function yMouseOver(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            setCT(_local2.bg, 0x222222);
        }

        private function yMouseOut(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            setCT(_local2.bg, 0);
        }

        private function nMouseOver(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            setCT(_local2.bg, 0x222222);
        }

        private function nMouseOut(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            setCT(_local2.bg, 0);
        }

        private function killButtons():void{
            mc.cnt.ybtn.removeEventListener(MouseEvent.CLICK, yClick);
            mc.cnt.ybtn.removeEventListener(MouseEvent.MOUSE_OVER, yMouseOver);
            mc.cnt.ybtn.removeEventListener(MouseEvent.MOUSE_OUT, yMouseOut);
            mc.cnt.nbtn.removeEventListener(MouseEvent.CLICK, nClick);
            mc.cnt.nbtn.removeEventListener(MouseEvent.MOUSE_OVER, nMouseOver);
            mc.cnt.nbtn.removeEventListener(MouseEvent.MOUSE_OUT, nMouseOut);
        }

        public function fClose():void{
            killButtons();
            MovieClip(this).parent.removeChild(this);
        }

        private function setCT(_arg1, _arg2){
            var _local3:* = _arg1.transform.colorTransform;
            _local3.color = _arg2;
            _arg1.transform.colorTransform = _local3;
        }

        function frame4(){
            stop();
        }

        function frame12(){
            fClose();
        }


    }
}//package 

