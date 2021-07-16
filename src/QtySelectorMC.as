// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//QtySelectorMC

package {
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.display.MovieClip;
    import flash.geom.Point;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;

    public class QtySelectorMC extends Sprite {

        public var t1:TextField;
        public var t2:TextField;
        public var handle:MovieClip;
        public var bar:MovieClip;
        private var _min:int = 1;
        private var _max:int = 1;
        private var _val:int = 1;
        private var isMouseDown:Boolean = false;
        private var p:Point;
        private var n:Number = 0;
        private var w:int = 0;
        private var dx:int = 0;
        private var rootClass:MovieClip;
        private var _parent:MovieClip;

        public function QtySelectorMC(_arg1, _arg2:MovieClip, _arg3:int, _arg4:int):void{
            this.p = new Point();
            super();
            this.rootClass = _arg2;
            this._parent = _arg1;
            this._val = (this._min = _arg3);
            this._max = _arg4;
            this.w = (this.bar.width - this.handle.width);
            this.t2.htmlText = (("<font color='#FFFFFF'>" + this._max) + "</font>");
            addEventListener(Event.ENTER_FRAME, this.onEF, false, 0, true);
            this.handle.addEventListener(MouseEvent.MOUSE_DOWN, this.onDn, false, 0, true);
            this._parent.addEventListener(MouseEvent.MOUSE_UP, this.onUp, false, 0, true);
            this.t1.addEventListener(KeyboardEvent.KEY_DOWN, this.onKey);
            this.t1.restrict = "0123456789";
            this.t1.maxChars = 3;
            this.handle.buttonMode = true;
            this.updateHandle();
            this.update();
        }

        private function update():void{
            if (this._val == this._max){
                this.t1.htmlText = (("<font color='#FFFFFF'>" + this._val) + "</font>");
            }
            else {
                this.t1.htmlText = (("<font color='#999999'>" + this._val) + "</font>");
            };
        }

        private function updateHandle():void{
            this.handle.x = Math.round((this.bar.x + (this.w * (this._val / this._max))));
        }

        private function onEF(_arg1:Event):void{
            if (this.isMouseDown){
                this.p.x = stage.mouseX;
                this.p.y = stage.mouseY;
                this.p = globalToLocal(this.p);
                this.p.x = (this.p.x - this.dx);
                this.handle.x = (this.n = Math.max(Math.min(this.p.x, (this.bar.x + this.w)), this.bar.x));
                this.n = (this.n - this.bar.x);
                this.n = (this.n / this.w);
                this._val = (Math.round((this.n * (this._max - 1))) + 1);
                this.update();
            };
        }

        private function onDn(_arg1:MouseEvent):void{
            this.isMouseDown = true;
            this.p.x = stage.mouseX;
            this.p.y = stage.mouseY;
            this.p = globalToLocal(this.p);
            this.dx = (this.p.x - this.handle.x);
        }

        private function onUp(_arg1:MouseEvent):void{
            this.isMouseDown = false;
        }

        private function onKey(_arg1:KeyboardEvent):void{
            if ((((_arg1.charCode == Keyboard.ENTER)) || ((_arg1.charCode == Keyboard.ESCAPE)))){
                this.val;
                this.update();
                this.updateHandle();
                this.rootClass.stage.focus = null;
            };
        }

        public function killButtons():void{
            removeEventListener(Event.ENTER_FRAME, this.onEF);
            this.handle.removeEventListener(MouseEvent.MOUSE_UP, this.onDn);
            this._parent.removeEventListener(MouseEvent.MOUSE_UP, this.onUp);
        }

        public function fClose():void{
            this.killButtons();
            parent.removeChild(this);
        }

        public function get val():int{
            if (this._val != int(this.t1.text)){
                this._val = int(this.t1.text);
            };
            this._val = Math.max(Math.min(this._val, this._max), this._min);
            return (this._val);
        }

        public function set val(_arg1:int):void{
            this._val = Math.max(Math.min(_arg1, this._max), this._min);
        }


    }
}//package 

