// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//mcLevel

package 
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.display.*;
    import flash.events.*;

    public class mcLevel extends MovieClip 
    {

        public var rootClass;

        public function mcLevel()
        {
            stop();
            rootClass = MovieClip(stage.getChildAt(0));
            addFrameScript(0, frame1, 1, frame2);
        }
        public function frame1()
        {
            stop();
            this.removeEventListener(MouseEvent.MOUSE_OVER, levelIconOver);
            this.removeEventListener(MouseEvent.MOUSE_OUT, levelIconOut);
        }
        public function frame2()
        {
            stop();
            this.addEventListener(MouseEvent.MOUSE_OVER, levelIconOver, false, 0, true);
            this.addEventListener(MouseEvent.MOUSE_OUT, levelIconOut, false, 0, true);
        }
        public function levelIconOver(_arg1:MouseEvent)
        {
            rootClass.ui.ToolTip.openWith({str:"Target is more higher level than you."});
        }
        public function levelIconOut(_arg1:MouseEvent)
        {
            rootClass.ui.ToolTip.close();
        }

    }
}//package 

