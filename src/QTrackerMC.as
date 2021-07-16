// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//QTrackerMC

package {
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.MouseEvent;
	import flash.events.TextEvent;
    import flash.events.Event;
    import flash.text.*;

    public class QTrackerMC extends MovieClip {

        public var bMask:MovieClip;
        public var bg:MovieClip;
        public var scr:MovieClip;
        public var close:SimpleButton;
        public var txtDetail:TextField;
        public var rootClass:MovieClip;
		public var regExpLinking2:RegExp;
		public var regExpSPACE:RegExp;
		public var mapId:int;
		public var frame:String;
		public var cell:String;
        var mDown:Boolean = false;
        var mbY;
        var mhY;
        var drag:Object;

        public function QTrackerMC():void{
			regExpSPACE = /(\s{2,})/gi;
			regExpLinking2 = /<\s*FONT\b.*?>(.*?)<\s*\/FONT\s*>/gi;
            drag = new Object();
            super();
            addFrameScript(0, frame1);
            visible = false;
        }

        private function initOpen():void{
            rootClass = MovieClip(this.stage.getChildAt(0));
            scr.hit.alpha = 0;
            txtDetail.autoSize = "left";
            close.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
            this.addEventListener(MouseEvent.ROLL_OVER, onRollOver, false, 0, true);
            this.addEventListener(MouseEvent.ROLL_OUT, onRollOut, false, 0, true);
            this.addEventListener(MouseEvent.MOUSE_DOWN, onMoveClick, false, 0, true);
        }

        private function onCloseClick(_arg1:MouseEvent):void{
            visible = false;
        }

        private function onRollOver(_arg1:MouseEvent):void{
            bg.visible = true;
            scr.visible = (txtDetail.height > scr.height);
            close.visible = true;
        }

        private function onRollOut(_arg1:MouseEvent):void{
            bg.visible = false;
            scr.visible = false;
            close.visible = false;
        }

        public function updateQuest():void{
            var _local2:*;
            var _local4:*;
            var _local5:String;
            var _local6:int;
            var _local7:*;
            var _local8:*;
            var _local9:*;
			var mapID:*;
			var frame:*;
			var cell:*;
            txtDetail.htmlText = "";
            var _local1:int;
            for (_local2 in rootClass.world.questTree) {
                _local4 = rootClass.world.questTree[_local2];
                if (_local4.status != null){
                    _local1++;
                    txtDetail.htmlText = (txtDetail.htmlText + (("<font color='#00CC00'><b>" + _local4.sName) + "</b></font>"));
                    if (((!((_local4.turnin == null))) && ((_local4.turnin.length > 0)))){
                        _local5 = "";
                        _local6 = 0;
                        while (_local6 < _local4.turnin.length) {
                            _local7 = rootClass.world.invTree[_local4.turnin[_local6].ItemID];
                            _local8 = _local7.sName;
							mapID = int(_local4.turnin[_local6].MapID);
							frame = _local4.turnin[_local6].Frame;
							cell = _local4.turnin[_local6].Cell;
                            _local9 = int(_local4.turnin[_local6].iQty);
                            if (_local6 > 0){
                                _local5 = (_local5 + ",<br>");
                            };							
							_local5 = (_local5 + ((((("    <u><a href='event:" + "," + mapID + "," + frame + "," + cell + "'>" +  _local8) + "</a></u> ") + _local7.iQty) + "/") + _local9));
							_local6++;
                        };
                        txtDetail.htmlText = (txtDetail.htmlText + _local5);
						txtDetail.addEventListener(TextEvent.LINK, onTextFieldLink);
                    };
                };
            };
            if (_local1 == 0){
                txtDetail.htmlText = "You are not on any quest!";
            };
            close.x = ((txtDetail.x + txtDetail.textWidth) + 10);
            bg.width = (close.x + 20);
            var _local3:* = ((txtDetail.y + txtDetail.textHeight) + 10);
            if (_local3 > 108){
                _local3 = 108;
            };
            bg.height = _local3;
            if (txtDetail.height > scr.height){
                scr.visible = true;
                scr.x = (close.x + 5);
                scr.hit.addEventListener(MouseEvent.MOUSE_DOWN, scrDown, false, 0, true);
            }
            else {
                scr.visible = false;
            };
        }
		
		function onTextFieldLink(e:TextEvent):void
		{
			mapId = e.text.split(",")[1];
			frame = e.text.split(",")[2];
			cell = e.text.split(",")[3];
			
			rootClass.chatF.submitMsg("/casting", "emotea", rootClass.sfc.myUserName);
			var castObj:* = {};
			castObj.typ = "generic";
			castObj.callback = joinCallback;
			castObj.args = {str:"Cast Complete"};
			castObj.dur = 15;
			castObj.txt = "Teleporting...";
			rootClass.ui.mcCastBar.fOpenWith(castObj);
		}
		
		public function joinCallback(_arg1):void{
            rootClass.sfc.sendXtMessage("zm", "gqr", [mapId, frame, cell], "str", 1);
        }

        private function scrDown(_arg1:MouseEvent){
            mDown = true;
            mbY = int(mouseY);
            mhY = int(MovieClip(_arg1.currentTarget.parent).h.y);
            stage.addEventListener(MouseEvent.MOUSE_UP, scrUp, false, 0, true);
            scr.h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
        }

        private function scrUp(_arg1:MouseEvent){
            mDown = false;
            stage.removeEventListener(MouseEvent.MOUSE_UP, scrUp);
            scr.h.addEventListener(Event.ENTER_FRAME, hEF);
        }

        private function hEF(_arg1:Event){
            var _local2:*;
            var _local3:*;
            var _local4:*;
            if (mDown){
                scr.h.y = (mhY + (int(mouseY) - mbY));
                if ((scr.h.y + scr.h.height) > scr.b.height){
                    scr.h.y = int((scr.b.height - scr.h.height));
                };
                if (scr.h.y < 0){
                    scr.h.y = 0;
                };
                _local2 = (-(scr.h.y) / (scr.b.height - scr.h.height));
                _local3 = (txtDetail.height - scr.b.height);
                _local4 = (int((_local2 * _local3)) + 22);
                txtDetail.y = _local4;
            };
        }

        public function toggle():void{
            visible = !(visible);
            if (visible){
                updateQuest();
            };
        }

        public function onMoveClick(_arg1:MouseEvent):void{
            if (((!((_arg1.target == close))) && (!((_arg1.target == scr.hit))))){
                drag.ox = this.x;
                drag.oy = this.y;
                drag.mox = stage.mouseX;
                drag.moy = stage.mouseY;
                stage.addEventListener(MouseEvent.MOUSE_UP, onMoveRelease, false, 0, true);
                this.addEventListener(Event.ENTER_FRAME, onMoveEnterFrame, false, 0, true);
            };
        }

        public function onMoveRelease(_arg1:MouseEvent):void{
            stage.removeEventListener(MouseEvent.MOUSE_UP, onMoveRelease);
            this.removeEventListener(Event.ENTER_FRAME, onMoveEnterFrame);
        }

        public function onMoveEnterFrame(_arg1:Event){
            this.x = (drag.ox + (stage.mouseX - drag.mox));
            if (this.x < 0){
                this.x = 0;
            };
            if ((this.x + bg.width) > 1260){
                this.x = (1260 - bg.width);
            };
            this.y = (drag.oy + (stage.mouseY - drag.moy));
            if (this.y < 0){
                this.y = 0;
            };
            if ((this.y + bg.height) > 500){
                this.y = (500 - bg.height);
            };
        }

        function frame1(){
            initOpen();
            stop();
        }


    }
}//package 

