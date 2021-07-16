// Decompiled by AS3 Sorcerer 1.40
// http://www.as3sorcerer.com/
 
//mcServerTime
 
package {
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import flash.utils.Timer;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.media.SoundMixer;
    import flash.media.SoundTransform;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    //import flash.external.ExternalInterface;
 
    public class mcServerTime extends MovieClip {
 
        private var rootClass:MovieClip;
        private var serverTimer:Timer;
        public var txtTime:TextField;

        public function mcServerTime(){
            serverTimer = new Timer(1000);
            super();
            addFrameScript(0, frame1);
            rootClass = MovieClip(stage.getChildAt(0));
        }
 
        private function timerHandler(_arg1:TimerEvent):void{
            txtTime.text = rootClass.date_server.toLocaleTimeString();
        }
 
        function frame1(){
            serverTimer.addEventListener(TimerEvent.TIMER, timerHandler, false, 0, true);
            serverTimer.start();
            stop();
        }
 
    }
}//package