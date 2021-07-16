// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//FactionsMC

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.text.*;

    public class FactionsMC extends MovieClip {

        public var cnt:MovieClip;
        public var world:MovieClip;
        public var rootClass:MovieClip;
        var isOpen:Boolean = false;
        var mc:MovieClip;
        var mDown:Boolean = false;
        var hRun:int = 0;
        var dRun:int = 0;
        var mbY:int = 0;
        var mhY:int = 0;
        var mbD:int = 0;
        var qly:int = 57;
        var iRepMax:int = 302500;
        public var factions:Array;

        public function FactionsMC():void{
            addFrameScript(0, frame1, 6, frame7, 11, frame12, 15, frame16);
            mc = MovieClip(this);
            mc.cnt.bg.btnClose.addEventListener(MouseEvent.CLICK, xClick);
        }

        public function open(){
            rootClass = MovieClip(this.stage.getChildAt(0));
            world = rootClass.world;
            factions = world.myAvatar.factions;
            mc = MovieClip(this);
            if (!isOpen){
                isOpen = true;
                mc.cnt.gotoAndPlay("intro");
            }
            else {
                isOpen = false;
                fClose();
            };
        }

        public function showFactionList(){
            if (factions.length > 0){
                buildFactionList();
            }
            else {
                showEmptyList();
            };
            mc.cnt.fList.visible = true;
            mc.cnt.fList.mHi.visible = false;
            mc.cnt.mouseChildren = true;
        }

        private function buildFactionList(){
            var _local2:MovieClip;
            var _local1:Object = {};
            var _local3:* = 0;
            while (_local3 < factions.length) {
                _local1 = factions[_local3];
                if (_local1 != null){
                    _local2 = (mc.cnt.fList.addChild(new fProto()) as MovieClip);
                    _local2.t1.htmlText = _local1.sName;
                    _local2.tRank.htmlText = ("Rank " + _local1.iRank);
                    _local2.t2.htmlText = ((_local1.iSpillRep + " <font color='#FF0000'>/</font> ") + _local1.iRepToRank);
                    _local2.addEventListener(MouseEvent.MOUSE_OVER, iMouseOver, false, 0, true);
                    _local2.addEventListener(MouseEvent.MOUSE_OUT, iMouseOut, false, 0, true);
                    _local2.hit.alpha = 0;
                    _local2.y = (_local3 * 20);
                    _local2.x = 10;
                };
                _local3++;
            };
            var _local4:* = mc.cnt.scr;
            var _local5:* = mc.cnt.bMask;
            var _local6:* = mc.cnt.fList;
            _local4.h.height = int(((_local4.b.height / _local6.height) * _local4.b.height));
            hRun = (_local4.b.height - _local4.h.height);
            dRun = ((_local6.height - _local4.b.height) + 20);
            _local4.h.y = 0;
            _local6.oy = (_local6.y = qly);
            _local4.visible = false;
            _local4.hit.alpha = 0;
            mDown = false;
            if (_local6.height > _local4.b.height){
                _local4.visible = true;
                _local4.hit.addEventListener(MouseEvent.MOUSE_DOWN, scrDown, false, 0, true);
                _local4.h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
                _local6.addEventListener(Event.ENTER_FRAME, dEF, false, 0, true);
            };
            mc.cnt.scr.hit.buttonMode = true;
            mc.cnt.fList.iproto.visible = false;
        }

        private function fListClick(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
        }

        private function showEmptyList(){
            var _local1:* = mc.cnt.fList.addChild(new fProto());
            _local1.t1.htmlText = '<font color="#DDDDDD">No Factions!</font>';
            _local1.t2.visible = false;
            _local1.tRank.visible = false;
            _local1.hit.alpha = 0;
            _local1.x = 10;
            mc.cnt.fList.iproto.visible = false;
            mc.cnt.scr.visible = false;
        }

        private function scrDown(_arg1:MouseEvent){
            mbY = int(mouseY);
            mhY = int(MovieClip(_arg1.currentTarget.parent).h.y);
            mDown = true;
            stage.addEventListener(MouseEvent.MOUSE_UP, scrUp);
        }

        private function scrUp(_arg1:MouseEvent){
            mDown = false;
            stage.removeEventListener(MouseEvent.MOUSE_UP, scrUp);
        }

        private function hEF(_arg1:Event){
            var _local2:*;
            if (mDown){
                _local2 = MovieClip(_arg1.currentTarget.parent);
                mbD = (int(mouseY) - mbY);
                _local2.h.y = (mhY + mbD);
                if ((_local2.h.y + _local2.h.height) > _local2.b.height){
                    _local2.h.y = int((_local2.b.height - _local2.h.height));
                };
                if (_local2.h.y < 0){
                    _local2.h.y = 0;
                };
            };
        }

        private function dEF(_arg1:Event){
            var _local2:* = MovieClip(_arg1.currentTarget.parent).scr;
            var _local3:* = MovieClip(_arg1.currentTarget);
            var _local4:* = (-(_local2.h.y) / hRun);
            var _local5:* = (int((_local4 * dRun)) + _local3.oy);
            if (Math.abs((_local5 - _local3.y)) > 0.2){
                _local3.y = (_local3.y + ((_local5 - _local3.y) / 4));
            }
            else {
                _local3.y = _local5;
            };
        }

        public function xClick(_arg1:MouseEvent=null){
            mc.gotoAndPlay("outro");
        }

        public function fClose():void{
            mc.cnt.bg.btnClose.removeEventListener(MouseEvent.CLICK, xClick);
            rootClass.ui.mcPopup.onClose();
        }

        private function bMouseOver(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            _local2.fx.visible = true;
        }

        private function bMouseOut(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            _local2.fx.visible = false;
        }

        private function setCT(_arg1, _arg2){
            var _local3:* = _arg1.transform.colorTransform;
            _local3.color = _arg2;
            _arg1.transform.colorTransform = _local3;
        }

        private function iMouseOver(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            _local2.parent.mHi.visible = true;
            _local2.parent.mHi.y = _local2.y;
        }

        private function iMouseOut(_arg1:MouseEvent){
            var _local2:* = MovieClip(_arg1.currentTarget);
            _local2.parent.mHi.visible = false;
        }

        function frame1(){
            open();
        }

        function frame7(){
            stop();
        }

        function frame12(){
        }

        function frame16(){
            fClose();
        }


    }
}//package 

