// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//MonsterMC

package {
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.geom.Point;
    import flash.geom.ColorTransform;
    import flash.utils.Timer;
    import flash.geom.Rectangle;
    import flash.display.DisplayObject;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import flash.display.Sprite;
    import flash.display.Graphics;

    public class MonsterMC extends MovieClip {

        public var pname:MovieClip;
        public var shadow:MovieClip;
        public var fx:MovieClip;
        public var mc:MovieClip;
        public var bubble:MovieClip;
        var ldr:Loader;
        var WORLD:MovieClip;
        var xDep;
        var yDep;
        var xTar;
        var yTar:Number;
        var op:Point;
        var tp:Point;
        var walkTS:Number;
        var walkD:Number;
        var ox;
        var oy;
        var px;
        var py;
        var tx;
        var ty:Number;
        var nDuration;
        var nXStep;
        var nYStep:Number;
        var cbx;
        var cby:Number;
        var defaultCT:ColorTransform;
        var iniTimer:Timer;
        public var hitbox:Rectangle;
        public var hitboxDO:DisplayObject;
        public var spFX:Object;
        public var pAV:Avatar;
        var mcChar:MovieClip;
        public var isMonster:Boolean = true;
        public var isStatic:Boolean = false;
        public var noMove:Boolean = false;
        private var despawnTimer:Timer;
        private var totalTransform:Object;
        private var clampedTransform:ColorTransform;
        private var animQueue:Array;
        private var attacks:Array;

        public function MonsterMC(_arg1:String){
            this.ldr = new Loader();
            this.defaultCT = MovieClip(this).transform.colorTransform;
            this.spFX = {};
            this.despawnTimer = new Timer(5000, 1);
            this.totalTransform = {
                alphaMultiplier:1,
                alphaOffset:0,
                redMultiplier:1,
                redOffset:0,
                greenMultiplier:1,
                greenOffset:0,
                blueMultiplier:1,
                blueOffset:0
            };
            this.clampedTransform = new ColorTransform();
            this.animQueue = [];
            this.attacks = new Array("Attack1", "Attack2", "Buff", "Cast");
            super();
            this.bubble.visible = false;
            this.bubble.t = "";
            this.pname.ti.text = _arg1;
        }

        public function init(){
            this.WORLD = MovieClip(parent.parent);
            this.mcChar = MovieClip(this.getChildAt(1));
            this.mcChar.addEventListener(MouseEvent.CLICK, this.onClickHandler);
            this.pname.addEventListener(MouseEvent.CLICK, this.onClickHandler);
            this.despawnTimer.addEventListener(TimerEvent.TIMER, this.despawn);
            this.addEventListener(Event.ENTER_FRAME, this.checkQueue, false, 0, true);
            this.pname.mouseChildren = false;
            this.mcChar.buttonMode = true;
            this.pname.buttonMode = true;
            this.shadow.mouseEnabled = (this.shadow.mouseChildren = false);
            this.mcChar.cacheAsBitmap = true;
        }

        public function setData(){
            this.pAV.objData.strMonName = this.pname.ti.text;
        }

        public function updateNamePlate():void{
            this.WORLD = MovieClip(parent.parent);
            if (((((((this.WORLD.bPvP) && (!((this.pAV.dataLeaf == null))))) && (!((this.pAV.dataLeaf.react == null))))) && ((this.pAV.dataLeaf.react[this.WORLD.myAvatar.dataLeaf.pvpTeam] == 1)))){
                this.pname.ti.textColor = 0xFFFFFF;
            };
        }

        public function fClose(){
            var _local1:* = MovieClip(stage.getChildAt(0)).world;
            var _local2:* = _local1.CHARS;
            this.mcChar.removeEventListener(MouseEvent.CLICK, this.onClickHandler);
            this.pname.removeEventListener(MouseEvent.CLICK, this.onClickHandler);
            this.despawnTimer.removeEventListener(TimerEvent.TIMER, this.despawn);
            this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrameWalk);
            this.removeEventListener(Event.ENTER_FRAME, this.onDespawn);
            this.removeEventListener(Event.ENTER_FRAME, this.checkQueue);
            if (_local1.CHARS.contains(this)){
                _local1.CHARS.removeChild(this);
            };
            if (_local1.TRASH.contains(this)){
                _local1.TRASH.removeChild(this);
            };
        }

        public function hasLabel(_arg1:String):Boolean{
            var _local2:Array = this.mcChar.currentLabels;
            var _local3:int;
            while (_local3 < _local2.length) {
                if (_local2[_local3].name == _arg1){
                    return (true);
                };
                _local3++;
            };
            return (false);
        }

        public function onClickHandler(_arg1:MouseEvent){
            if (_arg1.shiftKey){
                this.WORLD.onWalkClick();
            }
            else {
                if (_arg1.ctrlKey){
                    if (this.WORLD.myAvatar.objData.intAccessLevel >= 40){
                        if (this.pAV.npcType == "monster"){
                            this.WORLD.rootClass.sfc.sendXtMessage("zm", "cmd", ["km", ("m:" + this.pAV.objData.MonMapID)], "str", 1);
                        };
                        if (this.pAV.npcType == "player"){
                            this.WORLD.rootClass.sfc.sendXtMessage("zm", "cmd", ["km", ("p:" + this.pAV.objData.unm.toLowerCase())], "str", 1);
                        };
                    };
                }
                else {
                    if (_arg1.currentTarget.parent == this){
                        if (this.WORLD.myAvatar.target != this.pAV){
                            this.WORLD.setTarget(this.pAV);
                        }
                        else {
                            if (((!(this.WORLD.bPvP)) || ((((this.pAV.dataLeaf.react == null)) || ((this.pAV.dataLeaf.react[this.WORLD.myAvatar.dataLeaf.pvpTeam] == 0)))))){
                                this.WORLD.approachTarget();
                            };
                        };
                    };
                };
            };
        }

        public function modulateColor(_arg1:ColorTransform, _arg2:String):void{
            var _local3:MovieClip = (this.stage.getChildAt(0) as MovieClip);
            if (_arg2 == "+"){
                this.totalTransform.alphaMultiplier = (this.totalTransform.alphaMultiplier + _arg1.alphaMultiplier);
                this.totalTransform.alphaOffset = (this.totalTransform.alphaOffset + _arg1.alphaOffset);
                this.totalTransform.redMultiplier = (this.totalTransform.redMultiplier + _arg1.redMultiplier);
                this.totalTransform.redOffset = (this.totalTransform.redOffset + _arg1.redOffset);
                this.totalTransform.greenMultiplier = (this.totalTransform.greenMultiplier + _arg1.greenMultiplier);
                this.totalTransform.greenOffset = (this.totalTransform.greenOffset + _arg1.greenOffset);
                this.totalTransform.blueMultiplier = (this.totalTransform.blueMultiplier + _arg1.blueMultiplier);
                this.totalTransform.blueOffset = (this.totalTransform.blueOffset + _arg1.blueOffset);
            }
            else {
                if (_arg2 == "-"){
                    this.totalTransform.alphaMultiplier = (this.totalTransform.alphaMultiplier - _arg1.alphaMultiplier);
                    this.totalTransform.alphaOffset = (this.totalTransform.alphaOffset - _arg1.alphaOffset);
                    this.totalTransform.redMultiplier = (this.totalTransform.redMultiplier - _arg1.redMultiplier);
                    this.totalTransform.redOffset = (this.totalTransform.redOffset - _arg1.redOffset);
                    this.totalTransform.greenMultiplier = (this.totalTransform.greenMultiplier - _arg1.greenMultiplier);
                    this.totalTransform.greenOffset = (this.totalTransform.greenOffset - _arg1.greenOffset);
                    this.totalTransform.blueMultiplier = (this.totalTransform.blueMultiplier - _arg1.blueMultiplier);
                    this.totalTransform.blueOffset = (this.totalTransform.blueOffset - _arg1.blueOffset);
                };
            };
            this.clampedTransform.alphaMultiplier = _local3.clamp(this.totalTransform.alphaMultiplier, -1, 1);
            this.clampedTransform.alphaOffset = _local3.clamp(this.totalTransform.alphaOffset, -255, 0xFF);
            this.clampedTransform.redMultiplier = _local3.clamp(this.totalTransform.redMultiplier, -1, 1);
            this.clampedTransform.redOffset = _local3.clamp(this.totalTransform.redOffset, -255, 0xFF);
            this.clampedTransform.greenMultiplier = _local3.clamp(this.totalTransform.greenMultiplier, -1, 1);
            this.clampedTransform.greenOffset = _local3.clamp(this.totalTransform.greenOffset, -255, 0xFF);
            this.clampedTransform.blueMultiplier = _local3.clamp(this.totalTransform.blueMultiplier, -1, 1);
            this.clampedTransform.blueOffset = _local3.clamp(this.totalTransform.blueOffset, -255, 0xFF);
            this.transform.colorTransform = this.clampedTransform;
        }

        public function queueAnim(_arg1:String):void{
            var _local2:MovieClip = (MovieClip(stage.getChildAt(0)).world as MovieClip);
            var _local3:String = this.mcChar.currentLabel;
            if (((((this.hasLabel(_arg1)) && ((this.pAV.dataLeaf.intState > 0)))) && ((_local2.staticAnims.indexOf(_local3) == -1)))){
                if ((((_local2.combatAnims.indexOf(_arg1) > -1)) && ((_local2.combatAnims.indexOf(_local3) > -1)))){
                    this.animQueue.push(_arg1);
                }
                else {
                    this.mcChar.gotoAndPlay(_arg1);
                };
            };
        }

        private function checkQueue(_arg1:Event):Boolean{
            var _local2:MovieClip;
            var _local3:String;
            var _local4:int;
            if (this.animQueue.length > 0){
                _local2 = (MovieClip(stage.getChildAt(0)).world as MovieClip);
                _local3 = this.mcChar.currentLabel;
                _local4 = this.emoteLoopFrame();
                if ((((_local2.combatAnims.indexOf(_local3) > -1)) && ((this.mcChar.currentFrame >= (_local4 + 4))))){
                    this.mcChar.gotoAndPlay(this.animQueue[0]);
                    this.animQueue.shift();
                    return (true);
                };
            };
            return (false);
        }

        public function clearQueue():void{
            this.animQueue = [];
        }

        private function emoteLoopFrame():int{
            var _local1:Array = this.mcChar.currentLabels;
            var _local2:int;
            while (_local2 < _local1.length) {
                if (_local1[_local2].name == currentLabel){
                    return (_local1[_local2].frame);
                };
                _local2++;
            };
            return (8);
        }

        private function linearTween(_arg1, _arg2, _arg3, _arg4):Number{
            return ((((_arg3 * _arg1) / _arg4) + _arg2));
        }

        public function walkTo(_arg1:int, _arg2:int, _arg3:int):void{
            var _local4:Number;
            var _local5:Number;
            if (!this.noMove){
                if (((!((this.pAV.petMC == null))) && (!((this.pAV.petMC.mcChar == null))))){
                    this.pAV.petMC.walkTo((_arg1 - 20), (_arg2 + 5), (_arg3 - 3));
                };
                this.op = new Point(this.x, this.y);
                this.tp = new Point(_arg1, _arg2);
                _local4 = Point.distance(this.op, this.tp);
                this.walkTS = new Date().getTime();
                this.walkD = Math.round((1000 * (_local4 / (_arg3 * 22))));
                if (this.walkD > 0){
                    _local5 = (this.op.x - this.tp.x);
                    if (_local5 < 0){
                        this.turn("right");
                    }
                    else {
                        this.turn("left");
                    };
                    if (!this.mcChar.onMove){
                        this.mcChar.onMove = true;
                        if (this.mcChar.currentLabel != "Walk"){
                            this.mcChar.gotoAndPlay("Walk");
                        };
                    };
                    this.addEventListener(Event.ENTER_FRAME, this.onEnterFrameWalk);
                };
            };
        }

        private function onEnterFrameWalk(_arg1:Event):void{
            var _local4:*;
            var _local5:*;
            var _local6:Boolean;
            var _local7:*;
            var _local8:*;
            var _local9:*;
            var _local10:*;
            var _local2:Number = new Date().getTime();
            var _local3:Number = ((_local2 - this.walkTS) / this.walkD);
            if (_local3 > 1){
                _local3 = 1;
            };
            if ((((Point.distance(this.op, this.tp) > 0.5)) && (this.mcChar.onMove))){
                _local4 = this.x;
                _local5 = this.y;
                this.x = Point.interpolate(this.tp, this.op, _local3).x;
                this.y = Point.interpolate(this.tp, this.op, _local3).y;
                _local6 = false;
                _local7 = 0;
                while (_local7 < this.WORLD.arrSolid.length) {
                    if (this.shadow.hitTestObject(this.WORLD.arrSolid[_local7].shadow)){
                        _local6 = true;
                        _local7 = this.WORLD.arrSolid.length;
                    };
                    _local7++;
                };
                if (_local6){
                    _local8 = this.y;
                    this.y = _local5;
                    _local6 = false;
                    _local9 = 0;
                    while (_local9 < this.WORLD.arrSolid.length) {
                        if (this.shadow.hitTestObject(this.WORLD.arrSolid[_local9].shadow)){
                            this.y = _local8;
                            _local6 = true;
                            break;
                        };
                        _local9++;
                    };
                    if (_local6){
                        this.x = _local4;
                        _local6 = false;
                        _local10 = 0;
                        while (_local10 < this.WORLD.arrSolid.length) {
                            if (this.shadow.hitTestObject(this.WORLD.arrSolid[_local10].shadow)){
                                _local6 = true;
                                break;
                            };
                            _local10++;
                        };
                        if (_local6){
                            this.x = _local4;
                            this.y = _local5;
                            this.stopWalking();
                        };
                    };
                };
                if ((((((Math.round(_local4) == Math.round(this.x))) && ((Math.round(_local5) == Math.round(this.y))))) && ((_local2 > (this.walkTS + 50))))){
                    this.stopWalking();
                };
            }
            else {
                this.stopWalking();
            };
        }

        public function stopWalking():void{
            if (this.mcChar.onMove){
                this.mcChar.onMove = false;
                if (this.pAV.dataLeaf.intState != 2){
                    this.mcChar.gotoAndPlay("Idle");
                };
                this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrameWalk);
            };
        }

        public function turn(_arg1:String):void{
            trace(("Monster Static: " + this.isStatic));
            if (!this.isStatic){
                if ((((((_arg1 == "right")) && ((this.mcChar.scaleX < 0)))) || ((((_arg1 == "left")) && ((this.mcChar.scaleX > 0)))))){
                    this.mcChar.scaleX = (this.mcChar.scaleX * -1);
                };
            };
        }

        public function scale(_arg1:Number):void{
            if ((this.mcChar.scaleX >= 0)){
                this.mcChar.scaleX = _arg1;
            }
            else {
                this.mcChar.scaleX = -(_arg1);
            };
            this.mcChar.scaleY = _arg1;
            this.shadow.scaleX = (this.shadow.scaleY = _arg1);
            this.bubble.y = (-(this.mcChar.height) - 10);
            this.pname.y = (-(this.mcChar.height) - 10);
            var _local2:Point = new Point(0, (-(this.mcChar.height) - 10));
            var _local3:Point = this.localToGlobal(_local2);
            if (_local3.y < 50){
                _local3.y = 50;
            };
            _local2 = this.globalToLocal(_local3);
            this.pname.y = _local2.y;
            this.drawHitBox();
        }

        public function die():void{
            this.animQueue = [];
            MovieClip(this.getChildAt(1)).gotoAndPlay("Die");
            this.mcChar.mouseEnabled = false;
            this.mcChar.mouseChildren = false;
            this.despawnTimer.reset();
            this.despawnTimer.start();
        }

        private function despawn(_arg1:TimerEvent):void{
            var _local2:* = MovieClip(stage.getChildAt(0)).world;
            if (_local2.myAvatar.target == this.pAV){
                _local2.setTarget(null);
            };
            this.addEventListener(Event.ENTER_FRAME, this.onDespawn);
        }

        private function onDespawn(_arg1:Event):void{
            this.alpha = (this.alpha - 0.05);
            if (this.alpha < 0){
                this.visible = false;
                this.alpha = 1;
                this.removeEventListener(Event.ENTER_FRAME, this.onDespawn);
            };
        }

        public function respawn(_arg1:String=""):void{
            this.despawnTimer.reset();
            this.removeEventListener(Event.ENTER_FRAME, this.onDespawn);
            if (this.hasLabel("Start")){
                MovieClip(this.getChildAt(1)).gotoAndPlay("Start");
            }
            else {
                if (MovieClip(this.getChildAt(1)).currentLabel != "Walk"){
                    MovieClip(this.getChildAt(1)).gotoAndStop("Idle");
                };
            };
            if (_arg1 != ""){
                this.pname.ti.text = _arg1;
            };
            this.alpha = 1;
            this.visible = true;
            this.mcChar.mouseEnabled = true;
            this.mcChar.mouseChildren = true;
            var _local2:* = MovieClip(stage.getChildAt(0)).world;
        }

        private function drawHitBox():void{
            if (this.hitboxDO != null){
                this.mcChar.removeChild(this.hitboxDO);
            };
            this.hitboxDO = null;
            var _local1:Rectangle = this.mcChar.getBounds(stage);
            var _local2:Point = _local1.topLeft;
            var _local3:Point = _local1.bottomRight;
            _local2 = this.mcChar.globalToLocal(_local2);
            _local3 = this.mcChar.globalToLocal(_local3);
            _local1 = new Rectangle(_local2.x, _local2.y, (_local3.x - _local2.x), (_local3.y - _local2.y));
            var _local4:int = (_local1.x + (_local1.width * 0.2));
            if (_local4 > (this.shadow.x - this.shadow.width)){
                _local4 = (this.shadow.x - this.shadow.width);
            };
            var _local5:int = (_local1.width * 0.6);
            if (_local5 < (2 * this.shadow.width)){
                _local5 = (2 * this.shadow.width);
            };
            var _local6:int = (_local1.y + (_local1.height * 0.2));
            var _local7:int = (_local1.height * 0.6);
            this.hitbox = new Rectangle(_local4, _local6, _local5, _local7);
            var _local8:Sprite = new Sprite();
            var _local9:Graphics = _local8.graphics;
            _local9.lineStyle(0, 0xFFFFFF, 0);
            _local9.beginFill(0xAA00FF, 0);
            _local9.moveTo(_local4, _local6);
            _local9.lineTo((_local4 + _local5), _local6);
            _local9.lineTo((_local4 + _local5), (_local6 + _local7));
            _local9.lineTo(_local4, (_local6 + _local7));
            _local9.lineTo(_local4, _local6);
            _local9.endFill();
            this.hitboxDO = this.mcChar.addChild(_local8);
        }

        public function get Animation():String{
            if ((((this.WORLD.getAchievement("ia1", 21) == 1)) || ((this.WORLD.getAchievement("ia1", 22) == 1)))){
                return (this.attacks[Math.round((Math.random() * (this.attacks.length - 1)))]);
            };
            return (this.attacks[Math.round(Math.random())]);
        }


    }
}//package 

