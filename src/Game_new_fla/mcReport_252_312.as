// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.mcReport_252_312

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.events.Event;
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

    public dynamic class mcReport_252_312 extends MovieClip 
    {

        public var btnClose:SimpleButton;
        public var tDesc:TextField;
        public var submit:MovieClip;
        public var iSel:int;
        public var bg:MovieClip;
        public var ti:TextField;
        public var tDetailTemplate:Array;
        public var mc:MovieClip;
        public var rootClass:MovieClip;
        public var i1:MovieClip;
        public var i2:MovieClip;
        public var i0:MovieClip;
        public var i3:MovieClip;

        public function mcReport_252_312()
        {
            addFrameScript(0, frame1, 4, frame5, 9, frame10, 14, frame15, 19, frame20);
        }
        public function itemClick(_arg1:MouseEvent)
        {
            var _local2:*;
            iSel = int(MovieClip(_arg1.currentTarget).name.substr(1));
            _local2 = 0;
            while (_local2 < 4) {
                if (mc[("i" + _local2)] != null){
                    mc[("i" + _local2)].d.f1.visible = (_local2 == iSel);
                };
                _local2++;
            };
            mc.submit.visible = true;
            if ((((((((tDetailTemplate.indexOf(tDesc.text) > -1)) || ((tDesc.text == "Type reason for report here.")))) || ((tDesc.text == " ")))) || ((tDesc.text == "")))){
                tDesc.text = tDetailTemplate[iSel];
            };
        }
        public function submitClick(_arg1:MouseEvent)
        {
            var _local2:*;
            var _local3:*;
            _local2 = MovieClip(stage.getChildAt(0));
            _local3 = MovieClip(parent);
            _local2.world.sendReport(["reportlang", _local3.fData.unm, iSel, tDesc.text]);
            _local3.onClose(null);
        }
        public function onClose(_arg1:Event=null):void
        {
            if (MovieClip(parent).currentLabel != "Init"){
                rootClass.mixer.playSound("Click");
                MovieClip(parent).gotoAndPlay("Init");
            };
        }
        function frame1()
        {
            iSel = -1;
            mc = MovieClip(this);
            tDetailTemplate = ["Type reason for report here.", "Type reason for report here.", "Type reason for report here.", "Type reason for report here."];
            rootClass = (stage.getChildAt(0) as MovieClip);
            if (rootClass.objServerInfo.iChat == 0){
                gotoAndPlay("limited");
            } else {
                gotoAndPlay("full");
            };
        }
        function frame5()
        {
            i0.addEventListener(MouseEvent.CLICK, itemClick, false, 0, true);
            i1.addEventListener(MouseEvent.CLICK, itemClick, false, 0, true);
            i2.addEventListener(MouseEvent.CLICK, itemClick, false, 0, true);
            i3.addEventListener(MouseEvent.CLICK, itemClick, false, 0, true);
            submit.addEventListener(MouseEvent.CLICK, submitClick, false, 0, true);
            btnClose.addEventListener(MouseEvent.CLICK, onClose, false, 0, true);
            i0.buttonMode = true;
            i1.buttonMode = true;
            i2.buttonMode = true;
            i3.buttonMode = true;
            submit.buttonMode = true;
            i0.d.f1.visible = false;
            i1.d.f1.visible = false;
            i2.d.f1.visible = false;
            i3.d.f1.visible = false;
            submit.visible = false;
            ti.text = MovieClip(parent).fData.unm;
        }
        function frame10()
        {
            stop();
        }
        function frame15()
        {
            i1.addEventListener(MouseEvent.CLICK, itemClick, false, 0, true);
            submit.addEventListener(MouseEvent.CLICK, submitClick, false, 0, true);
            btnClose.addEventListener(MouseEvent.CLICK, onClose, false, 0, true);
            i1.buttonMode = true;
            submit.buttonMode = true;
            i1.d.f1.visible = false;
            submit.visible = false;
            ti.text = MovieClip(parent).fData.unm;
        }
        function frame20()
        {
            stop();
        }

    }
}//package Game_new_fla

