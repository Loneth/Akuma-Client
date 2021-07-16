// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//DFrameMC

package {
    import flash.display.MovieClip;
    import flash.filters.GlowFilter;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class DFrameMC extends MovieClip {

        public var cnt:DFrameMCcnt;
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
        public var fWidth:int = 175;
        public var fHeight:int = 38;
        public var fX:int = 0;
        public var fY:int = 0;

        public function DFrameMC(_arg1:Object):void{
            rarityCA = [0x666666, 0xFFFFFF, 0x66FF00, 2663679, 0xFF00FF, 0xFFCC00, 0xFF0000];
            super();
            addFrameScript(0, frame1, 2, frame3, 3, frame4, 8, frame9, 12, frame13);
            fData = _arg1;
        }

        public function init(){
            mc = MovieClip(this);
            rootClass = MovieClip(stage.getChildAt(0));
            mc.cnt.strName.autoSize = "left";
            mc.cnt.strName.htmlText = fData.sName;
            if (mc.cnt.strName.height > 20){
                mc.cnt.strName.y = (mc.cnt.strName.y - int((mc.cnt.strName.height / 2)));
                if (mc.cnt.strName.y < 3){
                    mc.cnt.strName.y = 3;
                };
            };
            mc.cnt.strName.width = (mc.cnt.strName.textWidth + 6);
            mc.cnt.strType.text = rootClass.getDisplaysType(fData);
            if (fData.iQty > 1){
                mc.cnt.strQ.text = ("x" + fData.iQty);
                mc.cnt.strQ.x = ((mc.cnt.bg.width - mc.cnt.strQ.width) - 7);
                mc.cnt.strQ.visible = true;
                mc.cnt.bg.width = (int(mc.cnt.strName.textWidth) + 75);
            }
            else {
                mc.cnt.strQ.x = 0;
                mc.cnt.strQ.visible = false;
                mc.cnt.bg.width = (int(mc.cnt.strName.textWidth) + 50);
            };
            mc.cnt.fx1.width = mc.cnt.bg.width;
            fWidth = mc.cnt.bg.width;
            var _local1:* = mc.cnt.bg.filters;
            _local1 = new GlowFilter(rarityCA[fData.iRty], 1, 8, 8, 2, 1, false, false);
            mc.cnt.bg.filters = [_local1];
            mc.cnt.icon.removeAllChildren();
            var _local2 = "";
            if (fData.sType.toLowerCase() == "refinement"){
                _local2 = rootClass.getIconBySlot(fData.sES);
            }
            else {
                if ((((fData.sType.toLowerCase() == "serveruse")) || ((fData.sType.toLowerCase() == "clientuse")))){
                    if (((((("sFile" in fData)) && ((fData.sFile.length > 0)))) && (!((rootClass.world.getClass(fData.sFile) == null))))){
                        _local2 = fData.sFile;
                    }
                    else {
                        _local2 = fData.sIcon;
                    };
                }
                else {
                    if ((((((fData.sIcon == null)) || ((fData.sIcon == "")))) || ((fData.sIcon == "none")))){
                        if (fData.sLink.toLowerCase() != "none"){
                            _local2 = "iidesign";
                        }
                        else {
                            _local2 = "iibag";
                        };
                    }
                    else {
                        _local2 = fData.sIcon;
                    };
                };
            };
            var _local3:Class = (rootClass.world.getClass(_local2) as Class);
            var _local4:* = mc.cnt.icon.addChild(new (_local3)());
            _local4.scaleX = (_local4.scaleY = 0.5);
            _local1 = mc.cnt.icon.filters;
            _local1 = new GlowFilter(rarityCA[fData.iRty], 1, 8, 8, 2, 1, false, false);
            mc.cnt.icon.filters = [_local1];
        }

        private function closeClick(_arg1:MouseEvent){
        }

        function frame1(){
            visible = false;
        }

        function frame3(){
            iniFrameC++;
            if (!(iniFrameC > (MovieClip(parent).getChildIndex(this) * 2))){
                this.gotoAndPlay((currentFrame - 1));
            };
        }

        function frame4(){
            visible = true;
        }

        function frame9(){
            durFrameC++;
            if (!(durFrameC > durFrameT)){
                this.gotoAndPlay((currentFrame - 1));
            };
        }

        function frame13(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

