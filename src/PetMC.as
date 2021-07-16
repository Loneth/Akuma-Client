// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//PetMC

package {
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.geom.ColorTransform;
    import flash.utils.Timer;
    import flash.events.Event;

    public class PetMC extends MovieClip {

        public var defaultmc:MovieClip;
        public var pname:MovieClip;
        public var shadow:MovieClip;
        var ldr:Loader;
        var WORLD:MovieClip;
        var xDep;
        var yDep;
        var xTar;
        var yTar:Number;
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
        public var spFX:Object;
        public var pAV:Avatar;
        public var mcChar:MovieClip;

        public function PetMC(){
            this.ldr = new Loader();
            this.defaultCT = MovieClip(this).transform.colorTransform;
            this.spFX = {};
            super();
            this.pname.visible = false;
            this.pname.ti.text = "";
        }

        public function init(){
        }

        private function linearTween(_arg1, _arg2, _arg3, _arg4):Number{
            return ((((_arg3 * _arg1) / _arg4) + _arg2));
        }

        public function walkTo(_arg1, _arg2, _arg3):void{
            var _local4:Number;
            this.xDep = this.x;
            this.yDep = this.y;
            this.xTar = _arg1;
            this.yTar = _arg2;
            this.nDuration = Math.round((Math.sqrt((Math.pow((this.xTar - this.x), 2) + Math.pow((this.yTar - this.y), 2))) / _arg3));
            if (this.nDuration){
                this.nXStep = 0;
                this.nYStep = 0;
                _local4 = (this.xDep - this.xTar);
                if ((_local4 < 0)){
                    this.turn("right");
                }
                else {
                    this.turn("left");
                };
                if (!this.mcChar.onMove){
                    this.mcChar.onMove = true;
                    this.mcChar.gotoAndPlay("Walk");
                };
                this.addEventListener(Event.ENTER_FRAME, this.onEnterFrameWalk, false, 0, true);
            };
        }

        private function onEnterFrameWalk(_arg1:Event):void{
            var _local2:*;
            var _local3:*;
            var _local4:Boolean;
            var _local5:*;
            var _local6:*;
            var _local7:*;
            var _local8:*;
            if ((((this.nXStep <= this.nDuration)) || ((((this.nYStep <= this.nDuration)) && (this.mcChar.onMove))))){
                _local2 = this.x;
                _local3 = this.y;
                this.x = this.linearTween(this.nXStep, this.xDep, (this.xTar - this.xDep), this.nDuration);
                this.y = this.linearTween(this.nYStep, this.yDep, (this.yTar - this.yDep), this.nDuration);
                _local4 = false;
                _local5 = 0;
                while (_local5 < this.WORLD.arrSolid.length) {
                    if (this.shadow.hitTestObject(this.WORLD.arrSolid[_local5].shadow)){
                        _local4 = true;
                        _local5 = this.WORLD.arrSolid.length;
                    };
                    _local5++;
                };
                if (_local4){
                    _local6 = this.y;
                    this.y = _local3;
                    _local4 = false;
                    _local7 = 0;
                    while (_local7 < this.WORLD.arrSolid.length) {
                        if (this.shadow.hitTestObject(this.WORLD.arrSolid[_local7].shadow)){
                            this.y = _local6;
                            _local4 = true;
                            break;
                        };
                        _local7++;
                    };
                    if (_local4){
                        this.x = _local2;
                        _local4 = false;
                        _local8 = 0;
                        while (_local8 < this.WORLD.arrSolid.length) {
                            if (this.shadow.hitTestObject(this.WORLD.arrSolid[_local8].shadow)){
                                _local4 = true;
                                break;
                            };
                            _local8++;
                        };
                        if (_local4){
                            this.x = _local2;
                            this.y = _local3;
                            this.stopWalking();
                        }
                        else {
                            if (this.nYStep <= this.nDuration){
                                this.nYStep++;
                            };
                        };
                    }
                    else {
                        if (this.nXStep <= this.nDuration){
                            this.nXStep++;
                        };
                    };
                }
                else {
                    if (this.nXStep <= this.nDuration){
                        this.nXStep++;
                    };
                    if (this.nYStep <= this.nDuration){
                        this.nYStep++;
                    };
                };
                if ((((((Math.round(_local2) == Math.round(this.x))) && ((Math.round(_local3) == Math.round(this.y))))) && ((((this.nXStep > 1)) || ((this.nYStep > 1)))))){
                    this.stopWalking();
                };
            }
            else {
                this.stopWalking();
            };
        }

        public function stopWalking():void{
            if (((!((this.mcChar == null))) && (this.mcChar.onMove))){
                this.mcChar.onMove = false;
                this.mcChar.gotoAndPlay("Idle");
                this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrameWalk);
            };
        }

        public function turn(_arg1:String):void{
            if ((((((_arg1 == "right")) && ((this.mcChar.scaleX < 0)))) || ((((_arg1 == "left")) && ((this.mcChar.scaleX > 0)))))){
                this.mcChar.scaleX = (this.mcChar.scaleX * -1);
            };
        }

        public function scale(_arg1:Number):void{
            if (this.mcChar != null){
                if ((this.mcChar.scaleX >= 0)){
                    this.mcChar.scaleX = _arg1;
                }
                else {
                    this.mcChar.scaleX = -(_arg1);
                };
                this.mcChar.scaleY = _arg1;
                this.shadow.scaleX = (this.shadow.scaleY = _arg1);
                this.pname.y = (-(this.mcChar.height) - 10);
            };
        }


    }
}//package 

