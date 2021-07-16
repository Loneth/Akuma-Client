// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//ActionImpactTimer

package {
    import flash.events.EventDispatcher;
    import flash.utils.Timer;
    import flash.display.MovieClip;
    import flash.events.TimerEvent;
    import flash.events.*;

    public class ActionImpactTimer extends EventDispatcher {

        var actID:int;
        var actionResult:Object;
        var aTimer:Timer;
        var world:MovieClip;


        public function showImpact(_arg1:int){
            this.aTimer = new Timer(_arg1, 1);
            this.aTimer.addEventListener(TimerEvent.TIMER, this.triggerResult, false, 0, true);
            this.aTimer.start();
        }

        public function kill(){
            if (((!((this.aTimer == null))) && (this.aTimer.running))){
                this.aTimer.stop();
            };
            this.aTimer.removeEventListener(TimerEvent.TIMER, this.triggerResult);
            this.aTimer = null;
            this.actionResult = null;
            this.world = null;
        }

        public function triggerResult(_arg1:TimerEvent){
            this.world.showActionImpact(this.actionResult);
            this.kill();
        }


    }
}//package 

