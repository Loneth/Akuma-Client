// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.ui_73

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.net.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import flash.ui.*;
    import flash.external.*;
    import flash.accessibility.*;
    import flash.errors.*;

    public dynamic class ui_73 extends MovieClip 
    {

        public var HelpStack:MovieClip;
        public var mcScene:MovieClip;
        public var btnTargetPortraitClose:SimpleButton;
        public var mcPadNames:MovieClip;
        public var mcRes:MovieClip;
        public var mcPVPScore:MovieClip;
        public var mcInterface:MovieClip;
        public var mcSkillUp:MovieClip;
        public var mcUpdates:MovieClip;
        public var mcPortrait:MovieClip;
        public var cMenu:cMenuMC;
        public var mcPartyFrame:MovieClip;
        public var mcRecount:MovieClip;
        public var ModalStack:MovieClip;
        public var mcOFrame:OFrameMC;
        public var mcPortraitTarget:MovieClip;
        public var mcPopup:MovieClip;
        public var ToolTip:ToolTipMC;
        public var mcPVPQueue:MovieClip;
		public var mcHPPVPQueue:MovieClip;
        public var mcGUA:MovieClip;
        public var dropStack:MovieClip;
        public var mcCastBar:CastBarMC;
        public var mcQuestTrace:MovieClip;
        public var mcSystemMsg:MovieClip;

        public function ui_73()
        {
            addFrameScript(0, frame1);
        }
        function frame1()
        {
            mcSystemMsg.mouseEnabled = false;
            mcSystemMsg.mouseChildren = false;
            mcUpdates.mouseEnabled = false;
            mcUpdates.mouseChildren = false;
        }

    }
}//package Game_new_fla

