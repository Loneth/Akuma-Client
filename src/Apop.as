// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Apop

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.media.SoundTransform;
    import flash.text.*;

    public class Apop extends MovieClip {

        public var npc:MovieClip;
        public var btnClose:MovieClip;
        public var nMask:MovieClip;
        public var placement:MovieClip;
        public var cnt:MovieClip;
        public var world:MovieClip;
        public var rootClass:MovieClip;
        public var o:Object = null;
        private var mc:MovieClip;

        public function Apop():void{
            addFrameScript(5, this.frame6);
            this.mc = MovieClip(this);
            this.mc.btnClose.addEventListener(MouseEvent.CLICK, this.xClick, false, 0, true);
        }

        public function update(_arg1:Object){
            var _local7:Class;
            var _local8:MovieClip;
            var _local9:MovieClip;
            var _local10:Class;
            var _local11:*;
            var _local12:MovieClip;
            var _local13:Boolean;
            var _local14:int;
            this.rootClass = MovieClip(this.stage.getChildAt(0));
            this.world = this.rootClass.world;
            this.o = _arg1;
            var _local2 = "none";
            var _local3 = "none";
            var _local4 = "none";
            var _local5 = "none";
            var _local6 = "none";
            if (("npcLinkage" in this.o)){
                _local2 = this.o.npcLinkage;
            };
            if (("npcEntry" in this.o)){
                _local3 = this.o.npcEntry;
            };
            if (("cnt" in this.o)){
                _local5 = this.o.cnt;
            };
            if (("scene" in this.o)){
                _local4 = this.o.scene;
            };
            if (("frame" in this.o)){
                _local6 = this.o.frame;
            };
            if (_local2 != "none"){
                _local7 = (this.world.ldr_map.contentLoaderInfo.applicationDomain.getDefinition(_local2) as Class);
                if (_local7 != null){
                    if (_local3 == "right"){
                        _local8 = this.mc.npc.npcRight;
                        _local9 = this.mc.npc.npcLeft;
                        if (_local9.currentLabel != "init"){
                            _local9.gotoAndPlay("slide-out");
                        }
                        else {
                            _local9.visible = false;
                        };
                    }
                    else {
                        _local8 = this.mc.npc.npcLeft;
                        _local9 = this.mc.npc.npcRight;
                        if (_local9.currentLabel != "init"){
                            _local9.gotoAndPlay("slide-out");
                        }
                        else {
                            _local9.visible = false;
                        };
                    };
                    _local8.visible = true;
                    _local8.npc.removeChildAt(0);
                    _local8.npc.addChild(new (_local7)());
                    if (_local8.currentLabel != "init"){
                        _local8.gotoAndPlay("slide-hook");
                    }
                    else {
                        _local8.gotoAndPlay("slide-in");
                    };
                }
                else {
                    this.mc.npc.npcRight.visible = false;
                    this.mc.npc.npcLeft.visible = false;
                };
            };
            if (_local5 != "none"){
                _local10 = (this.world.ldr_map.contentLoaderInfo.applicationDomain.getDefinition(_local5) as Class);
                if (_local10 != null){
                    this.mc.cnt.removeChildAt(0);
                    _local11 = this.mc.cnt.addChild(new (_local10)());
                    _local11.name = "cnt";
                    if (_local4 != "none"){
                        _local11.gotoAndPlay(_local4);
                    };
                };
            };
            if (_local6 != "none"){
                _local12 = MovieClip(this.mc.cnt.getChildByName("cnt"));
                _local13 = false;
                _local14 = 0;
                while (_local14 < _local12.currentLabels.length) {
                    if (_local12.currentLabels[_local14].name == _local6){
                        _local13 = true;
                    };
                    _local14++;
                };
                if (_local13){
                    _local12.gotoAndPlay(_local6);
                }
                else {
                    this.rootClass.addUpdate((("Label " + _local6) + " not found!"));
                };
            };
            if (this.mc.currentLabel == "init"){
                this.mc.gotoAndPlay("in");
            };
        }

        public function updateWithClasses(_arg1:Object, _arg2:Class, _arg3:Class):void{
            var _local7:MovieClip;
            var _local8:MovieClip;
            var _local9:*;
            var _local10:MovieClip;
            var _local11:Boolean;
            var _local12:int;
            this.rootClass = MovieClip(this.stage.getChildAt(0));
            this.world = this.rootClass.world;
            this.o = _arg1;
            var _local4 = "none";
            var _local5 = "none";
            var _local6 = "none";
            if (("npcEntry" in this.o)){
                _local4 = this.o.npcEntry;
            };
            if (("scene" in this.o)){
                _local5 = this.o.scene;
            };
            if (("frame" in this.o)){
                _local6 = this.o.frame;
            };
            if (_arg2 != null){
                if (_local4 == "right"){
                    _local7 = this.mc.npc.npcRight;
                    _local8 = this.mc.npc.npcLeft;
                    if (_local8.currentLabel != "init"){
                        _local8.gotoAndPlay("slide-out");
                    }
                    else {
                        _local8.visible = false;
                    };
                }
                else {
                    _local7 = this.mc.npc.npcLeft;
                    _local8 = this.mc.npc.npcRight;
                    if (_local8.currentLabel != "init"){
                        _local8.gotoAndPlay("slide-out");
                    }
                    else {
                        _local8.visible = false;
                    };
                };
                _local7.visible = true;
                _local7.npc.removeChildAt(0);
                _local7.npc.addChild(new (_arg2)());
                if (_local7.currentLabel != "init"){
                    _local7.gotoAndPlay("slide-hook");
                }
                else {
                    _local7.gotoAndPlay("slide-in");
                };
            }
            else {
                this.mc.npc.npcRight.visible = false;
                this.mc.npc.npcLeft.visible = false;
            };
            if (_arg3 != null){
                this.mc.cnt.removeChildAt(0);
                _local9 = this.mc.cnt.addChild(new (_arg3)());
                _local9.name = "cnt";
                if (_local5 != "none"){
                    _local9.gotoAndPlay(_local5);
                };
            };
            if (_local6 != "none"){
                _local10 = MovieClip(this.mc.cnt.getChildByName("cnt"));
                _local11 = false;
                _local12 = 0;
                while (_local12 < _local10.currentLabels.length) {
                    if (_local10.currentLabels[_local12].name == _local6){
                        _local11 = true;
                    };
                    _local12++;
                };
                if (_local11){
                    _local10.gotoAndPlay(_local6);
                }
                else {
                    this.rootClass.addUpdate((("Label " + _local6) + " not found!"));
                };
            };
            if (this.mc.currentLabel == "init"){
                this.mc.gotoAndPlay("in");
            };
        }

        public function fClose():void{
            var _local1:MovieClip = MovieClip(this.mc.cnt.getChildByName("cnt"));
            _local1.soundTransform = new SoundTransform(0);
            _local1.stop();
            this.mc.btnClose.removeEventListener(MouseEvent.CLICK, this.xClick);
            this.mc.parent.removeChild(this);
        }

        private function xClick(_arg1:MouseEvent):void{
            this.fClose();
        }

        public function exit():void{
            this.fClose();
        }

        public function warn(_arg1:String){
            trace("");
            trace("*^*^* NPC DIALOGUE ERROR *^*^*");
            trace(("  > " + _arg1));
            trace("");
        }

        function frame6(){
            stop();
        }


    }
}//package 

