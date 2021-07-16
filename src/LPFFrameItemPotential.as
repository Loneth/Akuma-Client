// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFFrameSlotDisplay

package {
    import flash.text.TextField;
    import flash.display.MovieClip;
	import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFFrameItemPotential extends LPFFrame {

        private var rootClass:MovieClip;
		private var iSel:Object;
		public var mcPotentialBar:MovieClip;

        public function LPFFrameItemPotential():void{
            x = 0;
            y = 0;
            fData = {};
        }

        override public function fOpen(_arg1:Object):void{
            rootClass = MovieClip(stage.getChildAt(0));
            fData = _arg1.fData;
            positionBy(_arg1.r);
            if (("eventTypes" in _arg1)){
                eventTypes = _arg1.eventTypes;
            };
            fDraw();
            getLayout().registerForEvents(this, eventTypes);
        }

        override public function fClose():void{
            fData = {};
            getLayout().unregisterFrame(this);
            if (parent != null){
                parent.removeChild(this);
            };
        }

        private function fDraw():void{
			var sItem:Object = iSel;
			this.visible = false;
            if (sItem != null){
				this.visible = true;
				mcPotentialBar.strPotential.visible = false;	
				mcPotentialBar.strPotential.htmlText = (sItem.Potential) + " / 100";
				mcPotentialBar.mcPotential.scaleX = (sItem.Potential / 100);
				mcPotentialBar.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverPB);
				mcPotentialBar.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutPB);
            };
        }
		
		public function onMouseOverPB(_arg1:MouseEvent){
			mcPotentialBar.strPotential.visible = true;
        }
		
		public function onMouseOutPB(_arg1:MouseEvent){
			mcPotentialBar.strPotential.visible = false;
        }

        override public function notify(_arg1:Object):void{
			iSel = null;
			if (_arg1.fData.bSel != null){
                iSel = _arg1.fData.bSel;
            };
            if (_arg1.fData.eSel != null){
                iSel = _arg1.fData.eSel;
            };
            if (_arg1.fData.iSel != null){
                iSel = _arg1.fData.iSel;
            };
            fDraw();
        }


    }
}//package 

