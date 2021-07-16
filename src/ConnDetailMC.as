// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//ConnDetailMC

package {
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import flash.utils.Timer;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.events.Event;

    public class ConnDetailMC extends MovieClip {

		public var mcTitle:MovieClip;
		public var logo:MovieClip;
		public var loading_bar:MovieClip;
        public var mcPct:TextField;
        public var txtBack:TextField;
        public var mcSpinner:MovieClip;
        public var txtDetail:TextField;
        public var btnBack:SimpleButton;
        private var timerConnDetail:Timer;
        public var rootClass:MovieClip;
        private var minutes:int;
        private var countDownTimer:Timer;
        private var firstJoin:Boolean = false;

        public function ConnDetailMC(_arg1:MovieClip){
            timerConnDetail = new Timer(10000, 1);
            super();
            rootClass = _arg1;
            txtBack.mouseEnabled = false;
            mcPct.visible = false;
            btnBack.addEventListener(MouseEvent.CLICK, onBackClick, false, 0, true);
            timerConnDetail.removeEventListener(TimerEvent.TIMER, showBackButton);
            timerConnDetail.addEventListener(TimerEvent.TIMER, showBackButton, false, 0, true);
        }

        function onBackClick(_arg1:MouseEvent=null):void{
            rootClass.logout();
            hideConn();
        }

        public function showConn(_arg1:String, _arg2:Boolean=false):void{
            btnBack.visible = false;
            txtBack.visible = false;
            txtBack.text = "Cancel";
            txtDetail.text = _arg1;
            firstJoin = _arg2;
            if (stage == null){
                rootClass.addChild(this);
            };
            if (!timerConnDetail.running){
                timerConnDetail.reset();
                timerConnDetail.start();
            };
        }

        public function showDisconnect(_arg1:String):void{
            btnBack.visible = true;
            txtBack.visible = true;
            txtBack.text = "Back";
            txtDetail.text = _arg1;
            mcSpinner.visible = false;
            mcPct.visible = false;
            if (stage == null){
                rootClass.addChild(this);
            };
            if (timerConnDetail.running){
                timerConnDetail.stop();
            };
        }

        public function showBackButton(_arg1:TimerEvent=null):void{
            btnBack.visible = true;
            txtBack.visible = true;
        }

        public function showError(_arg1:String):void{
            if (stage == null){
                rootClass.addChild(this);
            };
            txtDetail.htmlText = _arg1;
            txtBack.text = ((firstJoin) ? "Try Again" : "Back");
            showBackButton();
        }

        public function hideConn():void{
            if (stage != null){
                rootClass.removeChild(this);
            };
        }

        public function showCountDown(_arg1:int):void{
            countDownTimer = new Timer(60000, 1);
            minutes = _arg1;
            this.addEventListener(Event.REMOVED_FROM_STAGE, onRemove, false, 0, true);
            countDownTimer.addEventListener(TimerEvent.TIMER, onCountdown, false, 0, true);
            countDownTimer.start();
        }

        private function onRemove(_arg1:Event):void{
            countDownTimer.removeEventListener(TimerEvent.TIMER, onCountdown);
        }

        private function onCountdown(_arg1:TimerEvent):void{
            minutes--;
            countDownTimer.stop();
            if (minutes > 0){
                countDownTimer.reset();
                countDownTimer.start();
            }
            else {
                countDownTimer.removeEventListener(TimerEvent.TIMER, onCountdown);
            };
        }


    }
}//package 

