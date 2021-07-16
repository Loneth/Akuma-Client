// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//mapData

package {
    import flash.display.MovieClip;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

    public class mapData {

        private var rootClass:MovieClip;
        private var qID:int;
        private var qAccepted:Boolean;
        private var qTimer:Timer;

        public function mapData(_arg1:MovieClip){
            this.rootClass = _arg1;
        }

        public function initObjSess(_arg1:Array, _arg2:Array):void{
            var _local3:uint;
            if (this.rootClass.world.objSession[this.rootClass.world.strMapName] == null){
                this.rootClass.world.objSession[this.rootClass.world.strMapName] = new Object();
                _local3 = 0;
                while (_local3 < _arg1.length) {
                    this.initClicky(_arg2[_local3], _arg1[_local3]);
                    _local3++;
                };
            };
        }

        public function updateSessArray(_arg1:String, _arg2:int=0):void{
            this.rootClass.world.objSession[this.rootClass.world.strMapName][(_arg1 + _arg2)] = true;
        }

        public function checkSess(_arg1:String, _arg2:int=0):Boolean{
            return (this.rootClass.world.objSession[this.rootClass.world.strMapName][(_arg1 + _arg2)]);
        }

        public function checkSessArr(_arg1:String, _arg2:Array):Boolean{
            var _local3:* = this.checkSess(_arg1, (_arg2[0] - 1));
            var _local4:uint = 1;
            while (_local4 < _arg2.length) {
                _local3 = ((_local3) && (this.checkSess(_arg1, (_arg2[_local4] - 1))));
                _local4++;
            };
            return (_local3);
        }

        public function completeQuest(_arg1:int, _arg2:Boolean=false):void{
            var _local3:*;
            if (_arg2){
                if (this.rootClass.world.isQuestInProgress(_arg1)){
                    _local3 = this.rootClass.world.questTree[_arg1];
                    if (_local3 != null){
                        if (((((!(this.isOneTimeQuestDone(_local3))) && (!((_local3.status == null))))) && ((_local3.status == "c")))){
                            this.rootClass.world.tryQuestComplete(_arg1);
                        };
                    }
                    else {
                        this.rootClass.world.tryQuestComplete(_arg1);
                    };
                };
            }
            else {
                this.rootClass.world.tryQuestComplete(_arg1);
            };
        }

        public function delayedTurnin(_arg1:int, _arg2:Boolean=false):void{
            this.qID = _arg1;
            this.qAccepted = _arg2;
            this.qTimer = new Timer(3000, 1);
            this.qTimer.addEventListener(TimerEvent.TIMER, this.onQuestTimer, false, 0, true);
            this.qTimer.start();
        }

        public function checkChaos():Boolean{
            var _local1:* = this.rootClass.world.getAchievement("ia1", 20);
            _local1 = (_local1 | this.rootClass.world.getAchievement("ia1", 21));
            _local1 = (_local1 | this.rootClass.world.getAchievement("ia1", 22));
            _local1 = (_local1 | this.rootClass.world.getAchievement("ia1", 23));
            return (_local1);
        }

        private function onQuestTimer(_arg1:TimerEvent):void{
            this.qTimer.stop();
            this.qTimer.removeEventListener(TimerEvent.TIMER, this.onQuestTimer);
            this.completeQuest(this.qID, this.qAccepted);
        }

        private function initClicky(_arg1:int, _arg2:String):void{
            var _local3:uint;
            while (_local3 < _arg1) {
                this.rootClass.world.objSession[this.rootClass.world.strMapName][(_arg2 + _local3)] = false;
                _local3++;
            };
        }

        private function isOneTimeQuestDone(_arg1):Boolean{
            return ((((_arg1.bOnce == 1)) && ((((_arg1.iSlot < 0)) || ((this.rootClass.world.getQuestValue(_arg1.iSlot) >= _arg1.iValue))))));
        }


    }
}//package 

