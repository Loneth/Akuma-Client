// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//ModalMC

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.filters.GlowFilter;
    import flash.text.*;

    public class ModalMC extends MovieClip {

        public var cnt:MovieClip;
        private var world:MovieClip;
        private var rootClass:MovieClip;
        private var fData:Object = null;
        private var callback:Object = null;
        private var mc:MovieClip;
        private var qtySel:QtySelectorMC;
        private var heightOffset:int = 42;
        private var glowColors:Object;
        private var glowSizes:Object;
        public var isOpen:Boolean = false;
        public var greedy:Boolean = false;

        public function ModalMC():void{
            this.glowColors = {
                white:0xFFFFFF,
                red:0xFF0000,
                green:0xFF00,
                blue:0xFF,
                gold:16750899
            };
            this.glowSizes = {medium:3};
            super();
            addFrameScript(3, this.frame4, 11, this.frame12);
        }

        public function init(_arg1){
            var _local2:String;
            var _local3:String;
            this.fData = _arg1;
            this.callback = _arg1.callback;
            if (_arg1.greedy != null){
                this.greedy = _arg1.greedy;
            };
            this.mc = MovieClip(this);
            this.rootClass = MovieClip(stage.getChildAt(0));
            this.mc.cnt.strBody.autoSize = "center";
            this.mc.cnt.strBody.htmlText = this.fData.strBody;
            if ((((_arg1.btns == null)) || ((_arg1.btns == "dual")))){
                this.mc.cnt.btns.dual.ybtn.buttonMode = true;
                this.mc.cnt.btns.dual.nbtn.buttonMode = true;
                this.mc.cnt.btns.dual.ybtn.addEventListener(MouseEvent.CLICK, this.yClick, false, 0, true);
                this.mc.cnt.btns.dual.ybtn.addEventListener(MouseEvent.MOUSE_OVER, this.yMouseOver, false, 0, true);
                this.mc.cnt.btns.dual.ybtn.addEventListener(MouseEvent.MOUSE_OUT, this.yMouseOut, false, 0, true);
                this.mc.cnt.btns.dual.nbtn.addEventListener(MouseEvent.CLICK, this.nClick, false, 0, true);
                this.mc.cnt.btns.dual.nbtn.addEventListener(MouseEvent.MOUSE_OVER, this.nMouseOver, false, 0, true);
                this.mc.cnt.btns.dual.nbtn.addEventListener(MouseEvent.MOUSE_OUT, this.nMouseOut, false, 0, true);
                this.mc.cnt.btns.mono.visible = false;
            };
            if (((!((_arg1.btns == null))) && ((_arg1.btns == "mono")))){
                this.mc.cnt.btns.mono.buttonMode = true;
                this.mc.cnt.btns.mono.addEventListener(MouseEvent.CLICK, this.mClick, false, 0, true);
                this.mc.cnt.btns.mono.addEventListener(MouseEvent.MOUSE_OVER, this.yMouseOver, false, 0, true);
                this.mc.cnt.btns.mono.addEventListener(MouseEvent.MOUSE_OUT, this.yMouseOut, false, 0, true);
                this.mc.cnt.btns.dual.visible = false;
            };
            if (((!((_arg1.qtySel == null))) && ((_arg1.qtySel.max > 1)))){
                this.qtySel = QtySelectorMC(addChild(new QtySelectorMC(this, this.rootClass, _arg1.qtySel.min, _arg1.qtySel.max)));
                this.qtySel.y = Math.round(((this.mc.cnt.strBody.y + this.mc.cnt.strBody.textHeight) + 10));
                this.qtySel.x = Math.round(((this.mc.width / 2) - (this.qtySel.width / 2)));
                this.heightOffset = ((this.heightOffset + this.qtySel.height) + 16);
            };
            this.mc.cnt.bg.height = Math.ceil((this.mc.cnt.strBody.textHeight + this.heightOffset));
            this.mc.cnt.btns.y = this.mc.cnt.bg.height;
            this.mc.x = ((1260 / 2) - (this.mc.width / 2));
            this.mc.y = ((550 / 2) - (this.mc.height / 2));
            if (_arg1.glow != null){
                _local2 = _arg1.glow.split(",")[0];
                _local3 = _arg1.glow.split(",")[1];
                this.mc.filters = [new GlowFilter(this.glowColors[_local2], 1, this.glowSizes[_local3], this.glowSizes[_local3], 64, 1)];
            };
        }

        public function fClose():void{
            this.callback = null;
            if (this.qtySel != null){
                this.qtySel.fClose();
            };
            this.killButtons();
            this.mc.parent.removeChild(this);
        }

        private function yClick(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            var _local3:* = MovieClip(this);
            this.setCT(_local2.bg, 43775);
            this.fData.params.accept = true;
            _local3.mouseChildren = false;
            if (this.qtySel != null){
                _local3.fData.params.iQty = this.qtySel.val;
            };
            _local3.callback(_local3.fData.params);
            this.killButtons();
            _local3.gotoAndPlay("out");
        }

        private function nClick(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            var _local3:* = MovieClip(this);
            this.setCT(_local2.bg, 0xFF0000);
            this.fData.params.accept = false;
            _local3.mouseChildren = false;
            _local3.callback(this.fData.params);
            this.killButtons();
            _local3.gotoAndPlay("out");
        }

        private function mClick(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            var _local3:* = MovieClip(this);
            this.setCT(_local2.bg, 0xFF0000);
            _local3.mouseChildren = false;
            if (_local3.callback != null){
                _local3.callback(this.fData.params);
            };
            this.killButtons();
            _local3.gotoAndPlay("out");
        }

        private function yMouseOver(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            this.setCT(_local2.bg, 0x222222);
        }

        private function yMouseOut(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            this.setCT(_local2.bg, 0);
        }

        private function nMouseOver(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            this.setCT(_local2.bg, 0x222222);
        }

        private function nMouseOut(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            this.setCT(_local2.bg, 0);
        }

        private function killButtons():void{
            this.mc.cnt.btns.dual.ybtn.removeEventListener(MouseEvent.CLICK, this.yClick);
            this.mc.cnt.btns.dual.ybtn.removeEventListener(MouseEvent.MOUSE_OVER, this.yMouseOver);
            this.mc.cnt.btns.dual.ybtn.removeEventListener(MouseEvent.MOUSE_OUT, this.yMouseOut);
            this.mc.cnt.btns.dual.nbtn.removeEventListener(MouseEvent.CLICK, this.nClick);
            this.mc.cnt.btns.dual.nbtn.removeEventListener(MouseEvent.MOUSE_OVER, this.nMouseOver);
            this.mc.cnt.btns.dual.nbtn.removeEventListener(MouseEvent.MOUSE_OUT, this.nMouseOut);
            this.mc.cnt.btns.mono.removeEventListener(MouseEvent.CLICK, this.mClick);
            this.mc.cnt.btns.mono.removeEventListener(MouseEvent.MOUSE_OVER, this.yMouseOver);
            this.mc.cnt.btns.mono.removeEventListener(MouseEvent.MOUSE_OUT, this.yMouseOut);
            if (this.qtySel != null){
                this.qtySel.killButtons();
            };
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
            if (this.stage != null){
                this.fClose();
            };
        }


    }
}//package 

