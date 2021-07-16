// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//mcLevel

package 
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.display.*;
    import flash.events.*;
    import flash.text.TextField;

    public class mcGoldNewStacia extends MovieClip 
    {

        public var rootClass;
		public var btnOpen:SimpleButton;
		public var btnClose:SimpleButton;
		public var mcGold:MovieClip;
		public var mcSilver:MovieClip;
		public var mcCopper:MovieClip;
		public var mcCoin:MovieClip;
		public var strGold:TextField;
		public var strSilver:TextField;
		public var strCopper:TextField;
		public var strCoins:TextField;

        public function mcGoldNewStacia()
        {
            rootClass = MovieClip(stage.getChildAt(0));
            addFrameScript(0, frame1, 1, frame2);
        }
		
        public function frame1()
        {
			btnOpen.addEventListener(MouseEvent.CLICK, onOpenClick);
			mcCopper.visible = false;
			mcSilver.visible = false;
			mcGold.visible = false;
			mcCoin.visible = false;
			strCoins.visible = false;
			strGold.visible = false;
			strSilver.visible = false;
			strCopper.visible = false;
			rootClass.mixer.playSound("Click");
            stop();
        }
		
		public function frame2()
		{
			btnClose.addEventListener(MouseEvent.CLICK, onCloseClick);
			mcCopper.visible = true;
			mcSilver.visible = true;
			mcGold.visible = true;
			mcCoin.visible = true;
			strCoins.visible = true;
			strGold.visible = true;
			strSilver.visible = true;
			strCopper.visible = true;
			rootClass.mixer.playSound("Click");
			stop();
		}
		
		public function onOpenClick(_arg1:MouseEvent)
        {
            gotoAndStop(2);
        }
		
		
		public function onCloseClick(_arg1:MouseEvent)
        {
            gotoAndStop(1);
        }
    }
}//package 

